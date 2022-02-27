import 'package:flutter/cupertino.dart';
import 'package:test_pro/local_storage/shared_preferencesServices.dart';

class AgeSelector extends StatefulWidget {
  const AgeSelector({Key? key}) : super(key: key);

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  SharedPreferencesServices prefs = SharedPreferencesServices();
  int index = 0;

  @override


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Center(
          child: Text(
            'How old are you?',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.9,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(initialItem: index),
            itemExtent: 64,
            onSelectedItemChanged: (index) {
              setState(() {
                this.index = index;
              });
                prefs.storeAge(index.toString());
              print(index);
            },
            children: List<Widget>.generate(
                80,
                (index) => Center(
                      child: Text('${index}'),
                    )),
          ),
        ),
      ],
    );
  }
}
