import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nav_page.g.dart';

@riverpod
class SelectedBottomNavIndex extends _$SelectedBottomNavIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(index) {
    state = index;
  }
}
