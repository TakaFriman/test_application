import 'package:flutter/material.dart';

class NotesTextField extends StatefulWidget {
  const NotesTextField({
    super.key,
    required this.onTextChange,
    required this.onTextChanged,
    required this.isSave,
  });

  final ValueChanged<bool> onTextChange;
  final ValueChanged<String> onTextChanged; // Добавлено
  final bool isSave;

  @override
  _NotesTextFieldState createState() => _NotesTextFieldState();
}

class _NotesTextFieldState extends State<NotesTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      widget.onTextChange(text.isEmpty);
      widget.onTextChanged(text); // Передача текста в родительский виджет
    });
  }

  @override
  void didUpdateWidget(NotesTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSave != oldWidget.isSave) {
      if (widget.isSave) {
        _clearTextField();
      }
    }
  }

  void _clearTextField() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Заметки', style: theme.textTheme.headlineLarge),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(182, 161, 192, 0.11),
                  offset: Offset(2, 4),
                  blurRadius: 10.8,
                ),
              ],
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _controller,
              cursorColor: theme.primaryColor,
              style: theme.textTheme.bodyMedium,
              minLines: 4,
              maxLines: 8,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
                hintText: 'Введите заметку',
                hintStyle: theme.textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
