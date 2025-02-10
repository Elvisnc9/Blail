// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';
import 'dart:io' show Platform;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isInitializing = false;
  String _text = "Say your catch phrase...";
  // ignore: unused_field
  double _confidence = 1.0;

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
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _requestPermissions().then((_) {
      _initializeSpeech();
    });
    _checkPlatformSupport();
  }

  Future<void> _requestPermissions() async {
    await Permission.microphone.request();
  }

  Future<void> _initializeSpeech() async {
    setState(() => _isInitializing = true);
    bool available = await _speech.initialize(
      onStatus: (status) => print("Status: $status"),
      onError: (errorNotification) => print("Error: $errorNotification"),
    );
    setState(() => _isInitializing = false);
    if (!available) {
      print("Speech recognition not available");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition not available on this device")),
      );
    }
  }

  void _checkPlatformSupport() {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Speech recognition is not supported on desktop platforms")),
      );
    }
  }

  void _startListening() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      bool available = await _speech.initialize(
        onStatus: (status) => print("Status: $status"),
        onError: (errorNotification) => print("Error: $errorNotification"),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              _confidence = result.confidence;
            }
          });
        });
      } else {
        print("Speech recognition not available");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Speech recognition not available on this device")),
        );
      }
    } else {
      print("Microphone permission denied");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Microphone permission denied")),
      );
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ))),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Image.asset('assets/images/Asset 7@3x.png', height: 20.h),
                    Text(
                      'Sign Up to Blail',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 3.h,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.66,
                        color: const Color(0xFFF8FAFC),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Say your supposed catch phrase\n',
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
                    SizedBox(height: 5.h),
                    TextHighlight(
                      text: _text,
                      words: _highlights,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 2.5.h,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7F7F7F),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 30.h,
                child: Image.asset(
                  _isListening ? 'assets/images/voice tracker.gif' : 'assets/images/voice-tracker.png',
                  fit: BoxFit.fill,
                  width: 500,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _isInitializing
          ? const CircularProgressIndicator()
          : AvatarGlow(
              animate: _isListening,
              glowColor: const Color(0xFF7F7F7F),
              duration: const Duration(milliseconds: 2000),
              repeat: true,
              child: FloatingActionButton(
                splashColor: const Color(0xFF7F7F7F),
                backgroundColor: const Color(0xFF7F7F7F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: _isListening ? _stopListening : _startListening,
                child: Icon(_isListening ? Icons.mic : Icons.mic_off, color: Colors.black),
              ),
            ),
    );
  }
}