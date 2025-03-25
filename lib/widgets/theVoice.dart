//THEVOICE
import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class The_Voice extends StatelessWidget {
  const The_Voice({
    super.key,
    required bool isListening,
  }) : _isListening = isListening;

  final bool _isListening;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: 27.h,
        child: Image.asset(
          _isListening
              ? 'assets/images/voice tracker.gif'
              : 'assets/images/voice-tracker.png',
          fit: BoxFit.fill,
          width: double.infinity
        ),
      ),
    );
  }
}


