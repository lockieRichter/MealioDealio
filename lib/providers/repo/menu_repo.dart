import 'package:mealio_dealio/providers/repo/database.dart';
import 'package:mealio_dealio/repo/abstract/menu_repo.dart';
import 'package:mealio_dealio/repo/sql/sql_menu_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_repo.g.dart';

@riverpod
MenuRepo menuRepo(MenuRepoRef ref) {
  final database = ref.watch(databaseProvider);

  return SqlMenuRepo(database: database);
}
