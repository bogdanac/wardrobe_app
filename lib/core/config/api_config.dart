import 'package:flutter_dotenv/flutter_dotenv.dart';

/// API Configuration for external services
/// 
/// This class is the SINGLE source of truth for all API keys and endpoints.
/// API keys are loaded from .env file for security.
class ApiConfig {
  // Private constructor to prevent instantiation
  ApiConfig._();
  
  /// Remove.bg endpoint
  static const String removeBgEndpoint = 'https://api.remove.bg/v1.0/removebg';
  /// Get Remove.bg API key from .env file
  static String get removeBgApiKey => dotenv.env['REMOVE_BG_API_KEY'] ?? '';
  
  /// Check if Remove.bg API is properly configured
  static bool get isRemoveBgConfigured => removeBgApiKey.isNotEmpty;
  
  /// Get Remove.bg API key with validation
  static String getRemoveBgApiKey() {
    if (!isRemoveBgConfigured) {
      throw Exception('Remove.bg API key not configured. Please add REMOVE_BG_API_KEY to your .env file.');
    }
    return removeBgApiKey;
  }
  
  /// Validate all API configurations
  static Map<String, bool> validateApiKeys() {
    return {
      'remove_bg': isRemoveBgConfigured,
      // Add other API validations here
    };
  }
  
  /// Get API status for debugging/settings screen
  static Map<String, String> getApiStatus() {
    return {
      'remove_bg': isRemoveBgConfigured ? 'Configured' : 'Not configured',
      // Add other API status here
    };
  }
}