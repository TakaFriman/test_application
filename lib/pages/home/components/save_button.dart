import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.isEmotionSelected,
    required this.isNotesTextFieldNotEmpty,
    required this.onPressed,
  });

  final bool isEmotionSelected;
  final bool isNotesTextFieldNotEmpty;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isTrue = false;
    isEmotionSelected && !isNotesTextFieldNotEmpty ? isTrue = true : isTrue = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(69),
          ),
          backgroundColor: theme.primaryColor,
          disabledBackgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        ),
        onPressed: isTrue ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
              child: Text(
            'Сохранить',
            style: theme.textTheme.displayMedium?.copyWith(
              color: isTrue ? Colors.white : theme.disabledColor,
            ),
          )),
        ),
      ),
    );
  }
}
