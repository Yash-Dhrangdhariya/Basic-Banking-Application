import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../values/enumeration.dart';
import 'home_screen_store.dart';
import 'views/history_view.dart';
import 'views/transaction_view.dart';
import 'views/users_view.dart';
import 'widgets/app_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeScreenStore>();
    return Observer(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(store.tabIndex.title),
        ),
        body: IndexedStack(
          index: store.tabIndex.index,
          children: const [
            UserView(),
            TransactionView(),
            HistoryView(),
          ],
        ),
        bottomNavigationBar: AppNavBar(
          currentIndex: store.tabIndex.index,
          onTap: (index) => store.tabIndex = BottomNavPages.parse(index),
        ),
      ),
    );
  }
}
