//AUTHMETHOD
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class AuthMethod extends StatelessWidget {
  const AuthMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
               Lottie.asset('assets/lottie/googgle.json',
                width: 16.w, reverse: true, repeat: false    ), SizedBox(width: 1.w),
            Lottie.asset('assets/lottie/twitter.json',
            frameRate: FrameRate.max,
             width: 16.w, repeat: false
             ), SizedBox(width: 1.w),
                
      ],
    );
  }
}
