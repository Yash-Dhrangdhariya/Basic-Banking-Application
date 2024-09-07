import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/user_dm.dart';
import '../../../../resource/app_colors.dart';
import '../../../../widgets/bba_divider.dart';
import '../../../../widgets/bba_visibility.dart';
import '../../../../widgets/buttons/bba_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text_field.dart';
import 'withdraw_money_screen_store.dart';

class WithdrawMoneyScreen extends StatelessWidget {
  const WithdrawMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<WithdrawMoneyScreenStore>();
    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw Money')),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.appPadding),
        child: Form(
          key: store.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => BbaVisibility(
                  visible: store.selectedSender != null,
                  child: Text(
                    "${store.selectedSender?.name}'s Balance is: ${store.selectedSender?.balance} /-Rs",
                  ),
                ),
              ),
              const BbaDivider(
                margin: EdgeInsets.symmetric(vertical: AppConstants.appPadding),
              ),
              Observer(
                builder: (_) => CustomDropDown<UserDm>(
                  validator: (val) => val != null ? null : 'Please select user',
                  hint: 'Select User',
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
              const SizedBox(height: AppConstants.appPadding),
              CustomTextFieldContainer(
                child: TextFormField(
                  controller: store.amountController,
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                      val?.isNotEmpty ?? false ? null : 'Please enter amount',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: AppColors.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter Amount',
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
}
