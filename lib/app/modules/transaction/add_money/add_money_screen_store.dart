import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/history_dm.dart';
import '../../../../models/user_dm.dart';
import '../../../../services/firestore_database/history_service.dart';
import '../../../../services/firestore_database/user_service.dart';
import '../../../../values/enumeration.dart';
import '../../../../widgets/custom_dialog_box.dart';

part 'add_money_screen_store.g.dart';

class AddMoneyScreenStore = _AddMoneyScreenStore with _$AddMoneyScreenStore;

abstract class _AddMoneyScreenStore with Store {
  _AddMoneyScreenStore({required this.users});

  final List<UserDm> users;

  final formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  @observable
  NetworkState addMoneyState = NetworkState.idle;

  @observable
  UserDm? selectedUser;

  Future<void> _addMoneyToUser(double amount) async {
    final user = selectedUser;
    if (user == null || amount <= 0) return;

    addMoneyState = NetworkState.loading;

    final newBalance = user.balance + amount;

    await UserService.update(user.id, balance: newBalance);
    await HistoryService.create(
      HistoryDm(
        id: AppConstants.uuid.v8(),
        amount: amount,
        desc: 'Money Added \nTo: ${user.name}',
        time: DateTime.timestamp(),
        receiver: user.name,
        sender: user.name,
        image: AppConstants.addMoneyImageUrl,
      ),
    );
  }

  Future<void> submit(BuildContext context) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    final amount = double.tryParse(amountController.text) ?? 0;
    await _addMoneyToUser(amount);
    await Modular.to.maybePop();
    if (!context.mounted) return;
    return showDialog<void>(
      context: context,
      builder: (_) {
        return CustomDialog(
          onPressed: () => Modular.to.maybePop(false),
          title: 'Transaction Successful',
          isSuccess: true,
          description: '$amount/- Rupees added to ${selectedUser?.name}',
        );
      },
    );
  }
}
