import 'package:device_calendar/device_calendar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import '../../domain/entities/outfit.dart';
import '../../domain/entities/calendar_integration.dart';

class CalendarService {
  static DeviceCalendarPlugin? _deviceCalendarPlugin;

  static DeviceCalendarPlugin get _plugin {
    _deviceCalendarPlugin ??= DeviceCalendarPlugin();
    return _deviceCalendarPlugin!;
  }

  // Check and request calendar permissions
  Future<bool> requestCalendarPermissions() async {
    try {
      final permission = await Permission.calendarFullAccess.request();
      return permission.isGranted;
    } catch (e) {
      return false;
    }
  }

  // Get available calendars
  Future<List<Calendar>> getCalendars() async {
    try {
      final hasPermission = await requestCalendarPermissions();
      if (!hasPermission) return [];

      final calendarsResult = await _plugin.retrieveCalendars();
      return calendarsResult.data ?? [];
    } catch (e) {
      return [];
    }
  }

  // Get events for a date range
  Future<List<Event>> getEventsForDateRange({
    required DateTime startDate,
    required DateTime endDate,
    String? calendarId,
  }) async {
    try {
      final hasPermission = await requestCalendarPermissions();
      if (!hasPermission) return [];

      final calendars = await getCalendars();
      if (calendars.isEmpty) return [];

      final targetCalendarId = calendarId ?? calendars.first.id;
      if (targetCalendarId == null) return [];

      final eventsResult = await _plugin.retrieveEvents(
        targetCalendarId,
        RetrieveEventsParams(
          startDate: startDate,
          endDate: endDate,
        ),
      );

      return eventsResult.data ?? [];
    } catch (e) {
      return [];
    }
  }

  // Get today's events
  Future<List<Event>> getTodaysEvents({String? calendarId}) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    return getEventsForDateRange(
      startDate: startOfDay,
      endDate: endOfDay,
      calendarId: calendarId,
    );
  }

  // Get this week's events
  Future<List<Event>> getWeekEvents({String? calendarId}) async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));

    return getEventsForDateRange(
      startDate: startOfWeek,
      endDate: endOfWeek,
      calendarId: calendarId,
    );
  }

  // Analyze events and suggest outfit occasions
  Future<List<OutfitSuggestion>> analyzeEventsForOutfitSuggestions({
    required DateTime date,
    String? calendarId,
  }) async {
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

      final events = await getEventsForDateRange(
        startDate: startOfDay,
        endDate: endOfDay,
        calendarId: calendarId,
      );

      final suggestions = <OutfitSuggestion>[];

      for (final event in events) {
        final occasion = _determineOccasionFromEvent(event);
        final dressCode = _determineDressCodeFromEvent(event);
        final timeOfDay = _determineTimeOfDay(event);

        final suggestion = OutfitSuggestion()
          ..eventId = event.eventId ?? ''
          ..eventTitle = event.title ?? 'Untitled Event'
          ..eventStart = event.start ?? startOfDay
          ..eventEnd = event.end ?? endOfDay
          ..occasion = occasion
          ..dressCode = dressCode
          ..timeOfDay = timeOfDay
          ..location = event.location
          ..description = event.description
          ..priority = _calculateEventPriority(event)
          ..createdAt = DateTime.now();

        suggestions.add(suggestion);
      }

      // Sort by priority and time
      suggestions.sort((a, b) {
        final priorityComparison = b.priority.compareTo(a.priority);
        if (priorityComparison != 0) return priorityComparison;
        return a.eventStart.compareTo(b.eventStart);
      });

      return suggestions;
    } catch (e) {
      return [];
    }
  }

  // Add outfit planning event to calendar
  Future<bool> addOutfitPlanningEvent({
    required String calendarId,
    required DateTime date,
    required Outfit outfit,
    String? notes,
  }) async {
    try {
      final hasPermission = await requestCalendarPermissions();
      if (!hasPermission) return false;

      final event = Event(calendarId)
        ..title = 'Outfit: ${outfit.name}'
        ..description = notes ?? 'Planned outfit for today'
        ..start = tz.TZDateTime.from(date, tz.UTC)
        ..end = tz.TZDateTime.from(date.add(const Duration(hours: 1)), tz.UTC)
        ..allDay = false;

      final result = await _plugin.createOrUpdateEvent(event);
      return result?.isSuccess ?? false;
    } catch (e) {
      return false;
    }
  }

  // Private helper methods
  String _determineOccasionFromEvent(Event event) {
    final title = (event.title ?? '').toLowerCase();
    final description = (event.description ?? '').toLowerCase();
    final combined = '$title $description';

    if (combined.contains('meeting') || combined.contains('work') || combined.contains('office')) {
      return 'work';
    } else if (combined.contains('dinner') || combined.contains('restaurant') || combined.contains('date')) {
      return 'dinner';
    } else if (combined.contains('party') || combined.contains('celebration') || combined.contains('birthday')) {
      return 'party';
    } else if (combined.contains('interview') || combined.contains('presentation') || combined.contains('conference')) {
      return 'formal';
    } else if (combined.contains('gym') || combined.contains('workout') || combined.contains('fitness')) {
      return 'gym';
    } else if (combined.contains('travel') || combined.contains('flight') || combined.contains('vacation')) {
      return 'travel';
    } else if (combined.contains('wedding') || combined.contains('formal')) {
      return 'formal';
    } else {
      return 'casual';
    }
  }

  String _determineDressCodeFromEvent(Event event) {
    final occasion = _determineOccasionFromEvent(event);
    
    switch (occasion) {
      case 'formal':
        return 'formal';
      case 'work':
        return 'business';
      case 'dinner':
        return 'smart casual';
      case 'party':
        return 'cocktail';
      case 'gym':
        return 'athletic';
      default:
        return 'casual';
    }
  }

  TimeOfDay _determineTimeOfDay(Event event) {
    final startHour = event.start?.hour ?? 12;
    
    if (startHour < 12) {
      return TimeOfDay.morning;
    } else if (startHour < 17) {
      return TimeOfDay.afternoon;
    } else {
      return TimeOfDay.evening;
    }
  }

  int _calculateEventPriority(Event event) {
    final title = (event.title ?? '').toLowerCase();
    final description = (event.description ?? '').toLowerCase();

    int priority = 1;

    // High priority keywords
    if (title.contains('important') || title.contains('urgent') ||
        title.contains('interview') || title.contains('presentation') ||
        title.contains('wedding') || title.contains('formal') ||
        description.contains('important') || description.contains('urgent')) {
      priority += 3;
    }

    // Medium priority keywords
    if (title.contains('meeting') || title.contains('dinner') ||
        title.contains('party') || title.contains('date') ||
        description.contains('meeting') || description.contains('dinner')) {
      priority += 2;
    }
    
    // Duration factor
    final duration = event.end?.difference(event.start ?? DateTime.now()) ?? Duration.zero;
    if (duration.inHours >= 3) {
      priority += 1;
    }
    
    return priority;
  }
}

