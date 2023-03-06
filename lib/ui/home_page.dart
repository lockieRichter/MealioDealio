import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/menu.dart';
import 'package:mealio_dealio/ui/menu_row_item.dart';
import 'package:mealio_dealio/ui/settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            key: const ValueKey('settings_button'),
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: ref.watch(menuProvider).when(
              data: (menu) => ListView.separated(
                itemCount: Weekday.values.length,
                itemBuilder: (context, index) {
                  final day = Weekday.values[index];
                  return MenuRowItem(
                      key: ValueKey(
                        'MenuRowItem-${day.name}',
                      ),
                      day: day,
                      initialValue: menu[day]);
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  key: ValueKey('loading_state'),
                ),
              ),
              error: (error, stack) => Text(error.toString()),
            ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SettingsPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
