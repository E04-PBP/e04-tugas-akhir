import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/Marketplace/model/marketplace_model.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});
  @override
  State<StatefulWidget> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  Future<MarketplaceModel> fetch() async {
    final request = context.watch<CookieRequest>();
    final response = await request.get(
        "https://irama-kain.up.railway.app/marketplace/get_pembelian_flutter");

    MarketplaceModel fetched = MarketplaceModel.fromJson(response);

    return fetched;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    final _formKeyNama = GlobalKey<FormState>();
    final _formKeyUkuran = GlobalKey<FormState>();
    final _formKeyPaymentMethod = GlobalKey<FormState>();
    final _formKeyShippingMethod = GlobalKey<FormState>();

    var nama = "";
    var ukuran = "";
    var paymentMethod = "";
    var shippingMethod = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketplace"),
      ),
      drawer: const IramaKainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                const Text(
                  "CATALOG",
                  style: TextStyle(
                    fontFamily: "Stratford",
                    fontSize: 45,
                    color: Color.fromARGB(255, 121, 59, 168),
                  ),
                ),
                Image.asset("lib/Marketplace/assets/img/1.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: Image.asset("lib/Marketplace/assets/img/2.png"),
                ),
                const Text(
                  "beli untuk berbagi",
                  style: TextStyle(
                    fontFamily: "Stratford",
                    fontSize: 30,
                    color: Color.fromARGB(255, 121, 59, 168),
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ]),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/Marketplace/assets/img/img7.jpeg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "MINAMI SWEATER  120K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 121, 59, 168),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "lib/Marketplace/assets/img/img4.jpeg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "FURU SWEATER   90K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 121, 59, 168),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/Marketplace/assets/img/img25.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "ONIFAL SWEATER  100K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 121, 59, 168),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "lib/Marketplace/assets/img/img21.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const Text(
                      "TAMINE SWEATER  100K",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 121, 59, 168),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: OutlinedButton(
                onPressed: () {
                  if (!request.loggedIn) {
                    return;
                  }
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.white,
                        height: 350,
                        child: Column(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyNama,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Cloth Name",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        nama = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Cloth name cannot be emptied!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyUkuran,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Cloth Size",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        ukuran = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Cloth size cannot be emptied!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyPaymentMethod,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Payment Method",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        paymentMethod = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Payment method cannot be emptied!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Form(
                                  key: _formKeyShippingMethod,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "",
                                      labelText: "Shipping Method",
                                      // Menambahkan circular border agar lebih rapi
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        shippingMethod = value!;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Shipping method cannot be emptied!';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (_formKeyNama.currentState!.validate() &&
                                    _formKeyUkuran.currentState!.validate() &&
                                    _formKeyPaymentMethod.currentState!
                                        .validate() &&
                                    _formKeyShippingMethod.currentState!
                                        .validate()) {
                                  final response = await request.post(
                                    "https://irama-kain.up.railway.app/marketplace/beli_flutter",
                                    {
                                      "size": ukuran,
                                      "payment_method": paymentMethod,
                                      "shipping_method": shippingMethod,
                                      "nama_baju": nama,
                                    },
                                  );
                                  var message = response["message"].toString();
                                  message = message.replaceAll("[", "");
                                  message = message.replaceAll("]", "");

                                  if (response["status"]) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text("Success"),
                                        content: Text(message),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text("Invalid"),
                                        content: Text(message),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 121, 59, 168), width: 1),
                  minimumSize: const Size.fromRadius(21),
                ),
                child: const Text(
                  "BUY",
                  style: TextStyle(
                    color: Color.fromARGB(255, 121, 59, 168),
                  ),
                ),
              ),
            ),
            const Text(
              "We Will Donate 70% From The Profit To Those Who Needs",
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 121, 59, 168),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "#DariKamuUntukMereka",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 121, 59, 168),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
