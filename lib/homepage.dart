import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
