import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_routes.dart';
import '../../../../resources/resources.dart';
import '../home_screen_store.dart';
import '../widgets/transaction_button.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeScreenStore>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TransactionButton(
            title: 'Add Money',
            icon: Vectors.walletAdd,
            onTap: () => Modular.to.pushNamed(
              AppRoutes.addMoney,
              arguments: store.users,
            ),
          ),
          TransactionButton(
            title: 'Withdraw Money',
            icon: Vectors.walletMinus,
            onTap: () => Modular.to.pushNamed(
              AppRoutes.withdrawMoney,
              arguments: store.users,
            ),
          ),
          TransactionButton(
            title: 'Transfer Money',
            icon: Vectors.walletExchange,
            onTap: () => Modular.to.pushNamed(
              AppRoutes.transferMoney,
              arguments: store.users,
            ),
          ),
        ],
      ),
    );
  }
}
