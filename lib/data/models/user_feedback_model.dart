import 'dart:convert';
import 'package:isar/isar.dart';
import '../../domain/entities/user_feedback.dart';

part 'user_feedback_model.g.dart';

@Collection()
class UserFeedbackModel {
  Id id = Isar.autoIncrement;
  
  late String feedbackId;
  late String userId;
  String? outfitId;
  String? itemId;
  
  @Enumerated(EnumType.name)
  late FeedbackType type;
  
  @Enumerated(EnumType.name)
  late FeedbackContext context;
  
  late DateTime timestamp;
  
  @ignore
  Map<String, dynamic> get metadata {
    if (_metadata == null || _metadata!.isEmpty) return {};
    try {
      return Map<String, dynamic>.from(jsonDecode(_metadata!));
    } catch (e) {
      return {};
    }
  }
  
  set metadata(Map<String, dynamic> value) {
    _metadata = jsonEncode(value);
  }
  
  String? _metadata;

  UserFeedbackModel();

  UserFeedbackModel.fromEntity(UserFeedback feedback, this.userId) {
    feedbackId = feedback.id;
    outfitId = feedback.outfitId;
    itemId = feedback.itemId;
    type = feedback.type;
    context = feedback.context;
    timestamp = feedback.timestamp;
    metadata = feedback.metadata;
  }

  UserFeedback toEntity() {
    return UserFeedback(
      id: feedbackId,
      outfitId: outfitId,
      itemId: itemId,
      type: type,
      context: context,
      timestamp: timestamp,
      metadata: metadata,
    );
  }
}