import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:iramakain/Authentication/page/login_page.dart';
import 'package:iramakain/Authentication/page/register_page.dart';
import 'package:iramakain/Authentication/page/success_page.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/Partnership/page/partnership.dart';

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
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        initialRoute: '/login',
        routes: {
          // '/': (context) => const OnBoarding(),
          // '/main': (context) => const MainPage();
          '/login': (BuildContext context) => const LoginPage(),
          // "/home" : (context) => HomePage(),
          '/partnership': (BuildContext context) => const MyPartnershipPage(),
          '/register': (BuildContext context) => const RegisterPage(),
          '/success': (BuildContext context) => const SuccessPage(),
        },
      ),
    );
  }
}
