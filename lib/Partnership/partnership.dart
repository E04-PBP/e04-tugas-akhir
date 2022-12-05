import 'package:iramakain/main.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:flutter/material.dart';

class MyPartnershipPage extends StatefulWidget {
    const MyPartnershipPage({super.key});

    @override
    State<MyPartnershipPage> createState() => _MyPartnershipPageState();
}

class _MyPartnershipPageState extends State<MyPartnershipPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Contact Us'),
            ),
            drawer: Drawer(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: "Home Page")),
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
                  ],
                ),
              ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('PARTNERSHIP PAGE'),
                    ],
                ),
            ),
        );
    }
}