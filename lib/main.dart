import 'dart:io';

import 'package:firebase_auth_app/models/userModel.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:firebase_auth_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCmznifNzPJxGhTg42ZJ9waU9p_OyzgXFc",
              appId: "1:1081086637538:android:5a3c2fdbfde82bcaf3b5bb",
              messagingSenderId: "1081086637538",
              projectId: "fir-auth-d97b7"),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Wrapper(),
    // );
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
