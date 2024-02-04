import 'package:flutter/material.dart';

//karşılama ekran 2
class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 47, 6, 84),
                Color.fromARGB(206, 139, 75, 228),
                Color.fromARGB(255, 89, 84, 225),
                Color.fromARGB(255, 6, 4, 48),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            "assets/images/annebebek.png",
            width: 250,
          ),
        ),
        Positioned(
          top: 120, 
          left: 40, 
          right: 20, 
          child: Center(
            child: Text(
              "Size özel makalelerimiz sayesinde bebeklerinizde olan sorunlar hakkında tecrübe sahibi olun...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
