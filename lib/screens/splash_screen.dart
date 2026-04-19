import 'package:flutter/material.dart';
//import 'main_screen.dart';
import 'main_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainWrapper()),
          );
        },
        child: Stack(
          children: [
            // 🔥 Full screen image
            Positioned.fill(
              child: Image.asset(
                'lib/assets/images/Gemini_Generated_Image_1.png', // ❗ buang lib/
                fit: BoxFit.cover,
              ),
            ),

            // (optional) overlay gelap sikit
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),

            
          ],
        ),
      ),
    );
  }
}
