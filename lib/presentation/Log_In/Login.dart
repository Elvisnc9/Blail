import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // const Icon(Icons.arrow_forward, color: Colors.white,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/inbox');
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Column(
                      children: [
                        SizedBox(
                          child: Image.asset(
                            'assets/images/Asset 7@3x.png',
                            height: 20.h,
                          ),
                        ),
                        Text(
                          'Welcome to Blail',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 3.h,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.66,
                            color: const Color(0xFFF8FAFC),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Say your catch phrase to sign in\n',
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
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Say Create to ',
                            style: GoogleFonts.poppins(
                              fontSize: 2.5.h,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF7F7F7F),
                            ),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.poppins(
                              fontSize: 2.7.h,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF7F7F7F),
                            ),
                          ),
                        ],
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
                    'assets/images/voice tracker.gif',
                    fit: BoxFit.fill,
                    width: 500,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
