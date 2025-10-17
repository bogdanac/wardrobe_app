import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/clothing_item.dart';

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState()) {
    _loadSettings();
  }

  static const String _notificationsKey = 'notifications_enabled';
  static const String _currentSeasonKey = 'current_season';

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsEnabled = prefs.getBool(_notificationsKey) ?? true;
    final seasonString = prefs.getString(_currentSeasonKey);

    Season? currentSeason;
    if (seasonString != null) {
      try {
        currentSeason = Season.values.firstWhere((s) => s.name == seasonString);
      } catch (e) {
        currentSeason = null;
      }
    }

    state = state.copyWith(
      notificationsEnabled: notificationsEnabled,
      currentSeason: currentSeason,
    );
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsKey, enabled);
    state = state.copyWith(notificationsEnabled: enabled);
  }

  Future<void> setCurrentSeason(Season? season) async {
    final prefs = await SharedPreferences.getInstance();
    if (season == null) {
      await prefs.remove(_currentSeasonKey);
      state = state.copyWith(clearSeason: true);
    } else {
      await prefs.setString(_currentSeasonKey, season.name);
      state = state.copyWith(currentSeason: season);
    }
  }
}

class SettingsState {
  final bool notificationsEnabled;
  final Season? currentSeason;

  const SettingsState({
    this.notificationsEnabled = true,
    this.currentSeason,
  });

  SettingsState copyWith({
    bool? notificationsEnabled,
    Season? currentSeason,
    bool clearSeason = false,
  }) {
    return SettingsState(
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      currentSeason: clearSeason ? null : (currentSeason ?? this.currentSeason),
    );
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(),
);