import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/history_dm.dart';
import '../../../../models/user_dm.dart';
import '../../../../services/firestore_database/history_service.dart';
import '../../../../services/firestore_database/user_service.dart';
import '../../../../utils/snackbar_service.dart';
import '../../../../values/app_strings.dart';
import '../../../../values/enumeration.dart';
import '../../../../widgets/custom_dialog_box.dart';

part 'transfer_money_store.g.dart';

class TransferMoneyStore = _TransferMoneyStore with _$TransferMoneyStore;

abstract class _TransferMoneyStore with Store {
  _TransferMoneyStore({required this.users});

  final List<UserDm> users;

  final formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  @observable
  NetworkState transferMoneyState = NetworkState.idle;

  @observable
  UserDm? selectedSender;

  @observable
  UserDm? selectedReceiver;

  @observable
  double? amount;

  Future<void> submit(BuildContext context) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    await _transferMoney();
    Modular.to.pop();
    if (!context.mounted) return;
    return showDialog(
      context: context,
      builder: (_) => CustomDialog(
        onPressed: () => Modular.to.pop(false),
        title: 'Transaction Successful',
        isSuccess: true,
        description: 'Money Transferred \nFrom: ${selectedSender?.name} '
            'To: ${selectedReceiver?.name}',
      ),
    );
  }

  Future<void> _transferMoney() async {
    final sender = selectedSender;
    final receiver = selectedReceiver;
    final newAmount = amount ?? 0;
    if (sender == null || receiver == null || newAmount <= 0) return;
    try {
      final canDeductMoney = _deductMoneyOfSender(newAmount);
      final performTransaction = canDeductMoney;
      if (!performTransaction) return;
      await Future.wait(
        [
          UserService.update(
            sender.id,
            balance: sender.balance - newAmount,
          ),
          UserService.update(
            receiver.id,
            balance: receiver.balance + newAmount,
          ),
        ],
      );
      await HistoryService.create(
        HistoryDm(
          id: AppConstants.uuid.v8(),
          sender: sender.name,
          amount: amount!,
          receiver: receiver.name,
          time: DateTime.timestamp(),
          image: AppConstants.deductMoneyImageUrl,
          desc:
              '$amount/- Rupees transferred from ${sender.name} to ${receiver.name}',
        ),
      );
      SnackBarService.showSnack('Congratulation, Transaction Successful');
    } catch (e) {
      SnackBarService.showSnack(AppStrings.oopsSomethingWentWrong);
    }
  }

  bool _deductMoneyOfSender(double amount) {
    final balance = selectedSender?.balance;
    if (balance == null) return false;
    if (balance < 0) {
      SnackBarService.showSnack(
        'Transaction Unsuccessful',
        subMessage: 'You have not sufficient balance to transfer Money.',
      );
      return false;
    } else if (balance < amount) {
      SnackBarService.showSnack(
        'Transaction Unsuccessful',
        subMessage: 'You have not sufficient balance to transfer Money.',
      );
      return false;
    } else {
      return true;
    }
  }
}
