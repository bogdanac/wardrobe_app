import 'package:shared_preferences/shared_preferences.dart';

/// Background removal method options
enum BackgroundRemovalMethod {
  ai, // Remove.bg API
  local, // Local smart edge detection
}

/// Configuration for background removal preferences
class BackgroundRemovalConfig {
  static const String _preferAiRemovalKey = 'prefer_ai_background_removal';
  
  /// Get user's preferred background removal method
  static Future<BackgroundRemovalMethod> getPreferredMethod() async {
    final prefs = await SharedPreferences.getInstance();
    final preferAI = prefs.getBool(_preferAiRemovalKey) ?? true; // Default to AI if available
    return preferAI ? BackgroundRemovalMethod.ai : BackgroundRemovalMethod.local;
  }
  
  /// Set user's preferred background removal method
  static Future<void> setPreferredMethod(BackgroundRemovalMethod method) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_preferAiRemovalKey, method == BackgroundRemovalMethod.ai);
  }
  
  /// Check if user prefers AI background removal
  static Future<bool> prefersAIRemoval() async {
    final method = await getPreferredMethod();
    return method == BackgroundRemovalMethod.ai;
  }
  
  /// Check if user prefers local background removal
  static Future<bool> prefersLocalRemoval() async {
    final method = await getPreferredMethod();
    return method == BackgroundRemovalMethod.local;
  }
  
  /// Get method display name
  static String getMethodDisplayName(BackgroundRemovalMethod method) {
    switch (method) {
      case BackgroundRemovalMethod.ai:
        return 'AI-Powered (Remove.bg)';
      case BackgroundRemovalMethod.local:
        return 'Smart Edge Detection';
    }
  }
  
  /// Get method description
  static String getMethodDescription(BackgroundRemovalMethod method) {
    switch (method) {
      case BackgroundRemovalMethod.ai:
        return 'Professional AI background removal. Works with any background but requires internet connection.';
      case BackgroundRemovalMethod.local:
        return 'Local smart detection. Works offline with solid color backgrounds.';
    }
  }
}