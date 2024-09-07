import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../constants/app_constants.dart';
import '../../../../models/user_dm.dart';
import '../../../../resources/resources.dart';
import '../../../../services/firestore_database/history_service.dart';
import '../../../../services/firestore_database/user_service.dart';
import '../../../../values/app_strings.dart';
import '../../../../widgets/bba_empty_tile.dart';
import '../../../../widgets/bba_stream_builder.dart';
import '../../../../widgets/buttons/bba_button.dart';
import '../home_screen_store.dart';
import '../widgets/user_tile.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeScreenStore>();
    return BbaStreamBuilder(
      stream: store.usersStream,
      onSuccess: (users) {
        final usersLength = users.length + 1;
        return ListView.separated(
          itemCount: usersLength,
          padding: const EdgeInsets.all(AppConstants.appPadding),
          itemBuilder: (_, index) => index == usersLength - 1
              ? BbaButton(
                  title: 'Delete All',
                  onTap: () => UserService.deleteAll(UserDm.fakeData),
                )
              : UserTile(user: users[index]),
          separatorBuilder: (_, __) => const SizedBox(
            height: AppConstants.appPadding,
          ),
        );
      },
      onNoData: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 52),
        child: BbaEmptyTile(
          icon: Vectors.listIsEmpty,
          iconSize: 280,
          title: AppStrings.noUsers,
          description: AppStrings.noUsersDesc,
          child: BbaButton(
            onTap: () => Future.wait([
              UserService.createAll(UserDm.fakeData),
              HistoryService.clear(),
            ]),
            title: AppStrings.noUsersButton,
          ),
        ),
      ),
    );
  }
}
