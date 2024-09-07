import 'package:mobx/mobx.dart';

import '../../../models/history_dm.dart';
import '../../../models/user_dm.dart';
import '../../../services/firestore_database/history_service.dart';
import '../../../services/firestore_database/user_service.dart';
import '../../../values/enumeration.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  _HomeScreenStore() {
    sortByReceiverReaction ??= reaction(
      (p0) => sortByReceiver,
      (value) => setHistoryStream(),
    );
    sortBySenderReaction ??= reaction(
      (p0) => sortBySender,
      (value) => setHistoryStream(),
    );
  }

  ReactionDisposer? sortByReceiverReaction;
  ReactionDisposer? sortBySenderReaction;

  @observable
  BottomNavPages tabIndex = BottomNavPages.wallet;

  @observable
  ObservableStream<List<UserDm>> usersStream =
      UserService.getStream().asObservable();

  @observable
  ObservableStream<List<HistoryDm>> historyStream =
      HistoryService.getStream().asObservable();

  @observable
  UserDm? sortByReceiver;

  @observable
  UserDm? sortBySender;

  @computed
  bool get senderOrReceiverNotNull =>
      sortByReceiver != null || sortBySender != null;

  @computed
  List<UserDm> get users => usersStream.value ?? [];

  void setHistoryStream() {
    historyStream = HistoryService.getStream(
      receiver: sortByReceiver?.name,
      sender: sortBySender?.name,
      sortBy: SortBy.time,
    ).asObservable();
  }
}
