/// API Configuration for external services
/// 
/// This class is the SINGLE source of truth for all API keys and endpoints.
/// For production, these should be loaded from environment variables or secure storage.
class ApiConfig {
  // Private constructor to prevent instantiation
  ApiConfig._();
  
  /// SINGLE PLACE for all API configuration
  static const _config = {
    'REMOVE_BG_API_KEY': String.fromEnvironment('REMOVE_BG_API_KEY', defaultValue: ''),
    'REMOVE_BG_ENDPOINT': 'https://api.remove.bg/v1.0/removebg',
  };
  
  // Add other API configurations here as needed
  // 'OPENAI_API_KEY': String.fromEnvironment('OPENAI_API_KEY', defaultValue: ''),
  // 'GOOGLE_VISION_API_KEY': String.fromEnvironment('GOOGLE_VISION_API_KEY', defaultValue: ''),
  
  /// Get Remove.bg API key
  static String get removeBgApiKey => _config['REMOVE_BG_API_KEY']!;
  
  /// Get Remove.bg endpoint
  static String get removeBgEndpoint => _config['REMOVE_BG_ENDPOINT']!;
  
  /// Check if Remove.bg API is properly configured
  static bool get isRemoveBgConfigured => removeBgApiKey.isNotEmpty;
  
  /// Get Remove.bg API key with validation
  static String getRemoveBgApiKey() {
    if (!isRemoveBgConfigured) {
      throw Exception('Remove.bg API key not configured. Please set REMOVE_BG_API_KEY environment variable.');
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