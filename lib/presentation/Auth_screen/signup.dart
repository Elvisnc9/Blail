import 'package:bail/presentation/Auth_screen/Auth_screen.dart';
import 'package:bail/presentation/Auth_screen/Login.dart';
import 'package:bail/widgets/authMethod.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const AuthScreen(
      screenTitle: 'Welcome to Blail',
       hintText: 'Create your supposed Catch Phrase ',
        initialtext: 'Say LogIn to SignIn ', 
        targetScreen: LoginScreen(),
         keytext: 'login', nextScreen: LoginScreen(), authmethod: AuthMethod()
        
        );
  }
}