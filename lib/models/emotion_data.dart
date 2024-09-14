import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class EmotionData {
  final List<String> emotions;
  final List<String?> subEmotions;
  final double stressLevel;
  final double selfLevel;
  final String notes;
  final String dateTime;

  EmotionData(
    this.subEmotions, {
    required this.emotions,
    required this.stressLevel,
    required this.selfLevel,
    required this.notes,
    required this.dateTime,
  });
}
