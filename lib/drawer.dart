import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/Authentication/page/login_page.dart';
import 'package:iramakain/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:iramakain/Partnership/page/partnership.dart';
import 'package:iramakain/Marketplace/page/marketplace_page.dart';
import 'package:iramakain/page/mainpage.dart';

class IramaKainDrawer extends StatefulWidget {
  const IramaKainDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _IramaKainDrawerState();
}

class _IramaKainDrawerState extends State<IramaKainDrawer> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          // ListTile(
          //   title: const Text('Home'),
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(builder: (context) => const MyHomePage()),
          //     );
          //   },
          // ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Donation'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DonationInfo()),
              );
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyPartnershipPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Marketplace'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MarketplacePage()),
              );
            },
          ),
          Visibility(
            visible: (() {
              if (request.loggedIn) {
                return true;
              }
              return false;
            }()),
            child: ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/profile");
              },
            ),
          ),
          ListTile(
            title: (() {
              if (request.loggedIn) {
                return const Text("Log out");
              } else {
                return const Text("Log in");
              }
            }()),
            onTap: () async {
              if (request.loggedIn) {
                final response = await request.logout(
                    "https://irama-kain.up.railway.app/Authentication/logout_flutter");
                if (!mounted) {
                  return;
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              } else {
                Navigator.pushReplacementNamed(context, "/login");
              }
            },
          ),
        ],
      ),
    );
  }
}
