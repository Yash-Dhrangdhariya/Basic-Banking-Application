import 'package:flutter_modular/flutter_modular.dart';

import '../../../../models/user_dm.dart';
import 'withdraw_money_screen.dart';
import 'withdraw_money_screen_store.dart';

class WithdrawMoneyModule extends Module {
  @override
  void binds(Injector i) {
    final data = i.args.data;
    final users = data is List<UserDm> ? data : <UserDm>[];
    i.addLazySingleton<WithdrawMoneyScreenStore>(
      () => WithdrawMoneyScreenStore(users: users),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const WithdrawMoneyScreen());
  }
}
