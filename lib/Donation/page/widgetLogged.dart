// import 'dart:html';

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

Widget loggedinHistory(BuildContext context) {
  return FutureBuilder(
      future: fetchDonationHist(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData) {
            return Column(
              children: [
                Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style:
                              TextStyle(color: Color.fromRGBO(64, 28, 92, 1)),
                          children: [
                            TextSpan(
                              text: "\nThere are no ongoing donations yet.",
                              style: TextStyle(
                                  color: Color.fromRGBO(64, 28, 92, 1)),
                            ),
                            TextSpan(
                              text: "\nStart donating now!.",
                              style: TextStyle(
                                  color: Color.fromRGBO(64, 28, 92, 1)),
                            ),
                            WidgetSpan(
                                child: IconButton(
                              icon: Icon(Icons.add_circle,
                                  color: Color.fromRGBO(64, 28, 92, 1),
                                  size: 30),
                              onPressed: () => null,
                            )),
                          ],
                        )))
              ],
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(138, 43, 226, 0.8),
                          Color.fromRGBO(170, 195, 138, 0.8),
                        ]),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListTile(
                        leading: Container(
                            child: Image(
                          image: AssetImage(
                              "lib/Donation/assets/img/unsplash_fouVDmGXoPI.png"),
                          fit: BoxFit.fitHeight,
                        )),
                        title: Text(
                          '${snapshot.data![index].jenis_barang}',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Last updated on: ${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(snapshot.data![index].waktu_isi))})}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )));
          }
        }
      });
}

Widget donationBar(BuildContext context) {
  return FutureBuilder(
      future: fetchProfile(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null)
          return const Center(child: CircularProgressIndicator());
        else
          return Center(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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
                              text:
                                  "${snapshot.data.firstName} ${snapshot.data.lastName}'s Donations",
                              style: TextStyle(fontSize: 24)),
                          WidgetSpan(
                              child: Expanded(
                                  child: Container(
                            height: 30,
                          ))),
                          WidgetSpan(child: Divider(color: Colors.white)),
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
                                    text: "Coins: ${snapshot.data.poin}",
                                  ),
                                ]))),
                          )))
                        ]),
                  )),
            ),
          ));
      });
}
