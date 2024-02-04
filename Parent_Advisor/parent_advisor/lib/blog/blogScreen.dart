import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:parent_advisor/blog/blog_detay.dart';
import 'package:parent_advisor/blog/blog_detay_provider.dart';
import 'package:parent_advisor/blog/blog_list.dart';
import 'package:parent_advisor/pages_button/aktiviteScreen.dart';
import 'package:parent_advisor/pages_button/homeScreen.dart';
import 'package:parent_advisor/pages_button/profileScreen.dart';
import 'package:parent_advisor/pages_button/soruSor.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
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
  late final dynamic blogProvider;

  @override
  void initState() {
    super.initState();

    // Get the BlogProvider
    blogProvider = Provider.of<BlogProvider>(context, listen: false);
  }

  void goToBlog(int blogIndex) {
    blogProvider.currentBlogIndex = blogIndex;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlogDetayScreen()),
    );
  }

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
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(206, 106, 10, 240),
              Color.fromARGB(255, 117, 6, 208),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Consumer<BlogProvider>(
          builder: (context, value, child) {
            final List<Blog> bloglist = value.bloglist;

            return ListView.builder(
              itemCount: (bloglist.length / 2).ceil(),
              itemBuilder: (context, index) {
                final int startIndex = index * 2;

                return InkWell(
                  onTap: () => goToBlog(startIndex),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => goToBlog(startIndex),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset(
                              bloglist[startIndex].image,
                              width: 170,
                              height: 170,
                            ),
                          ),
                        ),
                        if (startIndex + 1 < bloglist.length)
                          InkWell(
                            onTap: () => goToBlog(startIndex + 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.asset(
                                bloglist[startIndex + 1].image,
                                width: 170,
                                height: 170,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
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
