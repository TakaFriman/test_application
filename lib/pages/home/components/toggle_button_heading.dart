import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButtonHeading extends StatefulWidget {
  final void Function(int) onTabChanged;

  const ToggleButtonHeading({super.key, required this.onTabChanged});

  @override
  State<ToggleButtonHeading> createState() => _ToggleButtonHeadingState();
}

class _ToggleButtonHeadingState extends State<ToggleButtonHeading> {
  int _selectedIndex = 0; // 0 для Дневник настроения, 1 для Статистика

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 242, 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => _onTabTapped(0),
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 0 ? theme.primaryColor : const Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 17),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/diary.svg',
                      width: 20,
                      height: 20,
                      color: _selectedIndex == 0 ? const Color.fromRGBO(255, 255, 255, 1) : theme.disabledColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Дневник настроения',
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: _selectedIndex == 0 ? const Color.fromRGBO(255, 255, 255, 1) : theme.disabledColor),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => _onTabTapped(1),
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 1 ? theme.primaryColor : const Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 17),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/chart.svg',
                      width: 20,
                      height: 20,
                      color: _selectedIndex == 1 ? const Color.fromRGBO(255, 255, 255, 1) : theme.disabledColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Статистика',
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: _selectedIndex == 1 ? const Color.fromRGBO(255, 255, 255, 1) : theme.disabledColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
