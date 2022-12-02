import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iramakain/main.dart';

class DonationForm extends StatefulWidget {
  DonationForm({super.key});

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  _DonationFormState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Donation Form'),
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
            Text("DONATION FORM")
          ],
        ));
  }
}
