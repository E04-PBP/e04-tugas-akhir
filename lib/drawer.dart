import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/Authentication/page/login_page.dart';

class IramaKainDrawer extends StatefulWidget {
  const IramaKainDrawer({super.key});

  @override
  State<StatefulWidget> createState() => _IramaKainDrawerState();
}

class _IramaKainDrawerState extends State<IramaKainDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "Home Page")),
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
            title: const Text('Login'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
