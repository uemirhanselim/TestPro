import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.textHint, required this.labelText, required this.keyboardType, required this.keyboardNextType, required this.controller}) : super(key: key);

  final TextEditingController controller;
  final String textHint;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction keyboardNextType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        height: MediaQuery.of(context).size.height*0.09,
        width: MediaQuery.of(context).size.width*0.84,
        child: TextField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.bottom,
          obscureText: false,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orangeAccent)).copyWith(borderRadius: BorderRadius.circular(17.0)),
            hintText: widget.textHint,
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            border: OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(17.0)),
          ),
          maxLength: 20,
          keyboardType: widget.keyboardType,
          textInputAction: widget.keyboardNextType,
        ),
      ),
    );
  }
}
