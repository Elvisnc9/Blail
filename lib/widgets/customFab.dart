//CUSTOMFAB
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final bool isListening;
  final bool isInitializing;
  final VoidCallback onStartListening;
  final VoidCallback onStopListening;

  const CustomFAB({
    super.key,
    required this.isListening,
    required this.isInitializing,
    required this.onStartListening,
    required this.onStopListening,
  });

  @override
  Widget build(BuildContext context) {
    return isInitializing
        ? const CircularProgressIndicator()
        : AvatarGlow(
            animate: isListening,
            glowColor: const Color(0xFF7F7F7F),
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            child: FloatingActionButton(
              splashColor: const Color(0xFF7F7F7F),
              backgroundColor: const Color(0xFF7F7F7F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: isListening ? onStopListening : onStartListening,
              child: Icon(
                isListening ? Icons.mic : Icons.mic_off,
                color: Colors.black,
              ),
            ),
          );
  }
}
