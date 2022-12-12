import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/drawer.dart';
import 'package:provider/provider.dart';
import 'package:iramakain/homepage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:iramakain/Authentication/page/login_page.dart';
import 'package:iramakain/Authentication/page/register_page.dart';
import 'package:iramakain/Authentication/page/success_page.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/Partnership/page/partnership.dart';
import 'package:iramakain/Profile/page/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Irama Kain',
        theme:
            ThemeData(fontFamily: 'Stratford', primarySwatch: Colors.deepPurple
                // hintColor: Color.fromRGBO(138, 43, 226, 1),
                ),
        initialRoute: '/home',
        routes: {
          // '/': (context) => const OnBoarding(),
          // '/main': (context) => const MainPage();
          '/login': (BuildContext context) => const LoginPage(),
          '/donation': (context) => DonationInfo(),
          '/home': (context) => Homepage(),

          // "/home" : (context) => HomePage(),
          '/partnership': (BuildContext context) => const MyPartnershipPage(),
          '/profile': (BuildContext context) => const ProfilePage(),
          '/success': (BuildContext context) => const SuccessPage(),
          '/register': (BuildContext context) => const RegisterPage(),
        },
      ),
    );
  }
}
