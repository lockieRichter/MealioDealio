import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/providers/data/recipe.dart';

class RecipesView extends ConsumerWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = ref.watch(recipeProvider);
    return initialValue.when(
      data: (value) {
        return TextFormField(
          maxLines: 20,
          key: const ValueKey('menu_value'),
          initialValue: value.join('\n'),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: (value) =>
              ref.read(recipeProvider.notifier).addRecipe(value),
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
