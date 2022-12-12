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
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/Profile/assets/img/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Card(
                      elevation: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Row(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 1.5 / 3,
                              alignment: Alignment.topCenter,
                              padding: const EdgeInsets.all(5),
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
                              width: 2 *
                                  MediaQuery.of(context).size.width /
                                  1.5 /
                                  3,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  const Text(
                                    "My Details",
                                    style: TextStyle(
                                      color: Color.fromRGBO(64, 28, 92, 1),
                                      fontSize: 28,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "First Name",
                                              style: const TextStyle(
                                                fontFamily: "Poppins",
                                              ),
                                            ),
                                            const Text("world"),
                                          ],
                                        ),
                                        Column(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
