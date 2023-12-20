import 'package:expense_tracker/widgets/shared/expt_text.dart';
import 'package:flutter/material.dart';

class ExptTextField extends StatelessWidget {
  static const defaultMaxLength = 50;

  final int maxLength;
  final String hintText;
  final String prefixText;
  final String labelText;
  // final Function(String) onChanged;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;

  const ExptTextField({
    super.key,
    // required this.onChanged,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxLength = defaultMaxLength,
    this.prefixText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: onChanged,
      maxLength: maxLength,
      // Text type is the default but you can set a different type like email, name and etc...
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: ExptText(text: labelText),
        hintText: hintText,
        prefixText: prefixText,
      ),
    );
  }
}
