import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/history_dm.dart';
import '../../../../models/user_dm.dart';
import '../../../../services/firestore_database/history_service.dart';
import '../../../../services/firestore_database/user_service.dart';
import '../../../../utils/snackbar_service.dart';
import '../../../../values/enumeration.dart';
import '../../../../widgets/custom_dialog_box.dart';

part 'withdraw_money_screen_store.g.dart';

class WithdrawMoneyScreenStore = _WithdrawMoneyScreenStore
    with _$WithdrawMoneyScreenStore;

abstract class _WithdrawMoneyScreenStore with Store {
  _WithdrawMoneyScreenStore({required this.users});

  final List<UserDm> users;

  final formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  @observable
  NetworkState withdrawMoneyState = NetworkState.idle;

  @observable
  UserDm? selectedSender;

  Future<void> submit(BuildContext context) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    final user = selectedSender;
    if (user == null) return;
    final amount = double.tryParse(amountController.text) ?? 0;
    final canDeduct = canDeductMoney(amount);
    if (!canDeduct) return;
    await UserService.update(user.id, balance: user.balance - amount);
    await HistoryService.create(
      HistoryDm(
        id: AppConstants.uuid.v8(),
        amount: amount,
        desc: 'Money Withdraw \nFrom: ${user.name}',
        time: DateTime.timestamp(),
        receiver: user.name,
        sender: user.name,
        image: AppConstants.deductMoneyImageUrl,
      ),
    );
    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (_) => CustomDialog(
        onPressed: () => Modular.to.pop(false),
        title: 'Transaction Successful',
        isSuccess: true,
        description: '$amount/- Rupees withdraw from ${user.name}',
      ),
    );
  }

  bool canDeductMoney(double amount) {
    final balance = selectedSender?.balance ?? 0;
    if (balance < 0) {
      SnackBarService.showSnack(
        'Transaction Unsuccessful',
        subMessage: 'You have not sufficient balance to Withdraw Money.',
      );
      return false;
    } else if (amount <= 0) {
      SnackBarService.showSnack(
        'Transaction Unsuccessful',
        subMessage: 'You have enter invalid amount to Withdraw Money.',
      );
      return false;
    } else if (balance < amount) {
      SnackBarService.showSnack(
        'Transaction Unsuccessful',
        subMessage: 'You have not sufficient balance to Withdraw Money.',
      );
      return false;
    } else {
      return true;
    }
  }
}
