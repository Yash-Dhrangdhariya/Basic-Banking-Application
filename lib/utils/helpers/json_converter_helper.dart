import 'package:cloud_firestore/cloud_firestore.dart'
    show FieldValue, Timestamp;
import 'package:json_annotation/json_annotation.dart';

class FirestoreDateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const FirestoreDateTimeConverter();

  @override
  DateTime fromJson(dynamic json) =>
      json is Timestamp ? json.toDate().toLocal() : DateTime.now();

  @override
  dynamic toJson(DateTime object) => FieldValue.serverTimestamp();
}

class DoubleToStringConverter implements JsonConverter<double, String> {
  const DoubleToStringConverter();

  @override
  double fromJson(String json) => double.tryParse(json) ?? 0;

  @override
  String toJson(double object) => object.toString();
}
