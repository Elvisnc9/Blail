import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'presentation/Inbox/inboxScreen.dart';
import 'presentation/Log_In/Login.dart';
import 'presentation/Sign_Up/Sign_up.dart';
import 'presentation/SplashScreen/splashScreen.dart';


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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'bail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
       routes: {
        '/': (context) => const Splashscreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login' : (context) => const LoginScreen(),
         '/inbox': (context) => const InboxScreen(),
        //  '/message': (context) => const MessageView()
      },
    );
  }
}




