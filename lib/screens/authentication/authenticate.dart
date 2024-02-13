import 'package:firebase_auth_app/screens/authentication/login.dart';
import 'package:firebase_auth_app/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signInPage = true;

  //toggle pages
  void switchPages() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Sign_In();
    if (signInPage == true) {
      return Sign_In(toggle: switchPages);
    } else {
      return Register(toggle: switchPages);
    }
  }
}
