import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:iramakain/widget/title.dart';
import 'package:iramakain/page/mainpage.dart';

import '../../appbar.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TitleHeader(textTop: "Frequently Asked Questions"),
                ),
                ExpansionTile(
                  title: Text("How do I submit my donations?"),
                  textColor: Color.fromRGBO(138, 43, 226, 1),
                  children: [
                    Container(
                      color: Color.fromARGB(255, 75, 75, 75),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Text(
                          "You can simply go to our donation page, fill out the forms and follow the instructions given."),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text("How do you help the environment?"),
                  textColor: Color.fromRGBO(138, 43, 226, 1),
                  children: [
                    Container(
                      color: Color.fromARGB(255, 75, 75, 75),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Text(
                          "We help the environment by recycling the fabric waste and also donate our profits to those who need."),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TitleHeader(textTop: "Need more information? Ask us!"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Input Your Question",
                    icon: const Icon(Icons.wechat_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]))
        ])));
  }
}
