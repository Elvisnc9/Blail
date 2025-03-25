import 'package:flutter/material.dart';

class LottieLoader extends StatelessWidget {
  const LottieLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Image.asset(
          'assets/images/loading.gif',
          width : 100 ,
          height: 100 ,
        ),
      ),
    );
  }
}
