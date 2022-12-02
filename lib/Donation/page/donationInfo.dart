import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iramakain/main.dart';

class DonationInfo extends StatefulWidget {
  DonationInfo({super.key});

  @override
  State<DonationInfo> createState() => _DonationInfoState();
}

class _DonationInfoState extends State<DonationInfo> {
  _DonationInfoState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Donation Info'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                title: const Text('Home Page'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: "Home Page")),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Text("DONATION INFO")
          ],
        ));
  }
}
