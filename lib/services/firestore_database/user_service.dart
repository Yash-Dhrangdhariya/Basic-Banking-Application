import 'dart:developer';

import '../../models/user_dm.dart';
import 'firestore_collections.dart';

class UserService {
  const UserService._();

  static Future<void> create(UserDm user) async {
    try {
      await FirestoreCollections.user.doc(user.id).set(user);
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'UserService.create',
      );
    }
  }

  static Future<void> createAll(List<UserDm> users) async {
    final usersLength = users.length;
    await Future.wait([
      for (var i = 0; i < usersLength; i++) create(users[i]),
    ]);
  }

  static Future<UserDm?> get(String id) async {
    try {
      final result = await FirestoreCollections.user.doc(id).get();
      return result.data();
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'UserService.get',
      );
      return null;
    }
  }

  static Future<void> update(
    String id, {
    String? name,
    String? email,
    double? balance,
  }) async {
    final data = <String, dynamic>{};

    if (name != null) {
      data['name'] = name;
    }

    if (email != null) {
      data['email'] = email;
    }

    if (balance != null) {
      data['balance'] = balance;
    }

    if (data.isEmpty) return;

    try {
      await FirestoreCollections.user.doc(id).update(data);
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'UserService.update',
      );
    }
  }

  static Future<List<UserDm>> getAll() async {
    try {
      final result = await FirestoreCollections.user.get();
      final docsLength = result.docs.length;
      return [
        for (var i = 0; i < docsLength; i++)
          if (result.docs[i].data() case final user?) user,
      ];
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'UserService.get',
      );
      return List.empty();
    }
  }

  static Stream<List<UserDm>> getStream() {
    return FirestoreCollections.user.snapshots().map(
      (result) {
        final docsLength = result.docs.length;
        return [
          for (var i = 0; i < docsLength; i++)
            if (result.docs[i].data() case final user?) user,
        ];
      },
    );
  }

  static Future<void> delete(String id) async {
    try {
      await FirestoreCollections.user.doc(id).delete();
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'UserService.delete',
      );
    }
  }

  static Future<void> deleteAll(List<UserDm> users) async {
    final usersLength = users.length;
    await Future.wait([
      for (var i = 0; i < usersLength; i++) delete(users[i].id),
    ]);
  }
}
