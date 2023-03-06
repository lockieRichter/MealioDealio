import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/data/menu.dart';
import 'package:mealio_dealio/ui/menu_row_item.dart';

class MenuView extends ConsumerWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(menuProvider).when(
          data: (menu) => ListView.separated(
            padding: const EdgeInsets.only(bottom: 8),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
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
            separatorBuilder: (context, index) => const Divider(thickness: 1),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(
              key: ValueKey('loading_state'),
            ),
          ),
          error: (error, stack) => Text(error.toString()),
        );
  }
}
