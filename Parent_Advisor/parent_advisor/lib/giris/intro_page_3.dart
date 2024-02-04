import 'package:flutter/material.dart';

//karşılama ekran 3
class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key});

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
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ImageContainer(
                      imagePath: "assets/images/s.jpg",
                      text: "SOHBET KARTLARI",
                    ),
                    SizedBox(width: 20),
                    ImageContainer(
                      imagePath: "assets/images/etkinlik.jpg",
                      text: "ETKİNLİKLER",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ImageContainer(
                      imagePath: "assets/images/c.jpg",
                      text: "ÇOCUK ŞARKILARI",
                    ),
                    SizedBox(width: 20),
                    ImageContainer(
                      imagePath: "assets/images/h.jpg",
                      text: "ATIŞTIRMALIK TARİF",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 40,
          right: 10,
          child: Center(
            child: Text(
              "Çocuklarınızla neşeli vakit geçirmek için aktivitelerimizle tanışın...",
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

  Widget ImageContainer({required String imagePath, required String text}) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              imagePath,
              width: 150,
            ),
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: Color.fromARGB(168, 255, 255, 255),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
