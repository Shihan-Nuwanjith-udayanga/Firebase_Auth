import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/constants/styles.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  //function
  final Function toggle;
  const Sign_In({Key? key, required this.toggle}) : super(key: key);

  // const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //reference for the AuthServices class
  final AuthServices _auth = AuthServices();

  //form key
  final _formKey = GlobalKey<FormState>();

  //email password states
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: AppBar(
        title: const Text(
          "SIGN IN",
          style: TextStyle(
            color: textMain,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        backgroundColor: mainBrown,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              //description
              const Text(
                description,
                textAlign: TextAlign.justify,
                style: descriptionStyle,
              ),
              Center(
                child: Image.asset(
                  "assets/login.png",
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val?.isEmpty == true ? "Enter a valid email" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //password
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: "password"),
                        validator: (val) =>
                            val!.length < 6 ? "Enter a valid password" : null,
                        onChanged: (val) {
                          setState(
                            () {
                              password = val;
                            },
                          );
                        },
                      ),
                      //google
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),
                      Text(error, style: TextStyle(color: Colors.red)),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        //sign in with Google
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            "assets/google.png",
                            height: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do not have an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            //go to the Register page
                            onTap: () {
                              widget.toggle();
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                color: mainBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //button
                      GestureDetector(
                        //method for login user
                        onTap: () async {
                          dynamic result = await _auth
                              .signInUsingEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = "Could not SignIn with those credentials";
                            });
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgWhite,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: brown),
                          ),
                          child: const Center(
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                color: textMain,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //anonymous button
                      GestureDetector(
                        //method for login Anonymous
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgWhite,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 2, color: brown),
                          ),
                          child: const Center(
                            child: Text(
                              "LOGIN AS GUEST",
                              style: TextStyle(
                                color: textMain,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// ElevatedButton(
//         child: const Text("Sign in Anonymously"),
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymously();
//           if (result == Null) {
//             print("error in sign in anonymously");
//           } else {
//             print("signed in anonymously");
//             print(result.uid);
//           }
//         },
//       ),