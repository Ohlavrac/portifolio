import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String initialValue;
  final int maxLines;
  final Function(String)? onChanged;
  final Function(String)? onSubmited;

  const TextInput({super.key, required this.initialValue, required this.maxLines, this.onChanged, this.onSubmited});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        initialValue: initialValue,
        autofocus: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        maxLines: maxLines,
        onChanged: onChanged,
        onFieldSubmitted: onSubmited,        
      ),
    );
  }
}