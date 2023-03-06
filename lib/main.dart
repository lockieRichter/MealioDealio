import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/providers/database.dart';
import 'package:mealio_dealio/providers/shared_prefs.dart';
import 'package:mealio_dealio/providers/theme.dart';
import 'package:mealio_dealio/ui/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final database = await getDatabase();

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
      databaseProvider.overrideWithValue(database),
    ],
    child: const MealioDealio(),
  ));
}

class MealioDealio extends ConsumerWidget {
  const MealioDealio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Mealio Dealio',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: themeMode,
      home: const HomePage(),
    );
  }
}
