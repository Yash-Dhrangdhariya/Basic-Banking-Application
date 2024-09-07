import 'package:flutter_modular/flutter_modular.dart';

import '../../../../models/user_dm.dart';
import 'transfer_money_screen.dart';
import 'transfer_money_store.dart';

class TransferMoneyModule extends Module {
  @override
  void binds(Injector i) {
    final data = i.args.data;
    final users = data is List<UserDm> ? data : <UserDm>[];
    i.addLazySingleton<TransferMoneyStore>(
      () => TransferMoneyStore(users: users),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const TransferMoneyScreen());
  }
}
