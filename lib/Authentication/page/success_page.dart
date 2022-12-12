import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:iramakain/Authentication/model/success_page_model.dart';
import 'dart:convert';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});
  @override
  State<StatefulWidget> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  Future<SuccessModel> fetch() async {
    final request = context.watch<CookieRequest>();
    final response = await request
        .get("https://irama-kain.up.railway.app/Authentication/json/");

    SuccessModel fetched = SuccessModel.fromJson(response);

    return fetched;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      drawer: const IramaKainDrawer(),
      backgroundColor: const Color.fromRGBO(64, 28, 92, 1),
      body: FutureBuilder(
        future: fetch(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                              bottom: 20,
                            ),
                            child: Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          (() {
                            if (snapshot.data.gender == "PP") {
                              return Image.asset(
                                "lib/Authentication/assets/img/woman.jpg",
                                width: 300,
                                height: 200,
                              );
                            } else {
                              return Image.asset(
                                "lib/Authentication/assets/img/man.jpg",
                                width: 300,
                                height: 200,
                              );
                            }
                          }()),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              snapshot.data.firstName +
                                  " " +
                                  snapshot.data.lastName,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "/main");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(64, 28, 92, 1),
                              ),
                              child: const Text("Proceed"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
