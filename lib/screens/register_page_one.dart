import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_pro/authentication/terms_of_use.dart';
import 'package:test_pro/screens/register_page_three.dart';
import 'package:test_pro/widgets/auth_button.dart';
import 'package:test_pro/widgets/custom_dialog.dart';
import 'package:test_pro/widgets/custom_text_field.dart';
import 'package:test_pro/database/firebase_service.dart';

import '../widgets/password_text_field.dart';

class RegisterPageOne extends StatefulWidget {
  RegisterPageOne({Key? key}) : super(key: key);

  @override
  State<RegisterPageOne> createState() => _RegisterPageOneState();
}

class _RegisterPageOneState extends State<RegisterPageOne> {
  final _auth = FirebaseAuth.instance;


  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  bool showSpinner = false;
  bool _signupClicked = true;


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  void setSignupClicked() {
    setState(() {
      _signupClicked = !_signupClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var newUser;
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(right: 370.0, top: 5.0),
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
                      child: Container(
                        margin: EdgeInsets.only(top: 60.0),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(17.0)),
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.84,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setSignupClicked();
                                setState(() {
                                  pageController.animateToPage(0, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: _signupClicked
                                      ? Colors.white
                                      : Colors.orangeAccent.shade100,
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                height: MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: !_signupClicked
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setSignupClicked();
                                setState(() {
                                  pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: !_signupClicked
                                      ? Colors.white
                                      : Colors.orangeAccent.shade100,
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                height: MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width * 0.40,
                                child: Center(
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: !_signupClicked
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin:
                        EdgeInsets.only(right: 305.0, bottom: 5.0, top: 30.0),
                        child: Text("Email")),
                    CustomTextField(
                      controller: emailController,
                      textHint: "Your Email",
                      labelText: "",
                      keyboardNextType: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Container(
                        margin:
                        EdgeInsets.only(right: 235.0, bottom: 5.0, top: 5.0),
                        child: Text("Create Password")),
                    PasswordTextField(
                      controller: passwordController,
                        textHint: "Your Password",
                        labelText: "",
                        keyboardType: TextInputType.visiblePassword,
                        keyboardNextType: TextInputAction.done),
                    Container(
                      height: 230.0,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            pageChanged = index;
                          });
                        },
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                    margin:
                                    EdgeInsets.only(right: 225.0, bottom: 5.0, top: 5.0),
                                    child: Text("Re-write Password")),
                                PasswordTextField(
                                  controller: rePasswordController,
                                    textHint: "Your Password",
                                    labelText: "",
                                    keyboardType: TextInputType.visiblePassword,
                                    keyboardNextType: TextInputAction.done),
                                SizedBox(height: 70.0),
                                TermsOfUse(),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                InkWell(
                                  child: Text("Forgot Password?",style: TextStyle(decoration: TextDecoration.underline),),
                                  onTap: (){
                                    showCustomDialog(context, 'Forgot Password', 'This is the way for password changing!');
                                  },
                                ),
                                SizedBox(height: 70.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    AuthButton(
                      button_text: 'Continue',
                      button_height: 50,
                      button_width: 350,
                      onTapNavigate: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          if(emailController.text == null || passwordController.text == null && passwordController.text != rePasswordController.text){
                            showCustomDialog(context, 'Failed Sign in', 'Check your informations!');
                          }
                          if(_signupClicked){
                            newUser = await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                            User user = newUser.user;
                            final firebaseService = FirebaseService(uid: user.uid);
                            firebaseService.createUser(email: emailController.text, password: passwordController.text);
                          }else{
                            newUser = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                          }
                          if(newUser != null) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => RegisterPageThree(currentUser: emailController.text)));
                          }else{
                            print("User not found!");
                          }
                          setState(() {
                            showSpinner = false;
                            emailController.clear();
                            passwordController.clear();
                            rePasswordController.clear();
                          });
                        }catch (e){
                          showCustomDialog(context, 'Failed Sign in', 'Check your informations!');
                        }finally{
                          setState(() {
                            showSpinner = false;
                          });
                        }
                        },
                    ),
                  ],
                ),
                //Container(height: 700,width: 420,color: Colors.red,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
