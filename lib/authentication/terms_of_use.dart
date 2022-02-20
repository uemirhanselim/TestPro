import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/dialogs/policy_dialog.dart';

class TermsOfUse extends StatelessWidget {
  TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "By creating an account, you are agreeing to our\n",
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                  text: "Terms & Conditions ",
                  style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(context: context, builder: (context) {
                        return PolicyDialog(mdFileName: 'terms_and_conditions.md',);
                      },);
                    }),
              TextSpan(text: "and "),
              TextSpan(
                  text: "Privacy Policy! ",
                  style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(context: context, builder: (context) {
                        return PolicyDialog(mdFileName: 'privacy_policy.md',);
                      },);
                    },),
            ],),
      ),
    );
  }
}
