import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/Authentication/page/success_page.dart';
import 'package:iramakain/Authentication/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  void redirect(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/success');
  }

  String email = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 20,
              child: SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                          "lib/Authentication/assets/img/iramaKain.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "john@gmail.com",
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _formKey2,
                        child: TextFormField(
                          obscureText: !isPasswordVisible,
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
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, "/register"),
                      child: const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              _formKey2.currentState!.validate()) {
                            final response = await request.login(
                                "https://irama-kain.up.railway.app/Authentication/login_flutter",
                                {
                                  'email': email,
                                  'password': password1,
                                });
                            if (request.loggedIn) {
                              _formKey.currentState!.reset();
                              _formKey2.currentState!.reset();
                              if (!mounted) {
                                return;
                              }
                              redirect(context);
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text("Invalid"),
                                  content:
                                      const Text('User is not registered!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
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
      ),
      drawer: const IramaKainDrawer(),
      backgroundColor: const Color.fromRGBO(64, 28, 92, 1),
    );
  }
}
