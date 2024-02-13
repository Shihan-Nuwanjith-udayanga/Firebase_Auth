import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/constants/styles.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //function
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  // const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          "REGISTER",
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
                style: descriptionStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset(
                  "assets/signUp.png",
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
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
                        obscureText: true,
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
                      //error text
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                      const Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),
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
                            //go to the Login page
                            onTap: () {
                              widget.toggle();
                            },
                            child: const Text(
                              "LOGIN",
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
                              .registerWithEmailAndPassword(email, password);

                          if (result == null) {
                            //error
                            setState(() {
                              error = "Please enter a valid email!";
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
                              "REGISTER",
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
