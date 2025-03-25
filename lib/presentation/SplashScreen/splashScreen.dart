import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bail/presentation/Auth_screen/Login.dart';
import 'package:bail/presentation/Auth_screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:  
          Image.asset('assets/images/Asset 7@3x.png',),
      
          // Image.asset('assets/images/loading.gif' , height: 50,)
        
       nextScreen: const SignUpScreen(),
    backgroundColor: Colors.black,
    duration: 2000,
    splashIconSize: 20.h,
    animationDuration: const Duration(milliseconds: 1500),
    splashTransition: SplashTransition.scaleTransition,
    pageTransitionType: PageTransitionType.bottomToTop,
    
    
    
    
    );
  }
}