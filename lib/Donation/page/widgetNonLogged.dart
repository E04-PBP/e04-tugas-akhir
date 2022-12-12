
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
Widget notloggedin(String infoType) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        //  color: Color.fromRGBO(64, 28, 92, 0.8),
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.sentiment_very_dissatisfied_sharp,
                    color: Color.fromRGBO(64, 28, 92, 1),
                  )),
                  TextSpan(
                      text: infoType == "ongoing"
                          ? "\nThere are no ongoing donations yet."
                          : "\nThere are no donation history yet."),
                  TextSpan(text: "\nPlease sign in to start donating.")
                ],
              )),
        ),
      ),
    );
  }


  

  Widget donationBarNonLogged(BuildContext context  ) {
    return Center(
      child: Padding(
    padding: EdgeInsets.only(
        top: 10, left: 10, right: 10, bottom: 10),
    child: Expanded(
      child: Container(
          padding:
              EdgeInsets.only(left: 10, right: 10, top: 10),
          alignment: Alignment.topCenter,
          height: 150,
          decoration: BoxDecoration(
            color: Color.fromRGBO(138, 43, 226, 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
          ),
          // color: Color.fromARGB(153, 18, 18, 18),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Stratford"),
                children: [
                  
                    TextSpan(
                    text:"Be the agent of change!",
                    style: TextStyle(fontSize: 24)
                  ),
                  WidgetSpan(
                      child: Expanded(
                          child: Container(
                    height: 30,
                  ))),
                  WidgetSpan(
                      child: Divider(color: Colors.white)),
                  WidgetSpan(
                      child: Expanded(
                          child: Container(
                    alignment: Alignment.center,
                    width: 500,
                    // height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                            text: TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.amber,
                          )),
                          TextSpan(
                              text: "Coins: ",
                              ),
                        ]))),
                  )))
                ]),
          )),
    ),
  ));
  }