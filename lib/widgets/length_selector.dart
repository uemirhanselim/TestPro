import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/local_storage/shared_preferencesServices.dart';

class LengthSelector extends StatefulWidget {
  const LengthSelector({Key? key}) : super(key: key);

  @override
  _LengthSelectorState createState() => _LengthSelectorState();
}

class _LengthSelectorState extends State<LengthSelector> {
  SharedPreferencesServices prefs = SharedPreferencesServices();
  @override
  void initState() {
    prefs.fetchAge().then((value) => print("Selected age ---> $value"));
    super.initState();
  }

  final units = [
    'cm',
    'ft',
  ];

  int index = 0;
  int selectedLength = 0;
  int selectedUnit = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
          child: Text(
            'How much is your length?',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: selectedLength),
                  itemExtent: 32,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedLength = index + 1;
                    });
                    prefs.storeLength(selectedLength.toString());
                  },
                  children: List<Widget>.generate(81, (index) => Center(child: Text('${index+120}'),)),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.9,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: index),
                  itemExtent: 32,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      this.index = index;
                    });
                    prefs.storeLengthUnit(index.toString());
                    final unit = units[index];
                  },
                  children: units.map((unit) => Center(child: Text(unit,style: TextStyle(fontSize: 20)),)).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
