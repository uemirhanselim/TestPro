import 'dart:ui';

import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField({Key? key, required this.textHint, required this.labelText, required this.keyboardType, required this.keyboardNextType, required this.controller}) : super(key: key);

  final TextEditingController controller;
  final String textHint;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction keyboardNextType;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

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
          obscureText: _isObscure,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _isObscure ?  Icons.visibility_off : Icons.visibility,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
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