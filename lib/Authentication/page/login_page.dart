import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';
import 'package:iramakain/Authentication/page/success_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void redirect(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SuccessPage()));
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    child: Text("Submit"),
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
                        } else {}
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const IramaKainDrawer(),
    );
  }
}
