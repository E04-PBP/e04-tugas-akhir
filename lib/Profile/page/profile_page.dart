import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/Profile/model/profile_page_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  final String firstName = "";
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String pickedGender = "";
  String address = "";
  String kontak = "";
  var gender = ["", "Male", "Female"];
  callback() {
    setState(() {});
  }

  Future<ProfileModel> fetch() async {
    final request = context.watch<CookieRequest>();

    final response = await request
        .get("https://irama-kain.up.railway.app/profile/get_profile");

    ProfileModel fetched = ProfileModel.fromJson(response);
    return fetched;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    firstName = widget.firstName;
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
            // print(snapshot.data.firstName);
            String firstName = snapshot.data.firstName;
            String lastName = snapshot.data.lastName;
            String pickedGender = snapshot.data.gender ? "Male" : "Female";
            String address = snapshot.data.address;
            String kontak = snapshot.data.kontak;
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
                        height: MediaQuery.of(context).size.height / 1.5 / 1.5,
                        width: MediaQuery.of(context).size.width - 20,
                        // width: MediaQuery.of(context).size.width / 1.5,
                        child: Row(
                          children: [
                            Container(
                              // width:
                              //     MediaQuery.of(context).size.width / 1.5 / 3,
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
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "My Details",
                                        style: TextStyle(
                                          color: Color.fromRGBO(64, 28, 92, 1),
                                          fontSize: 28,
                                          fontFamily: "Stratford",
                                        ),
                                      ),
                                      Container(
                                        height: 20,
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
                                                const Text("First Name"),
                                                Container(
                                                  height: 10,
                                                ),
                                                const Text("Last Name"),
                                                Container(
                                                  height: 10,
                                                ),
                                                const Text("Email"),
                                                Container(
                                                  height: 10,
                                                ),
                                                const Text("Gender"),
                                                Container(
                                                  height: 10,
                                                ),
                                                const Text("Kontak"),
                                                Container(
                                                  height: 10,
                                                ),
                                                const Text("Alamat"),
                                                Container(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 10,
                                            ),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${firstName}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '${lastName}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '${snapshot.data.email}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    pickedGender,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '${kontak}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '${address}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 10,
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
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
                                                              "Edit Profile",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          64,
                                                                          28,
                                                                          92,
                                                                          1),
                                                                  fontSize: 20),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      firstName,
                                                                  labelText:
                                                                      "First Name",
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
                                                                  setState(() {
                                                                    firstName =
                                                                        value!;
                                                                  });
                                                                },
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    firstName =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      lastName,
                                                                  labelText:
                                                                      "Last Name",
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
                                                                  setState(() {
                                                                    lastName =
                                                                        value!;
                                                                  });
                                                                },
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    lastName =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      kontak,
                                                                  labelText:
                                                                      "Contact",
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
                                                                  setState(() {
                                                                    kontak =
                                                                        value!;
                                                                  });
                                                                },
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    kontak =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  DropdownButton(
                                                                isExpanded:
                                                                    true,
                                                                value:
                                                                    pickedGender,
                                                                hint: const Text(
                                                                    "Gender"),
                                                                items: gender
                                                                    .map((String
                                                                        items) {
                                                                  return DropdownMenuItem(
                                                                    value:
                                                                        items,
                                                                    child: Text(
                                                                        items),
                                                                  );
                                                                }).toList(),
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    pickedGender =
                                                                        newValue!;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  TextFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      address,
                                                                  labelText:
                                                                      "Address",
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
                                                                  setState(() {
                                                                    address =
                                                                        value!;
                                                                  });
                                                                },
                                                                onSaved:
                                                                    (String?
                                                                        value) {
                                                                  setState(() {
                                                                    address =
                                                                        value!;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            TextButton(
                                                              child: const Text(
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
                                                                        .all(5),
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
                                                                print("this is firstName: " +
                                                                    firstName);
                                                                print("this is snapshot :" +
                                                                    snapshot
                                                                        .data
                                                                        .firstName);
                                                                print(
                                                                    firstName ==
                                                                        "");
                                                                firstName == ""
                                                                    ? snapshot
                                                                        .data
                                                                        .firstName
                                                                    : firstName;
                                                                print(
                                                                    firstName);
                                                                lastName == ""
                                                                    ? snapshot
                                                                        .data
                                                                        .lastName
                                                                    : lastName;
                                                                print(lastName);
                                                                kontak == ""
                                                                    ? snapshot
                                                                        .data
                                                                        .kontak
                                                                    : kontak;
                                                                print(kontak);
                                                                pickedGender ==
                                                                        ""
                                                                    ? snapshot
                                                                        .data
                                                                        .gender
                                                                    : pickedGender;
                                                                print(
                                                                    pickedGender);
                                                                address == ""
                                                                    ? snapshot
                                                                        .data
                                                                        .address
                                                                    : address;
                                                                print(address);
                                                                print("aman");
                                                                print(
                                                                    firstName ==
                                                                        "");
                                                                final response =
                                                                    await request
                                                                        .post(
                                                                            "https://irama-kain.up.railway.app/profile/edit_flutter",
                                                                            {
                                                                      "first_name":
                                                                          firstName,
                                                                      "last_name":
                                                                          lastName,
                                                                      "kontak":
                                                                          kontak,
                                                                      "address":
                                                                          address,
                                                                      "gender": pickedGender ==
                                                                              "Male"
                                                                          ? "LK"
                                                                          : "PP"
                                                                    });

                                                                print(response);

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
                                                                        color: Colors
                                                                            .amber,
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
                                                                        "Profile berhasil diedit!",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context,
                                                                                'OK');
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'OK',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }
                                                                // Navigator.pop(
                                                                //       context);
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
                                        child: Text('Edit Profile'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(64, 28, 92, 1),
                                          shadowColor:
                                              Color.fromRGBO(64, 28, 92, 0.2),
                                          elevation: 0,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
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
