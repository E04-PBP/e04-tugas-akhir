import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/Authentication/page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKeyUsername = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword1 = GlobalKey<FormState>();
  final _formKeyPassword2 = GlobalKey<FormState>();
  final _formKeyContact = GlobalKey<FormState>();
  final _formKeyAddress = GlobalKey<FormState>();
  final _formKeyFirstName = GlobalKey<FormState>();
  final _formKeyLastName = GlobalKey<FormState>();

  //gender belom
  var username = "";
  var email = "";
  var password1 = "";
  var password2 = "";
  var contact = "";
  var address = "";
  var firstName = "";
  var lastName = "";
  var gender = ["Male", "Female"];
  bool? check = false;
  String? pickedGender = null;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 20,
            child: SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image(
                  //   image: NetworkImage(
                  //       "https://www.pngkey.com/png/detail/14-148130_minion-imagenes-de-100x100-pixeles.png"),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKeyUsername,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "ex. JohnMayers10",
                          labelText: "Username",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be emptied!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKeyEmail,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "",
                          labelText: "Email",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            email = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Email cannot be emptied!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _formKeyFirstName,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "",
                                labelText: "First Name",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  firstName = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'First name cannot be emptied!';
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
                            key: _formKeyLastName,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "",
                                labelText: "Last Name",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  lastName = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Last name cannot be emptied!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _formKeyPassword1,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "",
                                labelText: "Password",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  password1 = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be emptied!';
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
                            key: _formKeyPassword2,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "",
                                labelText: "Password Confirmation",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  password2 = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password confirmation cannot be emptied!';
                                } else if (value.compareTo(password1) != 0) {
                                  return 'Password confirmation and password doesn\'t match';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            isExpanded: true,
                            value: pickedGender,
                            hint: const Text("Gender"),
                            items: gender.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                pickedGender = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Form(
                            key: _formKeyContact,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              maxLength: 13,
                              decoration: InputDecoration(
                                hintText: "",
                                labelText: "Contact (+62)",
                                // Menambahkan circular border agar lebih rapi
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              // Menambahkan behavior saat nama diketik
                              onChanged: (String? value) {
                                setState(() {
                                  contact = value!;
                                });
                              },
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Contact cannot be emptied!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKeyAddress,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "",
                          labelText: "Address",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            address = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Address cannot be emptied!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Checkbox(
                          value: check,
                          onChanged: (bool? value) {
                            setState(() {
                              check = value;
                            });
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child:
                            Text("I agree all statements in Terms of service"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () async {
                        if (check == false) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Invalid"),
                              content: const Text(
                                  'Please agree the terms of service'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (pickedGender == null) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Invalid"),
                              content: const Text(
                                  'Please choose one of the genders!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          if (_formKeyAddress.currentState!.validate() &&
                              _formKeyContact.currentState!.validate() &&
                              _formKeyEmail.currentState!.validate() &&
                              _formKeyFirstName.currentState!.validate() &&
                              _formKeyLastName.currentState!.validate() &&
                              _formKeyPassword1.currentState!.validate() &&
                              _formKeyPassword2.currentState!.validate() &&
                              _formKeyUsername.currentState!.validate()) {
                            final response = await request.post(
                              "https://irama-kain.up.railway.app/Authentication/register_flutter",
                              {
                                "username": username,
                                "email": email,
                                "first_name": firstName,
                                "last_name": lastName,
                                "password1": password1,
                                "password2": password2,
                                "kontak": contact,
                                "alamat": address,
                                "jenis_kelamin": (() {
                                  if (pickedGender == "Male") {
                                    return "LK";
                                  } else {
                                    return "PP";
                                  }
                                }()),
                              },
                            );

                            String message = response["message"].toString();
                            message = message.replaceAll("[", "");
                            message = message.replaceAll("]", "");
                            message = message.replaceAll(",", "");

                            if (response["status"] == false) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
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
                            } else {
                              if (!mounted) {
                                return;
                              }
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Success"),
                                  content: Text(message),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()),
                                        );
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        elevation: 10,
                        backgroundColor: const Color.fromRGBO(64, 28, 92, 1),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const IramaKainDrawer(),
      backgroundColor: const Color.fromRGBO(64, 28, 92, 1),
    );
  }
}
