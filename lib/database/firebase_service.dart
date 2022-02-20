import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class FirebaseService {
  final dRef = FirebaseDatabase.instance.ref();
  final String uid;
  FirebaseService({required this.uid});

  void createUser({
    required String email,
    required String password,
  }) {
    final map = {
      'email' : email.toLowerCase(),
      'password' : password,
    };
    dRef.child('users').child(uid).setWithPriority(map,getDate());
  }

  void updateUser({
  required String userName,
    required String sex,
    required String age,
    required String length,
    required String weight,
}) {
    final map = {
      'userName' : userName.toLowerCase(),
      'sex' : sex,
      'age' : age,
      'length' : length,
      'weight' : '$weight kg',
    };

    dRef.child('users').child(uid).update(map);
  }
}

String getDate() {
  final formatter = DateFormat("dd-MM-yyyy");
  final date = DateTime.now();
  return formatter.format(date);
}