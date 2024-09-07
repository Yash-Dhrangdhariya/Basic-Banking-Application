import 'package:json_annotation/json_annotation.dart';

import '../utils/helpers/json_converter_helper.dart';

part 'history_dm.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HistoryDm {
  const HistoryDm({
    required this.id,
    required this.amount,
    required this.desc,
    required this.time,
    required this.receiver,
    required this.sender,
    required this.image,
    this.senderId,
    this.receiverId,
  });

  factory HistoryDm.fromJson(Map<String, dynamic> json) =>
      _$HistoryDmFromJson(json);

  final String id;
  final double amount;
  final String desc;
  final String? senderId;
  final String? receiverId;
  final String receiver;
  final String sender;
  final String image;

  @FirestoreDateTimeConverter()
  final DateTime time;

  Map<String, dynamic> toJson() => _$HistoryDmToJson(this);

  HistoryDm copyWith({
    String? id,
    double? amount,
    String? desc,
    String? senderId,
    String? receiverId,
    String? receiver,
    String? sender,
    String? image,
    DateTime? time,
  }) {
    return HistoryDm(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      desc: desc ?? this.desc,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      receiver: receiver ?? this.receiver,
      sender: sender ?? this.sender,
      image: image ?? this.image,
      time: time ?? this.time,
    );
  }
}
