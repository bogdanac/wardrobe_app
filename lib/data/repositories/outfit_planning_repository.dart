import '../../domain/entities/outfit_planning_models.dart';

abstract class OutfitPlanningRepository {
  Future<int> savePlan(OutfitPlan plan);
  Future<OutfitPlan?> getPlan(int id);
  Future<OutfitPlan?> getPlanForDate({required String userId, required DateTime date});
  Future<List<OutfitPlan>> getPlansForDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<void> saveWeeklySchedule(WeeklyOutfitSchedule schedule);
  Future<void> saveReminder(OutfitReminder reminder);
  Future<List<OutfitReminder>> getRemindersForDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  });

  // Additional methods used in the implementation
  Future<List<OutfitPlan>> getUserPlans(String userId);
  Future<void> updatePlan(OutfitPlan plan);
  Future<void> deletePlan(int planId);
  Future<List<Map<String, dynamic>>> getSuggestions(String userId, DateTime date);
  Future<void> saveSuggestion(Map<String, dynamic> suggestion);
  Future<List<CalendarView>> getCalendarView(String userId, DateTime month);
  Future<List<SeasonalPlan>> getSeasonalPlans(String userId);
  Future<void> saveSeasonalPlan(SeasonalPlan plan);
  Future<List<LaundryPlan>> getLaundryPlans(String userId);
  Future<void> saveLaundryPlan(LaundryPlan plan);
}