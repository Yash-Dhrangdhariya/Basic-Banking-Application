import 'app_strings.dart';

enum SortBy {
  time('time');

  const SortBy(this.key);

  final String key;

  bool get isTime => this == time;
}

enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == idle;

  bool get isLoading => this == loading;

  bool get isSuccess => this == success;

  bool get isError => this == error;
}

enum BottomNavPages {
  users(AppStrings.users),
  wallet(AppStrings.wallet),
  history(AppStrings.history);

  const BottomNavPages(this.title);

  final String title;

  bool get isUsers => this == users;

  bool get isWallet => this == wallet;

  bool get isHistory => this == history;

  static BottomNavPages parse(int index) {
    if (index == wallet.index) {
      return wallet;
    } else if (index == history.index) {
      return history;
    } else {
      return users;
    }
  }
}
