import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_application/models/emotion_data.dart';

class PreferencesUtil {
  static Future<void> saveEmotionData(EmotionData data) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> existingData = prefs.getStringList('emotion_data_list') ?? [];
    final newData = json.encode({
      'emotions': data.emotions,
      'subEmotions': data.subEmotions,
      'stressLevel': data.stressLevel,
      'selfLevel': data.selfLevel,
      'notes': data.notes,
      'dateTime': data.dateTime,
    });
    existingData.add(newData);
    await prefs.setStringList('emotion_data_list', existingData);
  }

  static Future<List<EmotionData>> getEmotionData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonDataList = prefs.getStringList('emotion_data_list') ?? [];
    return jsonDataList.map((jsonData) {
      final map = json.decode(jsonData);
      return EmotionData(
        List<String?>.from(map['subEmotions']),
        emotions: List<String>.from(map['emotions']),
        stressLevel: map['stressLevel'].toDouble(),
        selfLevel: map['selfLevel'].toDouble(),
        notes: map['notes'],
        dateTime: map['dateTime'],
      );
    }).toList();
  }
}
