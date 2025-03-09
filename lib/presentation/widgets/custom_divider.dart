import 'package:flutter/material.dart';

import '../../commons/color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: colorDivider,
      thickness: 0.5,
    );
  }
}
