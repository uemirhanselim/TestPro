import 'package:flutter/cupertino.dart';
import 'package:test_pro/local_storage/shared_preferencesServices.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({Key? key}) : super(key: key);

  @override
  _WeightSelectorState createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {

  final units = [
    'kg',
  ];

  int index = 0;
  int selectedWeight = 0;

  @override
  Widget build(BuildContext context) {
    SharedPreferencesServices prefs = SharedPreferencesServices();
    return Column(
      children: [
        Center(
          child: Text(
            'How much is your weight?',
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
                  scrollController: FixedExtentScrollController(initialItem: selectedWeight),
                  itemExtent: 32,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedWeight = index;
                    });
                    prefs.storeWeight(selectedWeight.toString());
                  },
                  children: List<Widget>.generate(100, (index) => Center(child: Text('${index}'),)),
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
                    prefs.storeWeightUnit(index.toString());
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
