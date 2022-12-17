import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iramakain/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DonationForm extends StatefulWidget {
  DonationForm({super.key});

  @override
  State<DonationForm> createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  _DonationFormState();
  final _formKey = GlobalKey<FormState>();
  String jenis_barang = "";
  int amount = 0;
  String shipping_method = "";
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
          title: Text('Donation Form'),
        ),
        drawer: const IramaKainDrawer(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("lib/Donation/assets/img/iramakainbg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(229, 213, 243, 0.8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                "Donation Form",
                                style: TextStyle(
                                    color: Color.fromRGBO(64, 28, 92, 1),
                                    fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Cotton, Nylon, Leather",
                                    labelText: "Jenis Kain",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      jenis_barang = value!;
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      jenis_barang = value!;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '${amount}',
                                    labelText: "Banyak Kain (dalam kg)",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'^0')),
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      amount = int.parse(value!);
                                    });
                                  },
                                  onSaved: (String? value) {
                                    setState(() {
                                      amount = int.parse(value!);
                                    });
                                  },
                                ),
                              ),
                              Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                    DropdownButton(
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: shippingMethodList
                                          .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      hint: Text(shipping_method),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          shipping_method = newValue!;
                                        });
                                      },
                                    ),
                                  ])),
                              Container(
                                height: 10,
                              ),
                              TextButton(
                                child: const Text(
                                  "Simpan",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all(
                                      Color.fromRGBO(64, 28, 92, 1)),
                                  elevation: MaterialStateProperty.all(5),
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(138, 43, 226, 1),
                                  ),
                                ),
                                onPressed: () async {
                                  if (jenis_barang == "" ||
                                      amount == 0 ||
                                      shipping_method == "") {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        elevation: 20,
                                        backgroundColor:
                                            Color.fromRGBO(170, 195, 138, 0.8),
                                        icon: Icon(
                                          Icons.sentiment_dissatisfied_outlined,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                        title: Text(
                                          "Info",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Text(
                                          "Fields cannot be empty!",
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'OK');
                                            },
                                            child: const Text(
                                              'OK',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    if (_formKey.currentState!.validate()) {
                                      final response = await request.post(
                                          "https://irama-kain.up.railway.app/donation/form_flutter/",
                                          {
                                            "jenis_barang": jenis_barang,
                                            "amount": '${amount}',
                                            "shipping_method": shipping_method
                                          });
                                      // print(response);

                                      if (response["status"] == true) {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            elevation: 20,
                                            backgroundColor: Color.fromRGBO(
                                                170, 195, 138, 0.8),
                                            icon: Icon(
                                              Icons.sentiment_satisfied_sharp,
                                              color: Colors.amber,
                                              size: 25,
                                            ),
                                            title: Text(
                                              "Info",
                                              textAlign: TextAlign.center,
                                            ),
                                            content: Text(
                                              "Successfully added donation!",
                                              textAlign: TextAlign.center,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text(
                                                  'OK',
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/Donation/assets/img/iramakainbg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(64, 28, 92, 1),
                shadowColor: Color.fromRGBO(64, 28, 92, 1),
                elevation: 0,
              ),
            ),
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          ),
        ));
  }
}
