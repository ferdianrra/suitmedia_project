import 'package:flutter/material.dart';
import 'package:practices/commons/assets.dart';
import 'package:practices/commons/color.dart';
import 'package:practices/commons/const.dart';
import 'package:practices/commons/space.dart';
import 'package:practices/presentation/screen/user_screen.dart';
import 'package:practices/presentation/widgets/custom_text_button.dart';
import 'package:practices/presentation/widgets/custom_text_field.dart';

class PalindromeScreen extends StatefulWidget {
  const PalindromeScreen({super.key});

  @override
  State<PalindromeScreen> createState() => _PalindromeScreenState();
}

class _PalindromeScreenState extends State<PalindromeScreen> {
  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  void _showPalindromeDialog(bool isPalindrome) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorBackground,
        title: Text(
          dialogPalindromeText,
          style: theme.textTheme.titleMedium,
        ),
        content: Text(isPalindrome ? isPalindromeText : notPalindromeText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(nextButtonText),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image(
                  image: AssetImage(profileIconPhoto),
                  width: 116,
                  height: 116,
                ),
                verticalSpaceLarge,
                CustomTextField(
                  nameController: _nameController,
                  hintText: hintName,
                ),
                verticalSpaceRegular,
                CustomTextField(
                  nameController: _palindromeController,
                  hintText: hintPalindrome,
                ),
                verticalSpaceMedium,
                CustomTextButton(
                  text: checkButtonText,
                  onPressed: (){
                    if(_palindromeController.text.trim().isEmpty) {
                      _showErrorSnackbar(errorPalindromeFieldText);
                    } else {
                      String text = _palindromeController.text.trim().toLowerCase().replaceAll(RegExp(r'\s+'), '');
                      bool isPalindrome = text == text.split('').reversed.join('');
                      _showPalindromeDialog(isPalindrome);

                    }
                  },
                ),
                verticalSpaceRegular,
                CustomTextButton(
                  text: nextButtonText,
                  onPressed: (){
                    if(_nameController.text.trim().isEmpty) {
                      _showErrorSnackbar(errorNameFieldText);
                    } else {
                      Navigator.pushNamed(
                        context,
                        UserScreen.ROUTE_NAME,
                        arguments: _nameController.text.trim(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

