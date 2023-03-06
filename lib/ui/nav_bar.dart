import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/providers/nav_page.dart';

class MealioNavBar extends ConsumerWidget {
  const MealioNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedBottomNavIndexProvider);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_grocery_store_outlined),
          label: 'Ingredients',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        ref.read(selectedBottomNavIndexProvider.notifier).setIndex(index);
      },
    );
  }
}
