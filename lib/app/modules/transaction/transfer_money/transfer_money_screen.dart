import 'package:basic_banking_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/user_dm.dart';
import '../../../../resource/app_colors.dart';
import '../../../../widgets/bba_divider.dart';
import '../../../../widgets/buttons/bba_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text_field.dart';
import 'transfer_money_store.dart';

class TransferMoneyScreen extends StatelessWidget {
  const TransferMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<TransferMoneyStore>();
    return Scaffold(
      appBar: AppBar(title: const Text('Transfer Money')),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.appPadding),
        child: Form(
          key: store.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => RichText(
                  text: TextSpan(
                    children: [
                      if (store.selectedSender != null) ...[
                        const TextSpan(text: 'From: '),
                        TextSpan(
                          text: store.selectedSender?.name,
                          style: context.appText.sbSubHeadline,
                        ),
                      ],
                      if (store.selectedReceiver != null) ...[
                        const TextSpan(text: ' To: '),
                        TextSpan(
                          text: store.selectedReceiver?.name,
                          style: context.appText.sbSubHeadline,
                        ),
                      ],
                    ],
                    style: context.appText.subHeadline,
                  ),
                ),
              ),
              const BbaDivider(
                margin: EdgeInsets.symmetric(vertical: AppConstants.appPadding),
              ),
              Row(
                children: [
                  Expanded(
                    child: Observer(
                      builder: (_) => CustomDropDown<UserDm>(
                        validator: (sender) => _validateSender(
                          sender?.name,
                          store.selectedReceiver?.name,
                        ),
                        hint: 'From User',
                        items: List.generate(
                          store.users.length,
                          (index) {
                            final user = store.users[index];
                            return DropdownMenuItem(
                              value: user,
                              child: Text(user.name),
                            );
                          },
                        ),
                        onChanged: (val) => store.selectedSender = val,
                        value: store.selectedSender,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.appPadding),
                  Expanded(
                    child: Observer(
                      builder: (_) => CustomDropDown<UserDm>(
                        validator: (receiver) => _validateReceiver(
                          receiver?.name,
                          store.selectedSender?.name,
                        ),
                        hint: 'To User',
                        items: List.generate(
                          store.users.length,
                          (index) {
                            final user = store.users[index];
                            return DropdownMenuItem(
                              value: user,
                              child: Text(user.name),
                            );
                          },
                        ),
                        onChanged: (val) => store.selectedReceiver = val,
                        value: store.selectedReceiver,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.appPadding),
              CustomTextFieldContainer(
                child: TextFormField(
                  controller: store.amountController,
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                      val?.isNotEmpty ?? false ? null : 'Please enter amount',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: AppColors.text,
                  onChanged: (value) => store.amount = double.tryParse(value),
                  decoration: const InputDecoration(
                    labelText: 'Transfer Amount',
                    labelStyle: TextStyle(color: AppColors.text),
                    border: InputBorder.none,
                    hintText: 'Amount',
                    hintStyle: TextStyle(color: AppColors.text),
                  ),
                ),
              ),
              const BbaDivider(
                margin: EdgeInsets.symmetric(vertical: AppConstants.appPadding),
              ),
              BbaButton(title: 'Done', onTap: () => store.submit(context)),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateSender(String? sender, String? receiver) {
    if (sender == null) {
      return 'Please select sender';
    } else if (sender == receiver) {
      return "You can't choose same user to send money";
    } else {
      return null;
    }
  }

  String? _validateReceiver(String? receiver, String? sender) {
    if (receiver == null) {
      return 'Please select receiver';
    } else if (receiver == sender) {
      return "You can't choose same user to send money";
    } else {
      return null;
    }
  }
}
