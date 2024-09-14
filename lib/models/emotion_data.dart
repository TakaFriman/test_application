class EmotionData {
  final List<String> emotions;
  final List<String?> subEmotions;
  final double stressLevel;
  final double selfLevel;
  final String notes;

  EmotionData(
    this.subEmotions, {
    required this.emotions,
    required this.stressLevel,
    required this.selfLevel,
    required this.notes,
  });
}
