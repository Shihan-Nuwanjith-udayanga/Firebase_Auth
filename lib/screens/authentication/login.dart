import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //reference for the AuthServices class
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGN IN"),
      ),
      body: ElevatedButton(
        child: const Text("Sign in Anonymously"),
        onPressed: () async {
          dynamic result = await _auth.signInAnonymously();
          if (result == Null) {
            print("error in sign in anonymously");
          } else {
            print("signed in anonymously");
            print(result.uid);
          }
        },
      ),
    );
  }
}
