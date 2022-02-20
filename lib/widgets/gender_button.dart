import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:test_pro/local_storage/shared_preferencesServices.dart';

class GenderButton extends StatefulWidget{
  GenderButton({Key? key}) : super(key: key);

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  bool isSelected = false;
  bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    SharedPreferencesServices prefs = SharedPreferencesServices();

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                  if(isSelected2 = true) { isSelected2 = false;}
                });
                prefs.storeGender('Woman');
              },
              child: Container(
                child: Icon(MdiIcons.genderFemale ,color: !isSelected ? Colors.grey.shade300 : Colors.red.shade500,size: 120.0),
                height: 130.0,
                width: 130.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3.0,
                          color: Colors.grey.shade300 ,
                          blurRadius: 10.0,
                          offset: Offset(-2.0,5.0)
                      )
                    ]
                ),
              ),
            ),
            SizedBox(width: 30.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected2 = !isSelected2;
                  if(isSelected = true) { isSelected = false;}
                });
                prefs.storeGender('Man');
              },
              child: Container(
                child: Icon(MdiIcons.genderMale ,color: !isSelected2 ? Colors.grey.shade300 : Colors.blue.shade900,size: 120.0),
                height: 130.0,
                width: 130.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3.0,
                          color: Colors.grey.shade300 ,
                          blurRadius: 10.0,
                          offset: Offset(-2.0,5.0)
                      )
                    ]
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
class Aha extends ChangeNotifier {}
