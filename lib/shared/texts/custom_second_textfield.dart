import 'package:flutter/material.dart';

class CustomSecondTextfield extends StatefulWidget {
  const CustomSecondTextfield({super.key});

  @override
  State<CustomSecondTextfield> createState() => _CustomSecondTextfieldState();
}

class _CustomSecondTextfieldState extends State<CustomSecondTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      cursorColor: Colors.white,
      cursorHeight: 20,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        hintText: "First Name",
        hintStyle: TextStyle(color: Colors.white54),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
