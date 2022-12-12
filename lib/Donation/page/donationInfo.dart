// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

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

class DonationInfo extends StatefulWidget {
  @override
  State<DonationInfo> createState() => _DonationInfoState();
}

class _DonationInfoState extends State<DonationInfo> {
  _DonationInfoState();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // String username =
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            // key: _key,
            appBar: AppBar(
              title: Text('Donations'),
            ),
            drawer: IramaKainDrawer(),
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("lib/Donation/assets/img/Rectangle.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(children: <Widget>[
                  if (request.loggedIn) ...[
                    donationBar(context),
                  ]
                  else ... [
                    donationBarNonLogged(context)
                  ],

                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                          height: 100,
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              // color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: bottomTabBar(),
                              ))),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // first tab bar view widget
                        if (!request.loggedIn) ...[
                          notloggedin("ongoing"),
                          notloggedin("history"),
                        ] else ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              //  color: Color.fromRGBO(64, 28, 92, 0.8),
                              child: loggedInOngoing(),
                            ),
                          ),

                          // second tab bar viiew widget
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              //  color: Color.fromRGBO(170, 195, 138, 0.8),
                              child: Center(child: loggedinHistory(context)),
                            ),
                          )
                        ]
                      ],
                    ),
                  ),
                ])
              ],
            ),
            
            floatingActionButton: 
                    FloatingActionButton(
                      elevation: 8,
                      hoverColor: Colors.blueGrey,
                      backgroundColor: Color.fromRGBO(138, 43, 226, 1),
                      onPressed: () {
                        if (request.loggedIn) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DonationForm()),
                            ).then((value) => setState(() {}));
                        }
                        
                        
                      },
                      child: const Icon(Icons.add),
                    ),
                  ));
  }

  Widget bottomTabBar() {
    return TabBar(
      isScrollable: true, // Required\
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Color.fromRGBO(64, 28, 92, 1),
      labelColor: Color.fromRGBO(64, 28, 92, 1),
      unselectedLabelColor: Color.fromRGBO(64, 28, 92, 0.5), // Other tabs color
      labelPadding: EdgeInsets.symmetric(horizontal: 60), // Space between tabs
      indicator: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(138, 43, 226, 0.5),
            Color.fromRGBO(170, 195, 138, 0.5),
          ]),
          borderRadius: BorderRadius.circular(100),
          color: Colors.redAccent),
      tabs: [
        Tab(
          text: "Ongoing",
          icon: Icon(
            Icons.change_circle_rounded,
            color: Color.fromRGBO(64, 28, 92, 0.8),
          ),
        ),
        // Tab(text: 'Donate', icon: Icon(Icons.add, color: Color.fromRGBO(64, 28, 92, 0.8,),),),
        Tab(
          text: 'History',
          icon: Icon(
            Icons.published_with_changes_sharp,
            color: Color.fromRGBO(64, 28, 92, 0.8),
          ),
        ),
      ],
    );
  }

  

  Widget loggedInOngoing() {
    return FutureBuilder(
        future: fetchDonationInfo(context),
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
                      padding: EdgeInsets.symmetric(vertical: 15),
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
                            'Donasi ${snapshot.data![index].jenis_barang}',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Last updated on: ${DateFormat('dd-MM-yyyy hh:mm a').format(
                                              DateTime.parse(snapshot.data![index].waktu_isi))}',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailDonation(
                                      itemHolder: snapshot.data[index])),
                            ).then((value) => setState(() {}));
                          },

                        ),
                      )));
            }
          }
        });
  }

}
