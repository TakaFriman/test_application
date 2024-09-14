import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_application/pages/calendar/calendar.dart';
import 'package:test_application/pages/calendar/view/calendar_page.dart';
import 'package:test_application/pages/home/components/components.dart';
import 'package:test_application/pages/statistic/statistic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  String _currentDateTime = '';
  bool _isEmotionSelected = false;
  bool _isNotesTextFieldEmpty = true;
  bool _isSave = false;
  int _selectedIndex = 0; // Индекс выбранной вкладки

  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateFormat('d MMMM HH:mm', 'ru').format(DateTime.now().toUtc().add(const Duration(hours: 3)));
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru', null).then((_) {
      _updateDateTime();
      _timer = Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateDateTime());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Успех'),
          content: const Text('Ваши данные сохранены.'),
          actions: [
            TextButton(
              child: const Text('ОК'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetAllFields() {
    setState(() {
      _isEmotionSelected = false;
      _isNotesTextFieldEmpty = true;

      _isSave = true;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isSave = false;
      });
    });
  }

  void _onSavePressed() {
    _isSave = true;
    _showSaveConfirmationDialog();
    _resetAllFields();
  }

  void _onEmotionSelected(bool isSelected) {
    setState(() {
      _isEmotionSelected = isSelected;
    });
  }

  void _onNotesTextChanged(bool isEmpty) {
    setState(() {
      _isNotesTextFieldEmpty = isEmpty;
    });
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
              },
              child: Icon(
                Icons.calendar_month,
                color: theme.disabledColor,
              )),
          const SizedBox(width: 20)
        ],
        title: Text(_currentDateTime, style: theme.textTheme.titleLarge),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          ToggleButtonHeading(onTabChanged: _onTabChanged),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text('Что чувствуешь?', style: theme.textTheme.headlineLarge),
                      ),
                      const SizedBox(height: 20),
                      RowEmotionList(onEmotionSelected: _onEmotionSelected, isSave: _isSave),
                      const SizedBox(height: 10),
                      BaseSlider(
                        title: 'Уровень стресса',
                        firstValue: 'Низкий',
                        secondValue: 'Высокий',
                        isEmotionSelected: _isEmotionSelected,
                        isSave: _isSave,
                      ),
                      BaseSlider(
                        title: 'Самооценка',
                        firstValue: 'Неуверенность',
                        secondValue: 'Уверенность',
                        isEmotionSelected: _isEmotionSelected,
                        isSave: _isSave,
                      ),
                      NotesTextField(onTextChange: _onNotesTextChanged, isSave: _isSave),
                      const SizedBox(height: 36),
                      SaveButton(
                        isEmotionSelected: _isEmotionSelected,
                        isNotesTextFieldNotEmpty: _isNotesTextFieldEmpty,
                        onPressed: _onSavePressed,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                const StatisticPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
