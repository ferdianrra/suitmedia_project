import 'package:flutter/material.dart';
import 'package:practices/commons/const.dart';
import 'package:practices/presentation/screen/user_list_screen.dart';
import 'package:practices/presentation/widgets/custom_app_bar.dart';
import 'package:practices/presentation/widgets/custom_text_button.dart';

class UserScreen extends StatefulWidget {
  static const ROUTE_NAME = "/second";
  final String? args;
  const UserScreen({
    super.key,
    this.args
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(titleAppBar: secondScreen),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(welcomeText),
              Text(
                widget.args ?? emptyText,
                style: theme.textTheme.titleMedium,
              ),
              Spacer(),
              Center(
                child: Text(
                  selectedUser ?? selectedUserEmptyText,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Spacer(),
              CustomTextButton(
                text: chooseUserText,
                onPressed: () async {
                  final selectedUserResult = await Navigator.pushNamed(
                    context,
                    UserListScreen.ROUTE_NAME,
                  );
                  debugPrint("selectedUser: $selectedUserResult");
          
                  if (selectedUserResult is String) {
                    setState(() {
                      selectedUser = selectedUserResult;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
