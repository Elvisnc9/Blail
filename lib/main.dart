import 'package:bail/presentation/Auth_screen/signup.dart';
import 'package:bail/presentation/SplashScreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'presentation/Inbox/inboxScreen.dart';
import 'presentation/Auth_screen/Login.dart';


void main() {
 WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: 
  [SystemUiOverlay.bottom]);
  
  runApp(
    TheResponsiveBuilder(builder: (context, orientation, screenType) {
      return const MyApp();
    }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'bail',
      theme: ThemeData(
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white)),

        ),

      
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: GoTransitions.fadeUpwards,
            TargetPlatform.iOS: GoTransitions.cupertino,
            TargetPlatform.macOS: GoTransitions.cupertino,
          },
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),

      
 routes: {
        
        '/' : (context) => const Splashscreen(),
        '/login':(context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
         '/home': (context) => const HomePage(),
        //  '/message': (context) => const MessageView()
      },
      
    );
  }
}



