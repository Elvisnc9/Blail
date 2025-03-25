// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechProvider extends ChangeNotifier {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _isInitializing = false;
  String _text = "Say Login to Sign In";
  double _confidence = 1.0;

  SpeechProvider() {
    _speech = stt.SpeechToText();
    _initializeSpeech();
  }

  bool get isListening => _isListening;
  bool get isInitializing => _isInitializing;
  String get text => _text;
  double get confidence => _confidence;

  Future<void> _initializeSpeech() async {
    _isInitializing = true;
    notifyListeners();

    await Permission.microphone.request();
    bool available = await _speech.initialize(
      onStatus: (status) => print("Status: $status"),
      onError: (error) => print("Error: $error"),
    );

    _isInitializing = false;
    if (!available) {
      print("Speech recognition not available");
    }
    notifyListeners();
  }

  void startListening() async {
    if (await Permission.microphone.isGranted) {
      bool available = await _speech.initialize(
        onStatus: (status) => print("Status: $status"),
        onError: (error) => print("Error: $error"),
      );

      if (available) {
        _isListening = true;
        _speech.listen(onResult: (result) {
          _text = result.recognizedWords;
          if (result.hasConfidenceRating && result.confidence > 0) {
            _confidence = result.confidence;
          }
          _processSpeechCommand(_text);
          notifyListeners();
        });
      }
    }
  }

  void stopListening() {
    _isListening = false;
    _speech.stop();
    notifyListeners();
  }

  void _processSpeechCommand(String spokenText) {
    if (spokenText.toLowerCase() == "login" "create") {
      print("Navigate to Login"); // Handle navigation globally
    }
  }
}
