import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/model/weekday.dart';
import 'package:mealio_dealio/providers/data/database.dart';
import 'package:mealio_dealio/util/string_extensions.dart';

class MenuRowItem extends ConsumerWidget {
  final String? initialValue;
  final Weekday day;

  const MenuRowItem({
    super.key,
    required this.day,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Text(
            day.name.capitalize(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Flexible(
          flex: 3,
          child: Consumer(
            builder: (context, ref, child) {
              return TextFormField(
                key: const ValueKey('menu_value'),
                initialValue: initialValue,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) =>
                    ref.read(menuRepoProvider).updateMenuItem(day, value),
              );
            },
          ),
        ),
      ],
    );
  }
}
