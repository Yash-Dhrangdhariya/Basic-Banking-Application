import 'package:json_annotation/json_annotation.dart';

import '../utils/helpers/json_converter_helper.dart';

part 'user_dm.g.dart';

@JsonSerializable()
class UserDm {
  const UserDm({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
  });

  factory UserDm.fromJson(Map<String, dynamic> json) => _$UserDmFromJson(json);

  final String id;
  final String name;
  final String email;
  final double balance;

  Map<String, dynamic> toJson() => _$UserDmToJson(this);

  static const List<UserDm> fakeData = [
    UserDm(
      id: '1',
      name: 'Yash',
      email: 'Yash@xyz.com',
      balance: 10000,
    ),
    UserDm(
      id: '2',
      name: 'Aniket',
      email: 'Aniket@xyz.com',
      balance: 2000,
    ),
    UserDm(
      id: '3',
      name: 'Raj',
      email: 'Raj@xyz.com',
      balance: 2000,
    ),
    UserDm(
      id: '4',
      name: 'Kishan',
      email: 'Kishan@xyz.com',
      balance: 5000,
    ),
    UserDm(
      id: '5',
      name: 'Dharmik',
      email: 'Dharmik@xyz.com',
      balance: 8000,
    ),
    UserDm(
      id: '6',
      name: 'Dharmik',
      email: 'Dharmik@xyz.com',
      balance: 8000,
    ),
    UserDm(
      id: '7',
      name: 'Abdullah',
      email: 'Abdullah@xyz.com',
      balance: 10000,
    ),
    UserDm(
      id: '8',
      name: 'Ravi',
      email: 'Ravi@xyz.com',
      balance: 12000,
    ),
    UserDm(
      id: '9',
      name: 'Dwarkesh',
      email: 'Dwarkesh@xyz.com',
      balance: 4000,
    ),
    UserDm(
      id: '10',
      name: 'Rushi',
      email: 'Rushi@xyz.com',
      balance: 14000,
    ),
  ];
}
