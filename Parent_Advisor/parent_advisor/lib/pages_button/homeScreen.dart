import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parent_advisor/blog/blogScreen.dart';
import 'package:parent_advisor/pages_button/aktiviteScreen.dart';
import 'package:parent_advisor/pages_button/profileScreen.dart';
import 'package:parent_advisor/pages_button/soruSor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    backgroundColor: Color.fromARGB(206, 140, 66, 243),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Günün Sözü",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    "assets/images/soz.jpg", 
                    width: 350,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Önerilen Ebeveyn Çözümleri",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BlogKutu("assets/images/blog1.jpg"), 
                      BlogKutu("assets/images/blog5.jpg"), 
                      BlogKutu("assets/images/blog7.jpg"), 
                      BlogKutu("assets/images/blog10.jpg"), 
                      BlogKutu("assets/images/blog4.jpg"), 
                      BlogKutu("assets/images/blog3.jpg"), 
                      BlogKutu("assets/images/blog8.jpg"), 
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Popüler Aramalar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                   color: Colors.white,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BlogArama("Hırçınlık"),
                      BlogArama("Zorbalık"),
                      BlogArama("Sınır Koyma"),
                      BlogArama("Tırnak Yeme"),
                      BlogArama("Üstün Zeka"),
                      BlogArama("Mükemmelliyetçilik"),
                      BlogArama("İnatçılık"),
                      BlogArama("Utangaçlık"),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Eğlence Zamanı...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        EtkinlikKutu("assets/images/s.jpg"), 
                        EtkinlikKutu("assets/images/etkinlik.jpg"), 
                        EtkinlikKutu("assets/images/c.jpg"), 
                        EtkinlikKutu("assets/images/h.jpg"), 
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bu Haftanın Bülteni",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        "assets/images/anaodev.jpg", 
                        width: 350,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Öneri ve İstekler İçin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        "assets/images/oneri.jpg", 
                        width: 250,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
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

  Padding BlogKutu(String photo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              photo,
              width: 120,
            ),
          )
        ],
      ),
    );
  }

  Padding EtkinlikKutu(String photo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              photo,
              width: 100,
            ),
          )
        ],
      ),
    );
  }

  Padding BlogArama(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(85, 218, 217, 217),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
