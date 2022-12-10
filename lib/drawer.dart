import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/Authentication/page/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:iramakain/Partnership/page/partnership.dart';

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
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MyHomePage()),
                // );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
