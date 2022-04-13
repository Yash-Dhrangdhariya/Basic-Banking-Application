import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void _create() async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc('1')
          .set({'name': 'Yash', 'email': 'Yash@gmail.com', 'balance': '10000'});
      await _firebaseFirestore.collection('users').doc('2').set(
          {'name': 'Aniket', 'email': 'Aniket@gmail.com', 'balance': '2000'});
      await _firebaseFirestore
          .collection('users')
          .doc('3')
          .set({'name': 'Raj', 'email': 'Raj@gmail.com', 'balance': '2000'});
      await _firebaseFirestore.collection('users').doc('4').set(
          {'name': 'Kishan', 'email': 'Kishan@gmail.com', 'balance': '5000'});
      await _firebaseFirestore.collection('users').doc('5').set(
          {'name': 'Dharmik', 'email': 'Dharmik@gmail.com', 'balance': '8000'});
      await _firebaseFirestore.collection('users').doc('6').set(
          {'name': 'Prince', 'email': 'Prince@gmail.com', 'balance': '6000'});
      await _firebaseFirestore.collection('users').doc('7').set({
        'name': 'Abdullah',
        'email': 'Abdullah@gmail.com',
        'balance': '10000'
      });
      await _firebaseFirestore
          .collection('users')
          .doc('8')
          .set({'name': 'Ravi', 'email': 'Ravi@gmail.com', 'balance': '12000'});
      await _firebaseFirestore.collection('users').doc('9').set({
        'name': 'Dwarkesh',
        'email': 'Dwarkesh@gmail.com',
        'balance': '4000'
      });
      await _firebaseFirestore.collection('users').doc('10').set(
          {'name': 'Rushi', 'email': 'Rushi@gmail.com', 'balance': '14000'});
    } catch (e) {
      print(e);
    }
  }
}
