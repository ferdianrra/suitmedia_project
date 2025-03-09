import 'package:flutter/material.dart';
import 'package:practices/commons/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({
    super.key,
    required TextEditingController nameController,
    this.hintText = ""
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return TextField(
      controller: _nameController,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: colorBlack
      ),
      decoration: InputDecoration(
          filled: true,
          fillColor: colorBackground,
          hintText: hintText,
          hintStyle: theme.textTheme.titleSmall?.copyWith(
            color: colorGrey.withOpacity(0.4)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: colorBackground
            )
          )
      ),
    );
  }
}
