// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iramakain/Donation/page/donationForm.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/Donation/models/fetches.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:iramakain/Donation/page/detaildonations.dart';

class DonationInfo extends StatefulWidget {
  @override
  State<DonationInfo> createState() => _DonationInfoState();
}

class _DonationInfoState extends State<DonationInfo> with TickerProviderStateMixin  {


  @override
  Widget build(BuildContext context) {
  final request = context.watch<CookieRequest>();

    return Scaffold(
      // 
      appBar: AppBar(title: Text('Donations'),),
      drawer: IramaKainDrawer(),
      body:DefaultTabController(length: 2, child: 
      Scaffold(body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            
            SliverAppBar(
              shadowColor: Colors.grey,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    Container(
                      height: 250.0,
                      width: double.infinity,
                      child: 
                      Column(
                        children: [
                          request.loggedIn? donationBar(context) : donationBarNonLogged(context),
                          bottomTabBar()
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage("lib/Donation/assets/img/iramakainbg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                    
                  ],
                ),
              ),
              expandedHeight: 250.0,
              
            )
          ];
        },
        body: TabBarView(
          children: [
            if (!request.loggedIn) ...[
                          notloggedin("ongoing"),
                          notloggedin("history"),
                        ] else ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              child: loggedInOngoing(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              child: Center(child: loggedinHistory(context)),
                            ),
                          )
                        ]
          ]
        ),
      ),)
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
                  
    );
  }

  TabBar bottomTabBar() {
    return TabBar(
      isScrollable: true, // Required\
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white, // Other tabs color
      labelPadding: EdgeInsets.symmetric(horizontal: 60), // Space between tabs
      indicator: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(138, 43, 226, 1),
            Color.fromRGBO(170, 195, 138, 1),
          ]),
          borderRadius: BorderRadius.circular(100),
          color: Colors.redAccent),
      tabs: const [
        Tab(
          text: "Ongoing",
          icon: Icon(
            Icons.change_circle_rounded,
            color: Colors.white,
          ),
        ),
        Tab(
          text: 'History',
          icon: Icon(
            Icons.published_with_changes_sharp,
            color: Colors.white,
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
                  ListView(children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style:
                              TextStyle(color: Color.fromRGBO(64, 28, 92, 1)),
                          children: [
                            const TextSpan(
                              text: "\nThere are no ongoing donations yet.",
                              style: TextStyle(
                                  color: Color.fromRGBO(64, 28, 92, 1)),
                            ),
                            const TextSpan(
                              text: "\nStart donating now!.",
                              style: TextStyle(
                                  color: Color.fromRGBO(64, 28, 92, 1)),
                            ),
                            WidgetSpan(
                                child: IconButton(
                              icon: const Icon(Icons.add_circle,
                                  color: Color.fromRGBO(64, 28, 92, 1),
                                  size: 30),
                              onPressed: () => null,
                            )),
                          ],
                        ))
                  ])
                ],
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromRGBO(138, 43, 226, 0.8),
                            Color.fromRGBO(170, 195, 138, 0.8),
                          ]),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: ListTile(
                          leading: Container(
                              child: const Image(
                            image: AssetImage(
                                "lib/Donation/assets/img/clothes.png"),
                            fit: BoxFit.fitHeight,
                          )),
                          title: Text(
                            'Donasi ${snapshot.data![index].jenis_barang}',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Last updated on: ${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(snapshot.data![index].waktu_isi))}',
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
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
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
                              "lib/Donation/assets/img/clothes.png"),
                          fit: BoxFit.fitHeight,
                        )),
                        title: Text(
                          '${snapshot.data![index].jenis_barang}',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Last updated on: ${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(snapshot.data![index].waktu_isi))}',
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
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                alignment: Alignment.topCenter,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
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
                            child: Container(
                          height: 30,
                        )),
                        WidgetSpan(child: Divider(color: Colors.white)),
                        WidgetSpan(
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
                                    style: TextStyle(color: Colors.black)),
                              ]))),
                        ))
                      ]),
                )),
          ));
      });
}

Widget notloggedin(String infoType) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      child: ListView(children: [
        RichText(
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
                        : "\nThere are no donation history yet.",
                    style: TextStyle(color: Color.fromRGBO(64, 28, 92, 1))),
                TextSpan(
                    text: "\nPlease sign in to start donating.",
                    style: TextStyle(color: Color.fromRGBO(64, 28, 92, 1)))
              ],
            )),
      ]),
    ),
  );
}

Widget donationBarNonLogged(BuildContext context) {
  return Center(
      child: Padding(
    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
    child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        alignment: Alignment.topCenter,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: "Stratford"),
              children: [
                TextSpan(
                    text: "Be the agent of change!",
                    style: TextStyle(fontSize: 24)),
                WidgetSpan(
                    child: Container(
                  height: 30,
                )),
                WidgetSpan(child: Divider(color: Colors.white)),
                WidgetSpan(
                    child: Container(
                  alignment: Alignment.center,
                  width: 500,
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
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ]))),
                ))
              ]),
        )),
  ));
}
