import 'package:flutter/material.dart';

class EmotionContainer extends StatelessWidget {
  final String image;
  final String name;
  final bool isSelected;

  const EmotionContainer({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
      width: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(182, 161, 192, 0.11),
            offset: Offset(2, 4),
            blurRadius: 10.8,
          ),
        ],
        border: isSelected ? Border.all(color: theme.primaryColor, width: 2) : null,
      ),
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: 4),
          Text(
            name,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color.fromRGBO(76, 76, 105, 1),
            ),
          ),
        ],
      ),
    );
  }
}
