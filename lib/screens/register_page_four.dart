import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_pro/database/firebase_service.dart';
import 'package:test_pro/widgets/age_selector.dart';
import 'package:test_pro/widgets/auth_button.dart';
import 'package:test_pro/widgets/length_selector.dart';
import 'package:test_pro/widgets/sex_selector.dart';
import 'package:test_pro/widgets/weight_selector.dart';
import 'package:test_pro/local_storage/shared_preferencesServices.dart';

import '../widgets/custom_dialog.dart';

class RegisterPageFour extends StatefulWidget {
  RegisterPageFour({Key? key}) : super(key: key);

  @override
  State<RegisterPageFour> createState() => _RegisterPageFourState();
}

class _RegisterPageFourState extends State<RegisterPageFour> {
  final _controller = PageController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SharedPreferencesServices prefs = SharedPreferencesServices();
    FirebaseService firebaseService = FirebaseService(uid: '');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: EdgeInsets.only(right: 350.0, top: 5.0),
                      child: Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 2.8,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    height: MediaQuery.of(context).size.height * 0.525,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _controller,
                      children: [
                        SexSelector(),
                        AgeSelector(),
                        LengthSelector(),
                        WeightSelector(),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  AuthButton(
                      button_text: 'Next',
                      button_height: 50.0,
                      button_width: 350.0,
                      onTapNavigate: () async {
                        final gender = await prefs.fetchGender();
                        final age = await prefs.fetchAge();
                        final length = await prefs.fetchLength();
                        final lengthUnit = await prefs.fetchLengthUnit();
                        final weight = await prefs.fetchWeight();
                        User user = _auth.currentUser!;
                        if(gender!.isEmpty){
                          showCustomDialog(context, "Missing Part", "Enter your sex!");
                        }else{
                          final firebaseService = FirebaseService(uid: user.uid);
                          firebaseService.updateUser(userName: '', sex: gender!, age: age!, length: '$length $lengthUnit', weight: '$weight ');
                          _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      },),
                  SizedBox(height: 15.0),
                ],
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: ExpandingDotsEffect(
                    activeDotColor: Colors.orangeAccent,
                    dotColor: Colors.grey.shade300,
                    dotHeight: 15.0,
                    dotWidth: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


