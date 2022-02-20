import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  SharedPreferences? prefs;

  void storeGender(String selectedGender) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('gender', selectedGender);
    print("stored gender = $selectedGender");
  }

  void storeAge(String selectedAge) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('age', selectedAge);
  }

  void storeLength(String selectedLength) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('length', selectedLength);
  }

  void storeLengthUnit(String selectedLengthUnit) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('lengthUnit', selectedLengthUnit);
  }

  void storeWeight(String selectedWeight) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('weight', selectedWeight);
  }

  void storeWeightUnit(String selectedWeightUnit) async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString('weightUnit', selectedWeightUnit);
  }

  Future<String?> fetchGender() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.getString('gender');
  }
  Future<String?> fetchAge() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.getString('age');
  }
  Future<String?> fetchLength() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.getString('length');
  }
  Future<String?> fetchLengthUnit() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.getString('lengthUnit');
  }
  Future<String?> fetchWeight() async {
    prefs = await SharedPreferences.getInstance();
    return await prefs?.getString('weight');
  }
}