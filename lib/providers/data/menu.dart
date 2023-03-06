import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/data/menu_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu.g.dart';

@riverpod
class Menu extends _$Menu {
  @override
  Future<Map<Weekday, String>> build() {
    return ref.read(menuRepositoryProvider.notifier).menu;
  }

  void updateValue(Weekday weekday, String value) {
    state.whenData((data) => data[weekday] = value);
    ref.read(menuRepositoryProvider.notifier).updateValue(weekday, value);
  }
}
