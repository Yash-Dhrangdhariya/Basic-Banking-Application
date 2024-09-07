import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_constants.dart';
import '../../../../resources/resources.dart';
import '../../../../values/app_strings.dart';
import '../../../../widgets/bba_empty_tile.dart';
import '../../../../widgets/bba_stream_builder.dart';
import '../home_screen_store.dart';
import '../widgets/history_tile.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeScreenStore>();
    return BbaStreamBuilder(
      stream: store.historyStream,
      onSuccess: (histories) => ListView.separated(
        itemCount: histories.length,
        padding: const EdgeInsets.all(AppConstants.appPadding),
        itemBuilder: (_, index) => HistoryTile(
          history: histories[index],
        ),
        separatorBuilder: (_, __) => const SizedBox(
          height: AppConstants.appPadding,
        ),
      ),
      // onNoData: const BbaNoData(),
      onNoData: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 52),
        child: BbaEmptyTile(
          icon: Vectors.noResults,
          iconSize: 280,
          title: AppStrings.noHistory,
          description: AppStrings.kEmpty,
        ),
      ),
    );
  }
}
