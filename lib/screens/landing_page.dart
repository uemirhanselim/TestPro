import 'package:flutter/material.dart';
import 'package:test_pro/screens/register_page_one.dart';
import 'package:test_pro/screens/register_page_three.dart';
import 'package:test_pro/widgets/auth_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 140.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        scale: 1.5,
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        "Improve fitness, build muscle, and burn fat",
                        style: TextStyle(
                            fontFamily: 'Abel',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              AuthButton(button_text: 'Continue with e-mail', button_width: 300, button_height: 50, onTapNavigate: () {Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPageOne()));  },),
              Container(
                margin: EdgeInsets.only(top: 130.0, right: 120.0),
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPageThree(currentUser: '',))),
                  child: Text(
                    "Continue without signing up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
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
