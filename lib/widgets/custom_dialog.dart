import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context,String title, String content) => showDialog(
  context: context,
  builder: (BuildContext context) => new AlertDialog(
    backgroundColor: Colors.orangeAccent,
    title: Text('$title'),
    content: Text('$content'),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.close,color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          })
    ],
  ),
);
