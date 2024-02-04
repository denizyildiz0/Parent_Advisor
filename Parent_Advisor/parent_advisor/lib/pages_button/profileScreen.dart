import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_advisor/components/neu_box2.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

     clearData() {
    if (kIsWeb) {
      //web
      clearDataIOS();
    }
    else{
      if (Platform.isIOS || Platform.isMacOS) {
      clearDataIOS();
    } else {
      clearDataMaterial();
    }
    }
  }

  clearDataIOS() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
              title: Row(children: [Icon(Icons.warning), Text("Uyarı!")]),
              content: Text("Kullanıcıyı sileceksiniz emin misiniz?"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () async {
                    final SharedPreferences storage =
                        await SharedPreferences.getInstance();
                    storage.clear();
                  },
                  child: Text("Yes"),
                  isDestructiveAction: true,
                ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("No"),
                ),
              ],
            ));
  }

  clearDataMaterial() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Row(children: [Icon(Icons.warning), Text("Uyarı!")]),
              content: Text("Kullanıcıyı sileceksiniz emin misiniz?"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences storage =
                          await SharedPreferences.getInstance();
                      storage.clear();
                    },
                    child: Text("Yes")),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("No")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Opacity(
              opacity: 0.6,
              child: SvgPicture.asset(
                "assets/images/wave-10.svg",
                height: 250,
                width: 150,
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(bottom: 450),
              child: Center(
                child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  gradient: LinearGradient(colors: [
                    Colors.purple,
                    Colors.orange,
                    Color.fromARGB(255, 151, 145, 232),
                  ]),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                    "assets/images/kadin1.jpeg"),
                    radius: 80,
                  ),
                ),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 240),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Alessi Clark",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black87),),
                  )],
              ),
            ),
              
             Padding(
               padding: const EdgeInsets.only(top: 160),
               child: Center(
                 child: NeuBoxx(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text("K U L L A N I C I    B İ L G İ L E R İ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.black87),),
                    SizedBox(height: 12),
                    Text("E-MAİL",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black54),),
                    SizedBox(height: 5),
                    Text("denizz.yldz8@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.black38),),
                    SizedBox(height: 7),
                    Divider(),
                    Text("ŞİFRE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black54),),
                    SizedBox(height: 5),
                    Text("12345678",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.black38),),
                    SizedBox(height: 7),
                    Divider(),
                    Text("ÇOCUKLARIM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.black54),),
                    SizedBox(height: 5),
                    Text("John Clark - Larissa Clark",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.black38),),
                    SizedBox(height: 10),
                    Divider(),
                    InkWell(
                      child:
                     TextButton(onPressed: clearDataIOS,
                      child: Text("Kullanıcıyı Sil",
                       style: TextStyle(color: Color.fromARGB(221, 82, 43, 239)),),
                      style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 218, 217, 217)),
                      ),
                      ),
                      ),

                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed:() {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                      style: ElevatedButton.styleFrom(
                         backgroundColor: const Color.fromARGB(255, 218, 217, 217),
                      ),
                     child: Text("Anasayfaya Dön",
                     style: TextStyle(color: Color.fromARGB(221, 82, 43, 239)),),
                    
                    ),

                    
                  ],
                 )),
               ),
             ),
            
            
            Positioned(
            bottom: 1,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                "assets/images/wave-8.svg",
                height: 160,
                width: 170,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
