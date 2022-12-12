import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iramakain/widget/title.dart';

import '../../appbar.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key?key}) : super(key : key);
  static const routeName = '/faq';

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(context, "FAQ"),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              SizedBox(height:20,),
              Container(
                child: TitleHeader(textTop: "Frequently Asked Questions"),
              ),
              ExpansionTile(
                title: Text("Lorem Ipsum"))
              )
            ])
          )
        ])
      )
    )
  }
}