import 'package:flutter/material.dart';
import 'package:test_pro/screens/register_page_one.dart';

import '../screens/register_page_three.dart';

class AuthButton extends StatelessWidget {
  AuthButton({Key? key, required this.button_text, required this.button_height, required this.button_width, required this.onTapNavigate}) : super(key: key);

  final String button_text;
  final double button_height;
  final double button_width;
  final void Function() onTapNavigate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapNavigate,
      child: Container(
        alignment: Alignment.center,
        decoration:  BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        height: button_height,//50,
        width: button_width,//300,
        child: Text("$button_text",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
      ),
    ) ;
  }
}
