// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:ui';

import 'package:bail/widgets/appLogo.dart';
import 'package:bail/widgets/customFab.dart';
import 'package:bail/widgets/loader.dart';
import 'package:bail/widgets/theVoice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'dart:io' show Platform;
import 'package:connectivity_plus/connectivity_plus.dart';

class AuthScreen extends StatefulWidget {
  final String screenTitle;
  final String hintText;
  final String initialtext;
  final Widget targetScreen;
  final String keytext;
  final Widget nextScreen;
  final Widget authmethod;

  const AuthScreen(
      {super.key,
      required this.screenTitle,
      required this.hintText,
      required this.initialtext,
      required this.targetScreen,
      required this.keytext,
      required this.nextScreen,
       required this.authmethod});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isInitializing = false;
  String _text = " ";
  double _confidence = 1.0;
  double _textOpacity = 1.0;
  final Connectivity _connectivity = Connectivity();
  bool _isOnline = true;
  bool _isLoading = false;
  Timer? _timer;


  
  @override
void dispose() {
  _timer?.cancel(); // 
  super.dispose();
  _speech.stop();
}

  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _text = widget.initialtext;
    _initializeConnectivity();
    _requestPermissions().then((_) {
      if(mounted){
      _initializeSpeech();
      _startListening();
  }});
    _checkPlatformSupport();
  }

  Future<void> _initializeConnectivity() async {
    // Check initial connectivity status
    final List<ConnectivityResult> results =
        await _connectivity.checkConnectivity();
    _updateConnectionStatus(results);

    // Listen for ongoing connectivity changes
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final bool isOnline = results.isNotEmpty &&
        results.any((result) => result != ConnectivityResult.none);
    if (mounted) {
      setState(() => _isOnline = isOnline);
    }

    if (!isOnline && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("No internet connection"),
            duration: Duration(seconds: 2),
            margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
            behavior: SnackBarBehavior.floating),
      );
    }
  }

  Future<void> _requestPermissions() async {
    await Permission.microphone.request();
  }

  Future<void> _initializeSpeech() async {
    if(mounted){
    setState(() => _isInitializing = true);
    bool available = await _speech.initialize(
      onStatus: (status) => print("Status: $status"),
      onError: (errorNotification) => print("Error: $errorNotification"),
    );
    if(mounted){
    setState(() => _isInitializing = false);
    }
    if (!available) {
      print("Speech recognition not available");
    }}
  }

  void _checkPlatformSupport() {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      print("Speech recognition is not supported on desktop platforms");
    }
  }

  void _startListening() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print("Status: $status");
          if (status == "done" && _isListening) {
            _startListening();
          }
        },
        onError: (errorNotification) => print("Error: $errorNotification"),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (result) {
          if (mounted){
          setState(() {
            _text = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              _confidence = result.confidence;
            }
            _processSpeechCommand(_text);
          });
          }
        });
      } else {
        print("Speech recognition not available");
      }
    } else {
      print("Microphone permission denied");
    }
  }

  void _stopListening() {
    if (mounted){
    setState(() => _isListening = false);
    _speech.stop();
  }
  _speech.stop();
  }

  void _processSpeechCommand(String spokenText) async {
    if(!mounted) return;
    if (!_isOnline) {
      if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No internet Connection"),
          margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
          behavior: SnackBarBehavior.floating,
        ),
      );
      }
      return;
    }

    // Update state only if mounted
    if (mounted) {
      setState(() {
        _text = spokenText;
        _textOpacity = 1.0;
      });
    }

    _timer?.cancel();

    // Timer to hide text after 200ms
    _timer = Timer(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _textOpacity = 0.0;
        });
      }
    });

    // Timer to reset text after 2 seconds
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _text = widget.initialtext;
          _textOpacity = 1.0;
        });
      }
    });

    
    await Future.delayed(const Duration(seconds: 2));

    // Update state only if mounted
    if (mounted) {
      setState(() => _isListening = false);
    }

    await Future.delayed(const Duration(seconds: 0));

    if (mounted) {
      setState(() => _isLoading = true);
    }

  
    await Future.delayed(const Duration(seconds: 5));

    
    if (mounted) {
      setState(() => _isLoading = false);
    }

  
    spokenText.trim().split(" ");

    if (spokenText.toLowerCase() == widget.keytext) {
      if(mounted){
      Navigator.push(context,  createRoute(widget.targetScreen ) );
      }
    } else {
      
      Future.delayed(const Duration(milliseconds: 1), () {
        if (mounted) {
          Navigator.push(
            context,
            createRoute(widget.nextScreen),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            if (_isLoading) 
      
      const LottieLoader(), // Fallback if overlay fails
    
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
                    child: Column(
                      children: [
                        SizedBox(height:5.h),
                        const AppLogo(),
                        Text(
                          widget.screenTitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 3.h,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.66,
                            color: const Color(0xFFF8FAFC),
                          ),
                        ),
                        SizedBox(height:1.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.hintText}\n',
                                style: GoogleFonts.poppins(
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF7F7F7F),
                                  height: 1.45,
                                ),
                              ), 
                              TextSpan(
                                text: 'or',
                                style: GoogleFonts.poppins(
                                  fontSize: 2.1.h,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF7F7F7F),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
               
           
                        SizedBox(height:11.h),
                        AnimatedOpacity(
                          opacity: _textOpacity,
                          duration: const Duration(milliseconds: 2500),
                          child: TextHighlight(
                            text: _text,
                            words: _highlights,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 2.5.h,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (_isListening)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Listening...",
                              style: GoogleFonts.poppins(
                                fontSize: 2.h,
                                color: const Color(0xFF7F7F7F),
                              ),
                            ),
                          ),
                       if(_isListening)  SizedBox(height: 1.h),
                       
                       SizedBox(height: 6.h),

                       

                           widget.authmethod,
                      ],
                    ),
                  ),
                ),
                The_Voice(isListening: _isListening)
              ],
            ),
        
  ]
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFAB(
        isListening: _isListening,
        isInitializing: _isInitializing,
        onStartListening: _startListening,
        onStopListening: _stopListening,
      ),
    );
  }
}












Route createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(3.0, 0.0); // Start position (right to left)
      const end = Offset.zero;        // End position
      const curve = Curves.ease;      // Animation curve

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 300), // Set the desired duration
  );
}



