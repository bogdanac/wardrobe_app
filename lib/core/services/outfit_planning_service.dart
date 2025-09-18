import '../../domain/entities/outfit_planning_models.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/calendar_integration.dart';
import '../../domain/entities/personalization_models.dart';
import '../../data/repositories/outfit_planning_repository.dart';
import 'weather_service.dart';
import 'calendar_service.dart';
import 'personalization_service.dart';

class OutfitPlanningService {
  final OutfitPlanningRepository _repository;
  final WeatherService _weatherService;
  final CalendarService _calendarService;
  final PersonalizationService _personalizationService;

  OutfitPlanningService(
    this._repository,
    this._weatherService,
    this._calendarService,
    this._personalizationService,
  );

  // Create an outfit plan for a specific date
  Future<OutfitPlan> createOutfitPlan({
    required DateTime date,
    required String userId,
    String? outfitId,
    String? occasion,
    String? notes,
    Map<String, dynamic>? preferences,
  }) async {
    try {
      final plan = OutfitPlan()
        ..userId = userId
        ..plannedDate = date
        ..outfitId = outfitId
        ..occasion = occasion ?? ''
        ..notes = notes ?? ''
        ..preferences = preferences ?? {}
        ..status = PlanStatus.planned
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      // Get weather forecast for the date
      final weather = await _weatherService.getWeatherForDate(date);
      if (weather != null) {
        plan.weatherData = weather.toJson();
        plan.expectedTemperature = weather.temperature;
        plan.weatherCondition = weather.condition;
      }

      // Check for calendar events on this date
      final events = await _calendarService.analyzeEventsForOutfitSuggestions(date: date);
      if (events.isNotEmpty) {
        plan.calendarEvents = events.map((e) => e.eventTitle).toList();
        if (occasion == null || occasion.isEmpty) {
          plan.occasion = events.first.occasion;
        }
      }

      final planId = await _repository.savePlan(plan);
      plan.id = planId;

      return plan;
    } catch (e) {
      throw Exception('Failed to create outfit plan: $e');
    }
  }

  // Get outfit plans for a date range
  Future<List<OutfitPlan>> getPlansForDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      return await _repository.getPlansForDateRange(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
    } catch (e) {
      throw Exception('Failed to get outfit plans: $e');
    }
  }

  // Get outfit plan for a specific date
  Future<OutfitPlan?> getPlanForDate({
    required String userId,
    required DateTime date,
  }) async {
    try {
      return await _repository.getPlanForDate(userId: userId, date: date);
    } catch (e) {
      return null;
    }
  }

  // Generate weekly outfit schedule
  Future<WeeklyOutfitSchedule> generateWeeklySchedule({
    required String userId,
    required DateTime weekStart,
    bool considerWeather = true,
    bool considerCalendar = true,
    bool considerPreferences = true,
  }) async {
    try {
      final schedule = WeeklyOutfitSchedule()
        ..userId = userId
        ..weekStart = weekStart
        ..weekEnd = weekStart.add(const Duration(days: 6))
        ..createdAt = DateTime.now();

      final plans = <OutfitPlan>[];

      // Generate plans for each day of the week
      for (int i = 0; i < 7; i++) {
        final date = weekStart.add(Duration(days: i));
        
        // Check if plan already exists
        var existingPlan = await getPlanForDate(userId: userId, date: date);
        
        if (existingPlan == null) {
          // Create new plan with smart suggestions
          final suggestions = await _generateSmartOutfitSuggestions(
            userId: userId,
            date: date,
            considerWeather: considerWeather,
            considerCalendar: considerCalendar,
            considerPreferences: considerPreferences,
          );

          existingPlan = OutfitPlan()
            ..userId = userId
            ..plannedDate = date
            ..status = PlanStatus.suggested
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now();

          if (suggestions.isNotEmpty) {
            existingPlan.outfitId = suggestions.first.id.toString();
            existingPlan.occasion = suggestions.first.occasion;
            existingPlan.confidenceScore = 0.8; // Default confidence since property doesn't exist
            existingPlan.suggestions = suggestions.map((s) => {
              'eventId': s.eventId,
              'eventTitle': s.eventTitle,
              'occasion': s.occasion,
              'dressCode': s.dressCode,
            }).toList();
          }

          // Get weather for this date
          if (considerWeather) {
            final weather = await _weatherService.getWeatherForDate(date);
            if (weather != null) {
              existingPlan.weatherData = weather.toJson();
              existingPlan.expectedTemperature = weather.temperature;
              existingPlan.weatherCondition = weather.condition;
            }
          }

          // Check calendar events
          if (considerCalendar) {
            final events = await _calendarService.analyzeEventsForOutfitSuggestions(date: date);
            if (events.isNotEmpty) {
              existingPlan.calendarEvents = events.map((e) => e.eventTitle).toList();
              if (existingPlan.occasion.isEmpty) {
                existingPlan.occasion = events.first.occasion;
              }
            }
          }

          await _repository.savePlan(existingPlan);
        }

        plans.add(existingPlan);
      }

      schedule.plans = plans;
      schedule.isComplete = plans.every((p) => p.outfitId != null);
      
      await _repository.saveWeeklySchedule(schedule);
      
      return schedule;
    } catch (e) {
      throw Exception('Failed to generate weekly schedule: $e');
    }
  }

  // Update outfit plan
  Future<void> updateOutfitPlan({
    required String planId,
    String? outfitId,
    String? occasion,
    String? notes,
    PlanStatus? status,
    Map<String, dynamic>? preferences,
  }) async {
    try {
      final numericId = int.tryParse(planId);
      if (numericId == null) throw Exception('Invalid plan ID');

      final plan = await _repository.getPlan(numericId);
      if (plan == null) throw Exception('Plan not found');

      if (outfitId != null) plan.outfitId = outfitId;
      if (occasion != null) plan.occasion = occasion;
      if (notes != null) plan.notes = notes;
      if (status != null) plan.status = status;
      if (preferences != null) plan.preferences = preferences;

      plan.updatedAt = DateTime.now();

      await _repository.savePlan(plan);
    } catch (e) {
      throw Exception('Failed to update outfit plan: $e');
    }
  }

  // Mark outfit as worn
  Future<void> markOutfitAsWorn({
    required String planId,
    DateTime? wornAt,
    int? satisfactionRating,
    String? feedback,
  }) async {
    try {
      final numericId = int.tryParse(planId);
      if (numericId == null) throw Exception('Invalid plan ID');

      final plan = await _repository.getPlan(numericId);
      if (plan == null) throw Exception('Plan not found');

      plan.status = PlanStatus.completed;
      plan.wornAt = wornAt ?? DateTime.now();
      plan.satisfactionRating = satisfactionRating;
      plan.feedback = feedback;
      plan.updatedAt = DateTime.now();

      await _repository.savePlan(plan);

      // Record this as user interaction for personalization
      if (plan.outfitId != null) {
        await _personalizationService.recordUserInteraction(
          type: UserInteractionType.worn,
          targetId: plan.outfitId!,
          context: {
            'date': plan.plannedDate.toIso8601String(),
            'occasion': plan.occasion,
            'satisfaction': satisfactionRating,
            'feedback': feedback,
            'weather': plan.weatherCondition,
            'temperature': plan.expectedTemperature,
          },
        );
      }
    } catch (e) {
      throw Exception('Failed to mark outfit as worn: $e');
    }
  }

  // Get outfit planning analytics
  Future<OutfitPlanningAnalytics> getPlanningAnalytics({
    required String userId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final start = startDate ?? DateTime.now().subtract(const Duration(days: 30));
      final end = endDate ?? DateTime.now();

      final plans = await _repository.getPlansForDateRange(
        userId: userId,
        startDate: start,
        endDate: end,
      );

      final totalPlans = plans.length;
      final completedPlans = plans.where((p) => p.status == PlanStatus.completed).length;
      final averageSatisfaction = plans
          .where((p) => p.satisfactionRating != null)
          .map((p) => p.satisfactionRating!)
          .fold(0.0, (a, b) => a + b) / totalPlans.clamp(1, double.infinity);

      // Analyze most worn occasions
      final occasionCounts = <String, int>{};
      for (final plan in plans.where((p) => p.status == PlanStatus.completed)) {
        if (plan.occasion.isNotEmpty) {
          occasionCounts[plan.occasion] = (occasionCounts[plan.occasion] ?? 0) + 1;
        }
      }

      // Analyze planning patterns
      final planningDaysAhead = plans
          .where((p) => p.status == PlanStatus.planned)
          .map((p) => p.plannedDate.difference(p.createdAt).inDays)
          .toList();

      final averagePlanningDaysAhead = planningDaysAhead.isNotEmpty
          ? planningDaysAhead.reduce((a, b) => a + b) / planningDaysAhead.length
          : 0.0;

      return OutfitPlanningAnalytics(
        totalPlans: totalPlans,
        completedPlans: completedPlans,
        completionRate: totalPlans > 0 ? completedPlans / totalPlans : 0.0,
        averageSatisfactionRating: averageSatisfaction,
        mostWornOccasions: occasionCounts.entries
            .toList()
            ..sort((a, b) => b.value.compareTo(a.value)),
        averagePlanningDaysAhead: averagePlanningDaysAhead,
        planningConsistency: _calculatePlanningConsistency(plans),
        weatherAccuracy: _calculateWeatherAccuracy(plans),
      );
    } catch (e) {
      throw Exception('Failed to get planning analytics: $e');
    }
  }

  // Set up outfit reminders
  Future<void> setupOutfitReminders({
    required String userId,
    required List<OutfitReminder> reminders,
  }) async {
    try {
      for (final reminder in reminders) {
        reminder.userId = userId;
        reminder.createdAt = DateTime.now();
        await _repository.saveReminder(reminder);
      }
    } catch (e) {
      throw Exception('Failed to setup outfit reminders: $e');
    }
  }

  // Get upcoming reminders
  Future<List<OutfitReminder>> getUpcomingReminders({
    required String userId,
    int daysAhead = 7,
  }) async {
    try {
      final endDate = DateTime.now().add(Duration(days: daysAhead));
      return await _repository.getRemindersForDateRange(
        userId: userId,
        startDate: DateTime.now(),
        endDate: endDate,
      );
    } catch (e) {
      return [];
    }
  }

  // Auto-schedule outfits based on calendar and preferences
  Future<List<OutfitPlan>> autoScheduleOutfits({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
    bool overwriteExisting = false,
  }) async {
    try {
      final autoScheduledPlans = <OutfitPlan>[];
      
      var currentDate = startDate;
      while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
        // Skip if plan already exists and not overwriting
        final existingPlan = await getPlanForDate(userId: userId, date: currentDate);
        if (existingPlan != null && !overwriteExisting) {
          currentDate = currentDate.add(const Duration(days: 1));
          continue;
        }

        // Generate smart suggestions for this date
        final suggestions = await _generateSmartOutfitSuggestions(
          userId: userId,
          date: currentDate,
          considerWeather: true,
          considerCalendar: true,
          considerPreferences: true,
        );

        if (suggestions.isNotEmpty) {
          final topSuggestion = suggestions.first;
          
          final plan = OutfitPlan()
            ..userId = userId
            ..plannedDate = currentDate
            ..outfitId = topSuggestion.id.toString()
            ..occasion = topSuggestion.occasion
            ..status = PlanStatus.autoScheduled
            ..confidenceScore = 0.8 // Default confidence since property doesn't exist
            ..suggestions = suggestions.map((s) => {
              'eventId': s.eventId,
              'eventTitle': s.eventTitle,
              'occasion': s.occasion,
              'dressCode': s.dressCode,
            }).toList()
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now();

          // Add weather data
          final weather = await _weatherService.getWeatherForDate(currentDate);
          if (weather != null) {
            plan.weatherData = weather.toJson();
            plan.expectedTemperature = weather.temperature;
            plan.weatherCondition = weather.condition;
          }

          // Add calendar events
          final events = await _calendarService.analyzeEventsForOutfitSuggestions(date: currentDate);
          if (events.isNotEmpty) {
            plan.calendarEvents = events.map((e) => e.eventTitle).toList();
          }

          await _repository.savePlan(plan);
          autoScheduledPlans.add(plan);
        }

        currentDate = currentDate.add(const Duration(days: 1));
      }

      return autoScheduledPlans;
    } catch (e) {
      throw Exception('Failed to auto-schedule outfits: $e');
    }
  }

  // Private helper methods
  Future<List<OutfitSuggestion>> _generateSmartOutfitSuggestions({
    required String userId,
    required DateTime date,
    bool considerWeather = true,
    bool considerCalendar = true,
    bool considerPreferences = true,
  }) async {
    final suggestions = <OutfitSuggestion>[];

    try {
      // Get calendar events for the date
      List<OutfitSuggestion> calendarSuggestions = [];
      if (considerCalendar) {
        calendarSuggestions = await _calendarService.analyzeEventsForOutfitSuggestions(date: date);
      }

      // Get weather-based suggestions
      String? weatherContext;
      if (considerWeather) {
        final weather = await _weatherService.getWeatherForDate(date);
        if (weather != null) {
          final weatherRecommendation = _weatherService.analyzeWeatherForOutfit(weather);
          weatherContext = weatherRecommendation.comfortLevel;
        }
      }

      // Get personalized suggestions
      List<String> personalizedOutfits = [];
      if (considerPreferences) {
        final occasion = calendarSuggestions.isNotEmpty ? calendarSuggestions.first.occasion : 'casual';
        personalizedOutfits = await _personalizationService.getPersonalizedOutfitSuggestions(
          userId: userId,
          occasion: occasion,
          season: _getCurrentSeason(date),
          limit: 5,
        );
      }

      // Combine all suggestions
      if (calendarSuggestions.isNotEmpty) {
        suggestions.addAll(calendarSuggestions);
      } else {
        // Create default suggestion for the day
        suggestions.add(OutfitSuggestion()
          ..eventId = 'default_${date.millisecondsSinceEpoch}'
          ..eventTitle = 'Daily Outfit'
          ..eventStart = date
          ..eventEnd = date.add(const Duration(hours: 16))
          ..occasion = _getDefaultOccasionForDay(date)
          ..dressCode = 'casual'
          ..timeOfDay = TimeOfDay.morning
          ..priority = 1);
      }

      // Enhance suggestions with weather and personalization data
      for (final suggestion in suggestions) {
        if (weatherContext != null) {
          suggestion.weatherConditions = weatherContext;
        }
        
        if (personalizedOutfits.isNotEmpty) {
          suggestion.suggestedOutfitId = personalizedOutfits.first;
        }
      }

      return suggestions;
    } catch (e) {
      // Return basic suggestion if everything fails
      return [
        OutfitSuggestion()
          ..eventId = 'fallback_${date.millisecondsSinceEpoch}'
          ..eventTitle = 'Daily Outfit'
          ..eventStart = date
          ..eventEnd = date.add(const Duration(hours: 16))
          ..occasion = 'casual'
          ..dressCode = 'casual'
          ..timeOfDay = TimeOfDay.morning
          ..priority = 1
      ];
    }
  }

  double _calculatePlanningConsistency(List<OutfitPlan> plans) {
    if (plans.length < 7) return 0.0;
    
    final plannedDays = plans.where((p) => p.status != PlanStatus.none).length;
    return plannedDays / plans.length;
  }

  double _calculateWeatherAccuracy(List<OutfitPlan> plans) {
    final plansWithWeather = plans.where((p) => 
        p.weatherData != null && 
        p.expectedTemperature != null &&
        p.status == PlanStatus.completed).toList();
    
    if (plansWithWeather.isEmpty) return 0.0;

    // This would compare predicted vs actual weather
    // For now, return a mock accuracy
    return 0.85;
  }

  Season _getCurrentSeason(DateTime date) {
    final month = date.month;
    if (month >= 3 && month <= 5) return Season.spring;
    if (month >= 6 && month <= 8) return Season.summer;
    if (month >= 9 && month <= 11) return Season.autumn;
    return Season.winter;
  }

  String _getDefaultOccasionForDay(DateTime date) {
    final weekday = date.weekday;
    if (weekday >= 1 && weekday <= 5) {
      return 'work';
    } else if (weekday == 6) {
      return 'casual';
    } else {
      return 'relaxed';
    }
  }
}

