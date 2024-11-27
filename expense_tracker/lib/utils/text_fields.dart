import 'package:expense_tracker/utils/texts.dart';
import 'package:flutter/material.dart';

class TextFieldAmountSecondary extends StatelessWidget {
  const TextFieldAmountSecondary({
    super.key,
    required this.controller,
    required this.label,
    required this.prefix,
  });

  final TextEditingController controller;
  final String label;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.labelMedium,
      keyboardType: TextInputType.number,
      cursorColor: scheme.onSecondary,
      decoration: InputDecoration(
        label: TextSmallSecondary(text: label),
        prefixText: '$prefix ',
        prefixStyle: Theme.of(context).textTheme.labelMedium,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.secondary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.onSecondary),
        ),
      ),
    );
  }
}

class TextFieldTitleSecondary extends StatelessWidget {
  const TextFieldTitleSecondary({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.labelMedium,
      keyboardType: TextInputType.text,
      cursorColor: scheme.onSecondary,
      maxLength: 50,
      decoration: InputDecoration(
        label: TextSmallSecondary(text: label),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.secondary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: scheme.onSecondary),
        ),
        counterStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
