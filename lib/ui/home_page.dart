import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/providers/menu.dart';
import 'package:mealio_dealio/providers/weekday.dart';
import 'package:mealio_dealio/ui/menu_row_item.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
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
}
