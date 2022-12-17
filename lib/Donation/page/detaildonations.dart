import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iramakain/drawer.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:iramakain/Donation/models/donationModels.dart';
import 'package:iramakain/Donation/models/fetches.dart';

class detailDonation extends StatefulWidget {
  final DonationModel itemHolder;
  detailDonation({super.key, required this.itemHolder});

  @override
  State<detailDonation> createState() => _detailDonationState(this.itemHolder);
}

class _detailDonationState extends State<detailDonation> {
  final DonationModel itemHolder;
  _detailDonationState(this.itemHolder);

  callback() {
    setState(() {});
  }

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  final _keyDialog1 = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  List<String> shippingMethodList = [
    ('Antar sendiri'),
    ('JNE'),
    ('POS INDONESIA'),
    ('TIKI'),
    ('SiCepat'),
    ('J&T')
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      drawer: IramaKainDrawer(),
      body: FutureBuilder(
          future: fetchCurrent(context, itemHolder.pk),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              print("first pk");
              print(snapshot.data.pk);
              String jenis_barang = snapshot.data.jenis_barang;
              int amount = snapshot.data.amount;
              String shipping_method = snapshot.data.shipping_method;
              String waktu_isi = snapshot.data.waktu_isi;
              return Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("lib/Donation/assets/img/Rectangle.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Text(
                            'Detail Donasi',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 50),
                            alignment: Alignment.center,
                            width: 350,
                            height: 250,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(138, 43, 226, 0.6),
                                Color.fromRGBO(170, 195, 138, 0.8),
                              ]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Color.fromRGBO(64, 28, 92, 1),
                                        fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Jenis Kain: \n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: jenis_barang),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Color.fromRGBO(64, 28, 92, 1),
                                        fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Banyak: \n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: '${amount}'),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Color.fromRGBO(64, 28, 92, 1),
                                        fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Shipping Method: \n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: shipping_method),
                                    ],
                                  ),
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Color.fromRGBO(64, 28, 92, 1),
                                        fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Last updated: \n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                          text: DateFormat('dd-MM-yyyy hh:mm a')
                                              .format(
                                                  DateTime.parse(waktu_isi))),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 90,
                                        child: ElevatedButton(
                                          child: Text('Done'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(64, 28, 92, 1),
                                            shadowColor:
                                                Color.fromRGBO(64, 28, 92, 1),
                                            elevation: 5,
                                          ),
                                          onPressed: () {
                                            showDialog<String>(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    key: new GlobalKey(),
                                                    title: Text("Alert"),
                                                    content: Text(
                                                        "Are you sure you want to finish this donation?"),
                                                    actions: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                          Color.fromRGBO(
                                                              170, 195, 138, 1),
                                                        )),
                                                        child: Text(
                                                          "Finish",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    64,
                                                                    28,
                                                                    92,
                                                                    1),
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          final response =
                                                              await request.post(
                                                                  "https://irama-kain.up.railway.app/donation/done/${itemHolder.pk}",
                                                                  {});
                                                          print(response);
                                                          if (response[
                                                                  "poin"] !=
                                                              0) {
                                                            showDialog<String>(
                                                              context: context,
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  AlertDialog(
                                                                key:
                                                                    _keyDialog1,
                                                                elevation: 20,
                                                                backgroundColor:
                                                                    Color
                                                                        .fromRGBO(
                                                                            170,
                                                                            195,
                                                                            138,
                                                                            1),
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .sentiment_satisfied_sharp,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 30,
                                                                ),
                                                                title: Text(
                                                                  "Info",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                content: Text(
                                                                  "Successfully finish your donation!",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context,
                                                                          'OK');
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'OK',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                            Color.fromRGBO(170,
                                                                195, 138, 0.8),
                                                          )),
                                                          child: Text("Cancel",
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        64,
                                                                        28,
                                                                        92,
                                                                        1),
                                                              )),
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                context, 'OK');
                                                          })
                                                    ],
                                                  );
                                                });
                                          },
                                        )),
                                    Container(
                                      width: 10,
                                    ),
                                    Container(
                                        width: 90,
                                        child: ElevatedButton(
                                          child: Text('Edit'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(64, 28, 92, 1),
                                            shadowColor:
                                                Color.fromRGBO(64, 28, 92, 1),
                                            elevation: 5,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 15,
                                                    child: Form(
                                                      key: _formKey,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "Edit Donasi",
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            64,
                                                                            28,
                                                                            92,
                                                                            1),
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        jenis_barang,
                                                                    labelText:
                                                                        "Jenis Barang",
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                  ),
                                                                  onChanged:
                                                                      (String?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      jenis_barang =
                                                                          value!;
                                                                    });
                                                                  },
                                                                  onSaved:
                                                                      (String?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      jenis_barang =
                                                                          value!;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        '${amount}',
                                                                    labelText:
                                                                        "Banyak Kain (dalam kg)",
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                  ),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  inputFormatters: <
                                                                      TextInputFormatter>[
                                                                    FilteringTextInputFormatter
                                                                        .digitsOnly,
                                                                    FilteringTextInputFormatter
                                                                        .deny(RegExp(
                                                                            r'^0'))
                                                                  ],
                                                                  onChanged:
                                                                      (String?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      amount = int
                                                                          .parse(
                                                                              value!);
                                                                    });
                                                                  },
                                                                  onSaved:
                                                                      (String?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      amount = int
                                                                          .parse(
                                                                              value!);
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              Center(
                                                                  child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: <
                                                                          Widget>[
                                                                    Container(
                                                                        width:
                                                                            10),
                                                                    DropdownButton(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .keyboard_arrow_down),
                                                                      items: shippingMethodList.map(
                                                                          (String
                                                                              items) {
                                                                        return DropdownMenuItem(
                                                                          value:
                                                                              items,
                                                                          child:
                                                                              Text(items),
                                                                        );
                                                                      }).toList(),
                                                                      hint: Text(
                                                                          shipping_method),
                                                                      onChanged:
                                                                          (String?
                                                                              newValue) {
                                                                        setState(
                                                                            () {
                                                                          shipping_method =
                                                                              newValue!;
                                                                        });
                                                                      },
                                                                    ),
                                                                  ])),
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                  "Simpan",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                style:
                                                                    ButtonStyle(
                                                                  shadowColor: MaterialStateProperty
                                                                      .all(Color
                                                                          .fromRGBO(
                                                                              64,
                                                                              28,
                                                                              92,
                                                                              1)),
                                                                  elevation:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              5),
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Color.fromRGBO(
                                                                              64,
                                                                              28,
                                                                              92,
                                                                              1)),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  print(
                                                                      jenis_barang);
                                                                  print(amount);
                                                                  print(
                                                                      shipping_method);
                                                                  final response =
                                                                      await request
                                                                          .post(
                                                                              "https://irama-kain.up.railway.app/donation/edit_flutter/${itemHolder.pk}",
                                                                              {
                                                                        "jenis_barang":
                                                                            jenis_barang,
                                                                        "amount":
                                                                            '${amount}',
                                                                        "shipping_method":
                                                                            shipping_method
                                                                      });
                                                                  print(
                                                                      response);

                                                                  if (response[
                                                                          "status"] ==
                                                                      true) {
                                                                    showDialog<
                                                                        String>(
                                                                      context:
                                                                          context,
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          AlertDialog(
                                                                        elevation:
                                                                            20,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            170,
                                                                            195,
                                                                            138,
                                                                            1),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .sentiment_satisfied_sharp,
                                                                          color:
                                                                              Colors.amber,
                                                                          size:
                                                                              25,
                                                                        ),
                                                                        title:
                                                                            Text(
                                                                          "Info",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        content:
                                                                            Text(
                                                                          "Donasi berhasil diedit!",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context, 'OK');
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              'OK',
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  }
                                                                  callback();
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]))
              ]);
            }
          }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("lib/Donation/assets/img/noise.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          child: ElevatedButton(
            onPressed: () {
              goBack(context);
            },
            child: Text('Back'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(64, 28, 92, 1),
              shadowColor: Color.fromRGBO(64, 28, 92, 0.2),
              elevation: 0,
            ),
          ),
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        ),
      ),
    );
  }
}
