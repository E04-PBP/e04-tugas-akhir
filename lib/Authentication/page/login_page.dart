import 'package:flutter/material.dart';
import 'package:iramakain/drawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
            width: 300,
            height: 300,
            child: Text('hello'),
          ),
        ),
      ),
      drawer: const IramaKainDrawer(),
    );
  }
}
