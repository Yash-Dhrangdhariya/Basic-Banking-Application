import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:basic_banking_app/resources/resources.dart';

void main() {
  test('vectors assets test', () {
    expect(File(Vectors.documentText).existsSync(), isTrue);
    expect(File(Vectors.listIsEmpty).existsSync(), isTrue);
    expect(File(Vectors.noResults).existsSync(), isTrue);
    expect(File(Vectors.profileUsers).existsSync(), isTrue);
    expect(File(Vectors.walletAdd).existsSync(), isTrue);
    expect(File(Vectors.walletExchange).existsSync(), isTrue);
    expect(File(Vectors.walletMinus).existsSync(), isTrue);
    expect(File(Vectors.wallet).existsSync(), isTrue);
  });
}
