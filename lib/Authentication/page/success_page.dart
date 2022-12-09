import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:iramakain/Authentication/model/success_page_model.dart';
import 'dart:convert';

class SuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  Future<SuccessModel> fetchToDo() async {
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
        title: Text("Welcome"),
      ),
      drawer: IramaKainDrawer(),
      body: FutureBuilder(
        future: fetchToDo(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image(
                      //   image: NetworkImage(
                      //       "https://www.pngkey.com/png/detail/14-148130_minion-imagenes-de-100x100-pixeles.png"),
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 10,
                          bottom: 50,
                        ),
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data.firstName + " " + snapshot.data.lastName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
