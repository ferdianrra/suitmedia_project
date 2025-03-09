import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practices/commons/assets.dart';
import 'package:practices/commons/color.dart';
import 'custom_divider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String titleAppBar;

  const CustomAppBar({
    super.key,
    required this.titleAppBar
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 23);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      shadowColor: colorBackground,
      foregroundColor: colorBackground,
      surfaceTintColor: colorBackground,
      scrolledUnderElevation: 0,
      leading: SizedBox(
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            arrowIcon,
            width: 48,
            height: 48,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        titleAppBar,
        style: theme.textTheme.titleMedium,
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(23),
          child: CustomDivider()
      ),
    );
  }
}
