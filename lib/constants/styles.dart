import 'package:firebase_auth_app/constants/colors.dart';
import 'package:flutter/material.dart';

const TextStyle descriptionStyle = TextStyle(
  fontSize: 12,
  color: textLight,
  fontWeight: FontWeight.w400,
);
 
const textInputDecoration = InputDecoration(
  hintText: "email",
  hintStyle: TextStyle(
    color: textLight,
    fontSize: 15,
  ),
  fillColor: bgWhite,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: brown, width: 1),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: brown, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(100))),
);
