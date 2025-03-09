import 'package:flutter/material.dart';
import 'package:practices/commons/const.dart';
import 'package:practices/commons/space.dart';
import '../../domain/entities/user.dart';
import 'custom_divider.dart';

class UserItemWidget extends StatelessWidget {
  final User user;
  final Function() onTap;

  const UserItemWidget({
    super.key,
    required this.user,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceRegular,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    user.avatar ?? emptyText,
                    width: 49,
                    height: 49,
                  )
              ),
              horizontalSpaceRegular,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${user.firstName ?? emptyText} ${user.lastName ?? emptyText}",
                    style: theme.textTheme.titleSmall,
                  ),
                  verticalSpaceSmall,
                  Text(
                    user.email ?? emptyText,
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              )
            ],
          ),
          verticalSpaceRegular,
          CustomDivider()
        ],
      ),
    );
  }
}
