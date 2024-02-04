import 'package:flutter/material.dart';
import 'package:parent_advisor/blog/blog_detay_provider.dart';
import 'package:parent_advisor/etkinlikler/etkinlik_provider.dart';
import 'package:parent_advisor/songs/playlist_provider.dart';
import 'package:parent_advisor/tarifler/bebek_tarif.dart';
import 'package:parent_advisor/blog/blogScreen.dart';
import 'package:parent_advisor/tarifler/cocuk_tarif.dart';
import 'package:parent_advisor/sohbet/cocuktan_ebeveyne_soru.dart';
import 'package:parent_advisor/sohbet/ebeveyden_cocuga_soru.dart';
import 'package:parent_advisor/pages_button/aktiviteScreen.dart';
import 'package:parent_advisor/pages_button/homeScreen.dart';
import 'package:parent_advisor/sohbet/karsilikli_soru.dart';
import 'package:parent_advisor/giris/loginScreen.dart';
import 'package:parent_advisor/pages_button/profileScreen.dart';
import 'package:parent_advisor/giris/registerScreen.dart';
import 'package:parent_advisor/sohbet/sorBanaAciklama.dart';
import 'package:parent_advisor/pages_button/soruSor.dart';
import 'package:parent_advisor/giris/welcomeScreen.dart';
import 'package:parent_advisor/tarifler/tarif_cocuk_provider.dart';
import 'package:parent_advisor/tarifler/tarif_provider.dart';
import 'package:parent_advisor/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlayListProvider()),
        ChangeNotifierProvider(create: (context) => TarifProvider()),
        ChangeNotifierProvider(create: (context) => CocukTarifProvider()),
        ChangeNotifierProvider(create: (context) => EtkinlikProvider()),
        ChangeNotifierProvider(create: (context) => BlogProvider()),
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
         '/register': (context) => RegisterScreen(),
         '/welcome': (context) => welcomeScreen(),
         '/home': (context) => HomeScreen(),
         '/uzmana':(context) => SoruSorScreen(),
         '/etkinlik':(context) => EtkinlikScreen(),
         '/profil':(context) => ProfileScreen(),
         '/blog':(context) => BlogScreen(),
         '/oyunaciklama':(context) => SorBanaAciklama(),
         '/cocuktanEbeveyne':(context) => CocuktanEbeveyneSoru(),
         '/ebeveyndenCocuga':(context) => EbeveyndenCocugaSoru(),
         '/karsilikli':(context) => KarsilikliSoru(),
         '/bebek':(context) => BebekTarif(),
         '/cocuk':(context) => CocukTarif(),

         },
      
      theme: ThemeData(
),
     initialRoute: '/welcome',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: LoginScreen());
  }
}
  