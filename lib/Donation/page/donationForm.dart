import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/drawer.dart';

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
        drawer: const IramaKainDrawer(),
        body: Column(
          children: <Widget>[Text("DONATION FORM")],
        ));
  }
}
