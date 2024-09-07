import 'package:uuid/uuid.dart';

class AppConstants {
  const AppConstants._();

  static const uuid = Uuid();

  static const double iosDefaultIndicatorRadius = 12;
  static const double androidDefaultIndicatorStrokeWidth = 4;

  static const double appPadding = 16;

  static const String addMoneyImageUrl =
      'https://firebasestorage.googleapis.com/v0/b/new-yash-project.appspot.com/o/add.png?alt=media&token=00ac034a-34c1-44ae-9dfa-7d0144126a56';
  static const String deductMoneyImageUrl =
      'https://firebasestorage.googleapis.com/v0/b/new-yash-project.appspot.com/o/minus.png?alt=media&token=1d49861f-6d79-4a3a-a99a-df1cbb229e2f';
}
