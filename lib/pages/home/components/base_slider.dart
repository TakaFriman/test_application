import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BaseSlider extends StatefulWidget {
  const BaseSlider({
    super.key,
    required this.firstValue,
    required this.secondValue,
    required this.title,
    required this.isEmotionSelected,
    required this.isSave,
  });

  final bool isEmotionSelected;
  final String firstValue;
  final String secondValue;
  final String title;
  final bool isSave;

  @override
  State<BaseSlider> createState() => _BaseSliderState();
}

class _BaseSliderState extends State<BaseSlider> {
  double currentSliderValue = 2.5;

  @override
  void didUpdateWidget(BaseSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSave != oldWidget.isSave) {
      if (widget.isSave) {
        _resetSlider();
      }
    }
  }

  void _resetSlider() {
    setState(() {
      currentSliderValue = 2.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title, style: theme.textTheme.headlineLarge),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: SfSliderTheme(
                    data: SfSliderThemeData(
                      disabledInactiveTrackColor:
                          widget.isEmotionSelected ? theme.primaryColor : const Color.fromRGBO(225, 221, 216, 1),
                      disabledActiveTrackColor:
                          widget.isEmotionSelected ? theme.primaryColor : const Color.fromRGBO(225, 221, 216, 1),
                      inactiveTrackHeight: 6,
                      activeTrackHeight: 6,
                      thumbRadius: 12,
                      tickOffset: const Offset(0, -22),
                      tickSize: const Size(2, 8),
                      activeTickColor:
                          widget.isEmotionSelected ? theme.primaryColor : const Color.fromRGBO(225, 221, 216, 1),
                    ),
                    child: SfSlider(
                      key: UniqueKey(),
                      min: 0,
                      max: 5.0,
                      stepSize: 1,
                      value: widget.isEmotionSelected ? currentSliderValue : 2.5,
                      interval: 1,
                      showTicks: true,
                      onChanged: widget.isEmotionSelected
                          ? (dynamic value) {
                              setState(() {
                                currentSliderValue = value;
                              });
                            }
                          : null,
                      thumbIcon: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: widget.isEmotionSelected
                                  ? theme.primaryColor
                                  : const Color.fromRGBO(225, 221, 216, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      activeColor:
                          widget.isEmotionSelected ? theme.primaryColor : const Color.fromRGBO(225, 221, 216, 1),
                      inactiveColor: const Color.fromRGBO(225, 221, 216, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.firstValue, style: theme.textTheme.labelSmall),
                      Text(widget.secondValue, style: theme.textTheme.labelSmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
