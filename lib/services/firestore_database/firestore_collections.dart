import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/history_dm.dart';
import '../../models/user_dm.dart';
import 'firestore_path.dart';

class FirestoreCollections {
  const FirestoreCollections._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final user = _firestore.collection(FirestorePath.users).withConverter(
        fromFirestore: (snapshot, _) => _safeUserFromJson(snapshot.data()),
        toFirestore: (user, _) => user?.toJson() ?? {},
      );

  static final history = _firestore
      .collection(FirestorePath.history)
      .withConverter(
        fromFirestore: (snapshot, _) => _safeHistoryFromJson(snapshot.data()),
        toFirestore: (history, _) => history?.toJson() ?? {},
      );

  static UserDm? _safeUserFromJson(Map<String, dynamic>? data) {
    if (data == null) return null;
    try {
      return UserDm.fromJson(data);
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'FirestoreCollections._safeUserFromJson',
      );
      return null;
    }
  }

  static HistoryDm? _safeHistoryFromJson(Map<String, dynamic>? data) {
    if (data == null) return null;
    try {
      return HistoryDm.fromJson(data);
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'FirestoreCollections._safeHistoryFromJson',
      );
      return null;
    }
  }
}
