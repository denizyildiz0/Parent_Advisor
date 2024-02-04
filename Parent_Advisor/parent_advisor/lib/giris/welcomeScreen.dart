import 'package:flutter/material.dart';
import 'package:parent_advisor/giris/intro_page_1.dart';
import 'package:parent_advisor/giris/intro_page_2.dart';
import 'package:parent_advisor/giris/intro_page_3.dart';
import 'package:parent_advisor/giris/loginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//karşılama widgetlwrını bıirlşetırdıgım sayfa
class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  //controller to keep track of which page we're on
  PageController _controller = PageController();

  //keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          //dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: NeonButton("ATLA"),               
                ),

                //dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: NeonButton("GİRİŞ"),         
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                         child: NeonButton("İLERİ"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



Widget NeonButton(String title) {
    return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(colors: [
                        Colors.pinkAccent,
                        Colors.indigoAccent,
                      ],
                      ),
                      boxShadow: [
                        BoxShadow(
                        color:  Color.fromARGB(255, 0, 0, 0).withOpacity(0.5), // Adjust the color and opacity
                          blurRadius: 40,
                          spreadRadius: 7,
                          offset: Offset(2,4),
                      )]),
                  child: Center(
                      child: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                );
  }
}
