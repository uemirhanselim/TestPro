import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/local_storage/shared_preferencesServices.dart';
import 'package:test_pro/screens/register_page_four.dart';
import 'package:test_pro/widgets/auth_button.dart';
import 'package:test_pro/widgets/custom_dialog.dart';
import 'package:test_pro/widgets/custom_text_field.dart';
import 'package:test_pro/database/firebase_service.dart';

class RegisterPageThree extends StatelessWidget {
  RegisterPageThree({Key? key, required this.currentUser}) : super(key: key);

  final String currentUser;

  final userNameController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SharedPreferencesServices prefs = SharedPreferencesServices();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Container(
                margin: EdgeInsets.only(top: 180.0),
                child: Text(
                  "Your Name?",
                  style: TextStyle(
                      fontFamily: 'Abel',
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.85,
              ),
              SizedBox(height: 40.0),
              CustomTextField(
                  textHint: "Your Name",
                  labelText: "Name",
                  keyboardType: TextInputType.name,
                  keyboardNextType: TextInputAction.done,
                  controller: userNameController),
              SizedBox(height: 150.0),
              AuthButton(
                button_text: 'Continue',
                button_height: 50,
                button_width: 350,
                onTapNavigate: () {
                  if(userNameController.text == ""){
                    showCustomDialog(context, "Missing Part", "Enter a username!");
                  }else{
                    User user = _auth.currentUser!;
                    final firebaseService = FirebaseService(uid: user.uid);
                    prefs.storeUserName(userNameController.text);
                    firebaseService.updateUser(userName: userNameController.text, sex: '', age: '', length: '', weight: '',);
                    userNameController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPageFour(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
