import 'package:mealio_dealio/model/weekday.dart';

abstract class MenuRepo {
  const MenuRepo();

  Future<void> updateMenuItem(Weekday day, String recipe);

  Future<Map<Weekday, String>> getMenu();
}
