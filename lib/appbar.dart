import 'package:flutter/material.dart';
import 'package:iramakain/Donation/page/donationInfo.dart';
import 'package:iramakain/main.dart';
import 'package:iramakain/Authentication/page/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

AppBar buildAppBar(BuildContext context) {
    if (ModalRoute.of(context)!.settings.name == "/main" || ModalRoute.of(context)!.settings.name == "/home") {
        return AppBar();
    } else {
        return AppBar(
            leading: IconButton(
                iconSize: 20,
                padding: EdgeInsets.only(left: 20.0),
                splashRadius: 15.0,
                splashColor: Color.fromRGBO(170, 195, 138, 1),
                highlightColor: Color.fromRGBO(170, 195, 138, 1),
                icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(38,38,38,1)),
                onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
            ),
            titleSpacing: 5.0,
            title: Text( "AppBar"),
            elevation: 2.2,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Color.fromRGBO(38,38,38,1)),
            shadowColor: Color.fromRGBO(38,38,38,1)
        );
    }
}   