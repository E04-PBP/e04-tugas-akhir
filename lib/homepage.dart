import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:iramakain/Donation/page/widgetLogged.dart';
import 'package:iramakain/Donation/page/widgetNonLogged.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/appbar.dart';
import 'package:iramakain/Donation/models/fetches.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:iramakain/Donation/page/detaildonations.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  _HomepageState();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: Text('HOMEPAGE')),
      drawer: const IramaKainDrawer(),
      body: Container(
          child: SingleChildScrollView(
              child: Image.asset(
        "lib/Donation/assets/img/iramakainhp.png",
        fit: BoxFit.fitWidth,
      ))),
      // alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   image: DecorationImage(image: AssetImage("lib/Donation/assets/img/iramakainhp.png"),

      //     fit: BoxFit.cover,
      //   ),
      // ),/
    );
  }
}
