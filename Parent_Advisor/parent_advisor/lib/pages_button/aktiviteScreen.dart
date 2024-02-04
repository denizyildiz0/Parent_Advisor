import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parent_advisor/blog/blogScreen.dart';
import 'package:parent_advisor/etkinlikler/etkinlik.dart';
import 'package:parent_advisor/pages_button/homeScreen.dart';
import 'package:parent_advisor/pages_button/profileScreen.dart';
import 'package:parent_advisor/pages_button/soruSor.dart';
import 'package:parent_advisor/sohbet/sohbet_kart.dart';
import 'package:parent_advisor/songs/songScreen.dart';
import 'package:parent_advisor/tarifler/tarif_kart.dart';

class EtkinlikScreen extends StatefulWidget {
  const EtkinlikScreen({Key? key});

  @override
  State<EtkinlikScreen> createState() => _EtkinlikScreenState();
}

class _EtkinlikScreenState extends State<EtkinlikScreen> {
  final items = const [
    Padding(
      padding: EdgeInsets.all(11.0),
      child: Column(
        children: [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Anasayfa",
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Icon(
            Icons.question_mark,
            color: Colors.orange,
            size: 20,
          ),
          Text(
            "Soru Sor",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Icon(
            Icons.menu_book,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Bloglar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Icon(
            Icons.interests,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Etkinlik",
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Icon(
            Icons.person_2,
            color: Colors.white,
            size: 20,
          ),
          Text(
            "Profil",
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
  ];

  int index = 2;

  int _selectedImageIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70.0,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });

          switch (selectedIndex) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SoruSorScreen()));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlogScreen()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EtkinlikScreen()));
              break;
            case 4:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
              break;
              
          }
        },
        backgroundColor: Color.fromRGBO(79, 17, 187, 1),
        color: Color.fromARGB(206, 46, 3, 165),
      ),
    body: Stack(
      
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 Color.fromARGB(206, 106, 10, 240),
                 Color.fromARGB(255, 117, 6, 208),
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
                    _buildClickableImage(
                      imagePath: "assets/images/s.jpg",
                      text: "SOHBET KARTLARI",
                      index: 0,
                    ),
                    SizedBox(width: 20),
                    _buildClickableImage(
                      imagePath: "assets/images/etkinlik.jpg",
                      text: "ETKİNLİKLER",
                      index: 1,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildClickableImage(
                      imagePath: "assets/images/c.jpg",
                      text: "ÇOCUK ŞARKILARI",
                      index: 2,
                    ),
                    SizedBox(width: 20),
                    _buildClickableImage(
                      imagePath: "assets/images/h.jpg",
                      text: "ATIŞTIRMALIK TARİF",
                      index: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 10,
          right: 10,
          child: Center(
            child: Text(
              "Hadi Biraz Eğlence",
              style: TextStyle(
                color: Color.fromARGB(197, 222, 222, 222),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }

  Widget _buildClickableImage({required String imagePath, required String text, required int index}) {
    return InkResponse(
      onTap: () {
        setState(() {
          _selectedImageIndex = index;
        });

        _navigateToScreen(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: _selectedImageIndex == index ? Colors.blue : Colors.transparent, width: 2.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imagePath,
                width: 145,
              ),
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(168, 235, 235, 235),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(int index) {
    // Example navigation, replace this with your actual navigation logic
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => SohbetKartlariScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => EtkinlikListe()));
        break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => SongScreen()));
          break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AtistirmalikTarifScreen()));
        break;
    }
  }
}


Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 1:
        return const SoruSorScreen();
      case 2:
        return const BlogScreen();
      case 3:
        return const EtkinlikScreen();
      case 4:
        return const ProfileScreen();
    }
    return Container();
  }




