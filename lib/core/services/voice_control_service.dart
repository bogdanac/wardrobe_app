import 'dart:async';
import 'package:flutter/services.dart';
import '../../domain/entities/voice_models.dart';
import '../../domain/entities/clothing_item.dart';
import '../../domain/entities/outfit.dart';

class VoiceControlService {
  static const MethodChannel _channel = MethodChannel('wardrobe_voice');
  static const EventChannel _eventChannel = EventChannel('wardrobe_voice_events');
  
  StreamSubscription<dynamic>? _voiceEventSubscription;
  final StreamController<VoiceEvent> _voiceEventController = StreamController<VoiceEvent>.broadcast();
  
  bool _isListening = false;
  bool _isInitialized = false;
  
  // Voice command patterns and their handlers
  final Map<VoiceCommandPattern, VoiceCommandHandler> _commandHandlers = {};

  // Initialize voice recognition
  Future<bool> initialize({
    List<String> supportedLanguages = const ['en-US'],
    double confidenceThreshold = 0.7,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'supportedLanguages': supportedLanguages,
        'confidenceThreshold': confidenceThreshold,
      };

      final bool result = await _channel.invokeMethod('initializeVoice', params);
      
      if (result) {
        _isInitialized = true;
        _setupEventListener();
        _registerDefaultCommands();
      }
      
      return result;
    } catch (e) {
      return false;
    }
  }

  // Check if voice recognition is available
  Future<VoiceAvailability> checkVoiceAvailability() async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod('checkVoiceSupport');
      
      return VoiceAvailability.fromMap(result);
    } catch (e) {
      return const VoiceAvailability(
        isSupported: false,
        availableLanguages: [],
        hasOfflineSupport: false,
      );
    }
  }

  // Start listening for voice commands
  Future<bool> startListening({
    String language = 'en-US',
    bool continuousListening = false,
    int timeoutSeconds = 30,
  }) async {
    if (!_isInitialized || _isListening) return false;

    try {
      final Map<String, dynamic> params = {
        'language': language,
        'continuousListening': continuousListening,
        'timeoutSeconds': timeoutSeconds,
      };

      final bool result = await _channel.invokeMethod('startListening', params);
      _isListening = result;
      return result;
    } catch (e) {
      return false;
    }
  }

  // Stop listening for voice commands
  Future<bool> stopListening() async {
    if (!_isListening) return true;

    try {
      final bool result = await _channel.invokeMethod('stopListening');
      _isListening = !result;
      return result;
    } catch (e) {
      return false;
    }
  }

  // Process voice command for outfit selection
  Future<VoiceCommandResult> processOutfitCommand(String command) async {
    try {
      final Map<String, dynamic> params = {
        'command': command,
        'context': 'outfit_selection',
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('processCommand', params);
      
      return VoiceCommandResult.fromMap(result);
    } catch (e) {
      return VoiceCommandResult(
        command: command,
        intent: VoiceIntent.unknown,
        confidence: 0.0,
        success: false,
        error: e.toString(),
      );
    }
  }

  // Natural language outfit search
  Future<List<ClothingItem>> searchItemsByVoice(String voiceQuery) async {
    try {
      final Map<String, dynamic> params = {
        'query': voiceQuery,
        'searchType': 'clothing_items',
      };

      await _channel.invokeMethod('voiceSearch', params);
      
      // This would typically integrate with your clothing repository
      return []; // Return actual ClothingItem objects
    } catch (e) {
      return [];
    }
  }

  // Voice-guided outfit creation
  Future<OutfitCreationSession> startVoiceOutfitCreation({
    String? occasionHint,
    Season? seasonHint,
    List<String>? colorPreferences,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'occasionHint': occasionHint,
        'seasonHint': seasonHint?.name,
        'colorPreferences': colorPreferences,
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('startOutfitCreation', params);
      
      return OutfitCreationSession.fromMap(result);
    } catch (e) {
      return OutfitCreationSession(
        sessionId: 'error',
        status: OutfitCreationStatus.failed,
        currentStep: OutfitCreationStep.initialization,
      );
    }
  }

  // Voice feedback for outfit suggestions
  Future<void> provideVoiceFeedback({
    required String outfitId,
    required String feedback,
    double? rating,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'outfitId': outfitId,
        'feedback': feedback,
        'rating': rating,
      };

      await _channel.invokeMethod('recordFeedback', params);
    } catch (e) {
      // Handle error silently
    }
  }

  // Text-to-speech for outfit descriptions
  Future<bool> speakOutfitDescription(Outfit outfit, List<ClothingItem> items) async {
    try {
      final description = _generateOutfitDescription(outfit, items);
      
      final Map<String, dynamic> params = {
        'text': description,
        'language': 'en-US',
      };

      final bool result = await _channel.invokeMethod('speak', params);
      return result;
    } catch (e) {
      return false;
    }
  }

  // Voice-controlled wardrobe navigation
  Future<NavigationResult> processNavigationCommand(String command) async {
    try {
      final Map<String, dynamic> params = {
        'command': command,
        'context': 'navigation',
      };

      final Map<dynamic, dynamic> result = await _channel.invokeMethod('processNavigation', params);
      
      return NavigationResult.fromMap(result);
    } catch (e) {
      return const NavigationResult(
        action: NavigationAction.unknown,
        destination: '',
        success: false,
      );
    }
  }

  // Register custom voice commands
  void registerCommand(VoiceCommandPattern pattern, VoiceCommandHandler handler) {
    _commandHandlers[pattern] = handler;
  }

  // Unregister voice commands
  void unregisterCommand(VoiceCommandPattern pattern) {
    _commandHandlers.remove(pattern);
  }

  // Get voice event stream
  Stream<VoiceEvent> get voiceEventStream => _voiceEventController.stream;

  // Check if currently listening
  bool get isListening => _isListening;

  // Check if initialized
  bool get isInitialized => _isInitialized;

  // Voice training and personalization
  Future<bool> startVoiceTraining({
    required List<String> trainingPhrases,
    int repetitions = 3,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'trainingPhrases': trainingPhrases,
        'repetitions': repetitions,
      };

      final bool result = await _channel.invokeMethod('startTraining', params);
      return result;
    } catch (e) {
      return false;
    }
  }

  // Voice accessibility features
  Future<void> configureAccessibility({
    bool enableVoiceHints = true,
    bool enableAudioFeedback = true,
    double speechRate = 1.0,
    double volume = 0.8,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'enableVoiceHints': enableVoiceHints,
        'enableAudioFeedback': enableAudioFeedback,
        'speechRate': speechRate,
        'volume': volume,
      };

      await _channel.invokeMethod('configureAccessibility', params);
    } catch (e) {
      // Handle error silently
    }
  }

  // Voice command shortcuts
  Future<void> createVoiceShortcut({
    required String phrase,
    required String action,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final Map<String, dynamic> params = {
        'phrase': phrase,
        'action': action,
        'parameters': parameters ?? {},
      };

      await _channel.invokeMethod('createShortcut', params);
    } catch (e) {
      // Handle error silently
    }
  }

  // Private methods
  void _setupEventListener() {
    _voiceEventSubscription = _eventChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        final voiceEvent = VoiceEvent.fromMap(Map<String, dynamic>.from(event));
        _voiceEventController.add(voiceEvent);
        _handleVoiceEvent(voiceEvent);
      },
      onError: (error) {
        _voiceEventController.addError(error);
      },
    );
  }

  void _handleVoiceEvent(VoiceEvent event) {
    // Handle different types of voice events
    switch (event.type) {
      case VoiceEventType.commandRecognized:
        _processRecognizedCommand(event);
        break;
      case VoiceEventType.listeningStarted:
        _isListening = true;
        break;
      case VoiceEventType.listeningStopped:
        _isListening = false;
        break;
      case VoiceEventType.error:
        _isListening = false;
        break;
      default:
        break;
    }
  }

  void _processRecognizedCommand(VoiceEvent event) {
    final command = event.data['command'] as String? ?? '';
    
    // Check registered command handlers
    for (final entry in _commandHandlers.entries) {
      if (entry.key.matches(command)) {
        entry.value(command, event.data);
        return;
      }
    }
  }

  void _registerDefaultCommands() {
    // Register common outfit-related voice commands
    
    // Outfit selection commands
    registerCommand(
      VoiceCommandPattern(r'show me (?:my )?(\w+) outfits?'),
      (command, data) => _handleShowOutfits(data),
    );
    
    registerCommand(
      VoiceCommandPattern(r'find (?:a )?(\w+) (?:shirt|top|dress|pants)'),
      (command, data) => _handleFindItem(data),
    );
    
    registerCommand(
      VoiceCommandPattern(r'create (?:an? )?outfit for (\w+)'),
      (command, data) => _handleCreateOutfit(data),
    );
    
    // Navigation commands
    registerCommand(
      VoiceCommandPattern(r'go to (?:the )?(\w+)'),
      (command, data) => _handleNavigation(data),
    );
    
    // Filter commands
    registerCommand(
      VoiceCommandPattern(r'show only (\w+) (?:items|clothes)'),
      (command, data) => _handleFilter(data),
    );
  }

  void _handleShowOutfits(Map<String, dynamic> data) {
    // Implementation for showing outfits
  }

  void _handleFindItem(Map<String, dynamic> data) {
    // Implementation for finding specific items
  }

  void _handleCreateOutfit(Map<String, dynamic> data) {
    // Implementation for creating outfits
  }

  void _handleNavigation(Map<String, dynamic> data) {
    // Implementation for navigation
  }

  void _handleFilter(Map<String, dynamic> data) {
    // Implementation for filtering
  }

  String _generateOutfitDescription(Outfit outfit, List<ClothingItem> items) {
    final buffer = StringBuffer();
    
    buffer.write('This outfit called "${outfit.name}" consists of ');
    
    if (items.isEmpty) {
      buffer.write('no items selected.');
      return buffer.toString();
    }
    
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      
      if (i > 0 && i == items.length - 1) {
        buffer.write(' and ');
      } else if (i > 0) {
        buffer.write(', ');
      }
      
      final color = item.colors.isNotEmpty ? item.colors.first : 'unknown';
      buffer.write('a $color ${item.name}');
    }
    
    buffer.write('. ');
    
    if (outfit.notes != null && outfit.notes!.isNotEmpty) {
      buffer.write(outfit.notes!);
    }
    
    return buffer.toString();
  }

  // Cleanup resources
  Future<void> dispose() async {
    await _voiceEventSubscription?.cancel();
    await _voiceEventController.close();
    
    try {
      await _channel.invokeMethod('dispose');
    } catch (e) {
      // Handle cleanup error silently
    }
    
    _isInitialized = false;
    _isListening = false;
  }
}

// Voice command pattern for matching
class VoiceCommandPattern {
  final String pattern;
  final RegExp _regExp;

  VoiceCommandPattern(this.pattern) : _regExp = RegExp(pattern, caseSensitive: false);

  bool matches(String command) {
    return _regExp.hasMatch(command);
  }

  Match? match(String command) {
    return _regExp.firstMatch(command);
  }
}

// Voice command handler type
typedef VoiceCommandHandler = void Function(String command, Map<String, dynamic> data);