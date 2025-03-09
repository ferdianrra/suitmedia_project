import 'package:flutter/material.dart';
import 'package:practices/commons/color.dart';
import 'package:practices/commons/font_text_styles.dart';
import 'package:practices/presentation/provider/user_list_notifier.dart';
import 'package:practices/presentation/screen/palindrome_screen.dart';
import 'package:practices/presentation/screen/user_list_screen.dart';
import 'package:practices/presentation/screen/user_screen.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => di.locator<UserListNotifier>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Suitmedia',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: colorBlue),
          scaffoldBackgroundColor: colorBackground,
          textTheme: customTextTheme,
          appBarTheme: AppBarTheme(
            color: colorBackground,
          )
        ),
        home: PalindromeScreen(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/palindrome':
              return MaterialPageRoute(builder: (_) => PalindromeScreen());
            case UserScreen.ROUTE_NAME:
              final args = settings.arguments as String?;
              return MaterialPageRoute(builder: (_) => UserScreen(args: args));
            case UserListScreen.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => UserListScreen());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found'),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}

