import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/history_dm.dart';
import '../../values/enumeration.dart';
import 'firestore_collections.dart';

class HistoryService {
  const HistoryService._();

  static Future<void> create(HistoryDm history) async {
    try {
      await FirestoreCollections.history.doc(history.id).set(history);
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'HistoryService.create',
      );
    }
  }

  static Future<void> createAll(List<HistoryDm> histories) async {
    final historiesLength = histories.length;
    await Future.wait([
      for (var i = 0; i < historiesLength; i++) create(histories[i]),
    ]);
  }

  static Future<HistoryDm?> get(String id) async {
    try {
      final result = await FirestoreCollections.history.doc(id).get();
      return result.data();
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'HistoryService.get',
      );
      return null;
    }
  }

  static Future<List<HistoryDm>> getAll() async {
    try {
      final result = await FirestoreCollections.history.get();
      final docsLength = result.docs.length;
      return [
        for (var i = 0; i < docsLength; i++)
          if (result.docs[i].data() case final history?) history,
      ];
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'HistoryService.get',
      );
      return List.empty();
    }
  }

  static Stream<List<HistoryDm>> getStream({
    SortBy? sortBy,
    bool sortByDes = false,
    String? sender,
    String? receiver,
  }) {
    final collectionRef = FirestoreCollections.history;
    Query<HistoryDm?>? query;

    if (sortBy != null) {
      query = collectionRef.orderBy(sortBy.key, descending: sortByDes);
    }

    if (sender?.isNotEmpty ?? false) {
      query = (query ?? collectionRef).where('sender', isEqualTo: sender);
    }

    if (receiver?.isNotEmpty ?? false) {
      query = (query ?? collectionRef).where('receiver', isEqualTo: receiver);
    }

    return (query ?? FirestoreCollections.history).snapshots().map(
      (result) {
        final docsLength = result.docs.length;
        return [
          for (var i = 0; i < docsLength; i++)
            if (result.docs[i].data() case final history?) history,
        ];
      },
    );
  }

  static Future<bool> delete(String id) async {
    try {
      await FirestoreCollections.history.doc(id).delete();
      return true;
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'HistoryService.delete',
      );
      return false;
    }
  }

  static Future<void> clear() async {
    try {
      final result = await FirestoreCollections.history.get();
      final historyLength = result.docs.length;
      await Future.wait([
        for (var i = 0; i < historyLength; i++) delete(result.docs[i].id),
      ]);
    } catch (e, s) {
      log(
        'Error: $e\nStackTrace: $s',
        name: 'HistoryService.delete',
      );
    }
  }
}
