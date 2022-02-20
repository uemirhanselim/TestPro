import 'package:flutter/material.dart';

import 'gender_button.dart';

class SexSelector extends StatefulWidget {
  const SexSelector({Key? key}) : super(key: key);

  @override
  _SexSelectorState createState() => _SexSelectorState();
}

class _SexSelectorState extends State<SexSelector> {
  String gender="Man";


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'What is your sex?',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 150.0),
        GenderButton(),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Woman",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey.shade600,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(width: 110.0),
            Text(
              "Man",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey.shade600,
                fontFamily: 'Poppins',
              ),
            )
          ],
        ),
      ],
    );
  }
}
