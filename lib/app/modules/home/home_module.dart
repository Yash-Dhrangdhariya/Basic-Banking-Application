import 'package:flutter_modular/flutter_modular.dart';

import '../../../constants/app_routes.dart';
import '../transaction/add_money/add_money_module.dart';
import '../transaction/transfer_money/transfer_money_module.dart';
import '../transaction/withdraw_money/withdraw_money_module.dart';
import 'home_page.dart';
import 'home_screen_store.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeScreenStore>(HomeScreenStore.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(AppRoutes.home, child: (_) => const HomePage())
      ..module(AppRoutes.addMoney, module: AddMoneyModule())
      ..module(AppRoutes.transferMoney, module: TransferMoneyModule())
      ..module(AppRoutes.withdrawMoney, module: WithdrawMoneyModule());
  }
}
