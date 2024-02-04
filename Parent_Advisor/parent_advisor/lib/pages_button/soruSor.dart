import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parent_advisor/blog/blogScreen.dart';
import 'package:parent_advisor/pages_button/aktiviteScreen.dart';
import 'package:parent_advisor/pages_button/homeScreen.dart';
import 'package:parent_advisor/pages_button/profileScreen.dart';

class SoruSorScreen extends StatefulWidget {
  const SoruSorScreen({Key? key}) : super(key: key);

  @override
  State<SoruSorScreen> createState() => _SoruSorScreenState();
}

class _SoruSorScreenState extends State<SoruSorScreen> {

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sorusorb.png'), 
            fit: BoxFit.cover,
          ),
        ),
        ),
      );
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
