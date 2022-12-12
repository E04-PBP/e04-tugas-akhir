import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/FAQ/page/faq_page.dart';
import 'package:iramakain/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:iramakain/Authentication/page/login_page.dart';
import 'package:iramakain/Authentication/page/register_page.dart';
import 'package:iramakain/Authentication/page/success_page.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/Partnership/page/partnership.dart';
import 'package:iramakain/homepage.dart';

import 'package:iramakain/Profile/page/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final List<Widget> _options = <Widget>[
    Homepage(),
    FaqPage(),
    DonationInfo(),
    MyPartnershipPage(), // delete
    // Profile(),
    // MarketPlace(),
    // FAQ
    ProfilePage(), // delete
  ];

  final List<BottomNavigationBarItem> _button = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wechat_outlined),
      label: 'FAQ',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.drafts_rounded),
      label: 'Donation',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_basket),
      label: 'Shop',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _options.elementAt(_index),
      bottomNavigationBar: Container(
          height: 69.0,
          child: BottomNavigationBar(
            items: _button,
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            selectedItemColor: Color.fromRGBO(38, 38, 38, 1),
            selectedFontSize: 12.0,
            unselectedItemColor: Color.fromRGBO(170, 195, 138, 1),
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          )),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.green,
      //     onPressed: () {},
      //     child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}

/* 
FAQ:
wechat_outlined

DONATION:
drafts_rounded 

MARKETPLACE:
store
shopping_basket 

PARTNERSHIP:
phone_rounded

PROFILE:
person_rounded 

ARROW:
arrow_circle_right_outlined 
*/
