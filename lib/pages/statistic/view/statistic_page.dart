import 'package:flutter/material.dart';
import 'package:test_application/data/shared_preferences.dart';
import 'package:test_application/models/emotion_data.dart';

class StatisticPage extends StatefulWidget {
  final bool isSave;

  const StatisticPage({super.key, required this.isSave});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  late Future<List<EmotionData>> _emotionDataFuture;

  Future<List<EmotionData>> _loadEmotionData() async {
    return await PreferencesUtil.getEmotionData();
  }

  @override
  void initState() {
    super.initState();
    _emotionDataFuture = _loadEmotionData();
  }

  @override
  void didUpdateWidget(covariant StatisticPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isSave != oldWidget.isSave) {
      setState(() {
        _emotionDataFuture = _loadEmotionData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FutureBuilder<List<EmotionData>>(
        future: _emotionDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет данных'));
          } else {
            final dataList = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...dataList.reversed.map((data) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Дата: ${data.dateTime}', style: theme.textTheme.headlineLarge),
                            const SizedBox(height: 10),
                            Text('Эмоции:', style: theme.textTheme.headlineLarge),
                            const SizedBox(height: 10),
                            data.emotions.isEmpty
                                ? const Text('Нет данных')
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: data.emotions.map((emotion) => Text('- $emotion')).toList(),
                                  ),
                            const SizedBox(height: 20),
                            Text('Подэмоции:', style: theme.textTheme.headlineLarge),
                            const SizedBox(height: 10),
                            data.subEmotions.isEmpty
                                ? const Text('Нет данных')
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: data.subEmotions
                                        .where((subEmotion) => subEmotion != null)
                                        .map((subEmotion) => Text('- $subEmotion'))
                                        .toList(),
                                  ),
                            const SizedBox(height: 20),
                            Text(
                              'Уровень стресса: ${data.stressLevel.toStringAsFixed(1)}',
                              style: theme.textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Самооценка: ${data.selfLevel.toStringAsFixed(1)}',
                              style: theme.textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 20),
                            Text('Заметки:', style: theme.textTheme.headlineLarge),
                            const SizedBox(height: 10),
                            Text(
                              data.notes.isEmpty ? 'Нет данных' : data.notes,
                              style: theme.textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 30),
                          ],
                        )),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
