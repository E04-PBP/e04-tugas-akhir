import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/appbar.dart';
import 'package:iramakain/Profile/model/profile_page_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<ProfileModel> fetch() async {
    final request = context.watch<CookieRequest>();
    final response = await request
        .get("https://irama-kain.up.railway.app/profile/get_profile");

    ProfileModel fetched = ProfileModel.fromJson(response);

    return fetched;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      drawer: const IramaKainDrawer(),
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
                    elevation: 20,
                    child: SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 300,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(10),
                            color: const Color.fromRGBO(64, 28, 92, 1),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: (() {
                                if (!snapshot.data.gender) {
                                  return const AssetImage(
                                    "lib/Authentication/assets/img/woman.jpg",
                                  );
                                } else {
                                  return const AssetImage(
                                    "lib/Authentication/assets/img/man.jpg",
                                  );
                                }
                              }()),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 300,
                            child: Text("helo"),
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
