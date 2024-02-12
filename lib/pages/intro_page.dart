import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/menu_page.dart';

class IntroPage extends StatelessWidget {
  static const String routeName = 'IntroPage';
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg-1.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4,
          sigmaY: 4,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20.0,
              ),

              Text(
                '寿 司',
                style: GoogleFonts.mPlus2(
                  fontSize: 50,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),

              const SizedBox(
                width: 200,
                child: Text(
                  'The best fresh sushi delivered straight to your door.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(
                height: 25.0,
              ),
              // Button

              MyButton(
                text: "GET STARTED",
                width: 200,
                onTap: () {
                  Navigator.pushReplacementNamed(context, MenuPage.routeName);
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
