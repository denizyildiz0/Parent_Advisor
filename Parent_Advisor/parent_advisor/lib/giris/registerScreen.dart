import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_advisor/components/rounded_button.dart';
import '../components/kayit_input_field.dart';


// Giriş yap ekranı
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Opacity(
              opacity: 0.6,
              child: SvgPicture.asset(
                "assets/images/wave.svg",
                
                height: 200,
                width: 150,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/plogo.png",
                    height: 270,
                  ),
                ],
              ),
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    height: 440,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffF3F3F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: false,
                          isPassword: false,
                          hintText: "Ad Soyad",
                          icon: Icons.person_2_outlined,
                          onChange: (value) {},
                        ),
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: true,
                          isPassword: false,
                          hintText: "E-mail",
                          icon: Icons.email_outlined,
                          onChange: (value) {},
                        ),
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: false,
                          isPassword: true,
                          hintText: "Şifre",
                          icon: Icons.lock_outlined,
                          onChange: (value) {},
                        ),
                        KayitInputField(
                          isAdSoyad: true,
                          inPhoneNumber: "",
                          isEmail: false,
                          isPassword: false,
                          hintText: "Telefon",
                          icon: Icons.phone,
                          onChange: (value) {},
                        ),
                        RoundedButton(
                          text: "Kayıt Ol",
                          press: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          color: Color(0xFF3F3D56),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
               ),

          Positioned(
            bottom: 1,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                "assets/images/wave-2.svg",
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
