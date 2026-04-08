import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';

class CustomTextfild extends StatefulWidget {
  const CustomTextfild({
    super.key,
    required this.text,
    required this.ispassword,
    required this.controller,
    this.ccolor,
    this.txtcolor,
  });
  final String text;
  final bool ispassword;
  final TextEditingController controller;
  final Color? ccolor;
  final Color? txtcolor;
  @override
  State<CustomTextfild> createState() => _CustomTextfildState();
}

class _CustomTextfildState extends State<CustomTextfild> {
  bool _obscureText = false;

  void initstate() {
    _obscureText = widget.ispassword;
    super.initState();
  }

  void _tooglepassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      cursorHeight: 20,
      controller: widget.controller,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'please fill ${widget.text}';
        }
        null;
        return null;
      },
      obscureText: _obscureText,
      style: TextStyle(color: widget.txtcolor ?? Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: widget.ispassword
            ? GestureDetector(
                onTap: _tooglepassword,

                child: Icon(
                  CupertinoIcons.eye,
                  color: widget.ccolor ?? Colors.white,
                ),
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.ccolor ?? Colors.white),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.ccolor ?? Colors.white),
        ),
        hintStyle: TextStyle(color: widget.ccolor ?? Colors.white),
        hintText: widget.text,
        fillColor: Colors.transparent,
        filled: true,
      ),
    );
  }
}
