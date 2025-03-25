import 'package:bail/presentation/Auth_screen/Auth_screen.dart';
import 'package:bail/presentation/Auth_screen/signup.dart';
import 'package:bail/presentation/Inbox/inboxScreen.dart';
import 'package:bail/widgets/authMethod.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const AuthScreen(
      screenTitle: 'Sign In to Blail',
       hintText: 'Say your catch Phrase to Sign in ',
        initialtext: 'Say Create to Sign up',
          targetScreen: SignUpScreen(),
           keytext: 'create', nextScreen: HomePage(),
            authmethod: AuthMethod()
          );
  }
}