import 'package:flutter/material.dart';

import '../../commons/color.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
            backgroundColor:  WidgetStateProperty.all<Color>(colorBlue),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 12)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: theme.textTheme.bodyLarge,
          )
      ),
    );
  }
}


