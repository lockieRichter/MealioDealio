import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/providers/ingredients.dart';

class IngredientsView extends ConsumerWidget {
  const IngredientsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = ref.watch(ingredientsProvider);
    return initialValue.when(
      data: (value) {
        return TextFormField(
          maxLines: 20,
          key: const ValueKey('menu_value'),
          initialValue: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: (value) =>
              ref.read(ingredientsProvider.notifier).updateValue(value),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stack) {
        return Text(error.toString());
      },
    );
  }
}
