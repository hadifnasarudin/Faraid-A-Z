import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // bila user tekan screen, pergi ke LandingPage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        },
        child: Container(
          color: const Color(0xFFD9D9D9),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/Faraid_A-Z.png',
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
