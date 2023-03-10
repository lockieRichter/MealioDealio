import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/ui/ingredients_view.dart';
import 'package:mealio_dealio/ui/menu_view.dart';
import 'package:mealio_dealio/ui/nav_bar.dart';
import 'package:mealio_dealio/ui/recipes_view.dart';
import 'package:mealio_dealio/ui/settings_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            key: const ValueKey('settings_button'),
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(_navigateToSettings());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            MenuView(),
            IngredientsView(),
            RecipesView(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 104,
        child: MealioNavBar(
          onTap: (index) => pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear),
        ),
      ),
    );
  }

  Route _navigateToSettings() {
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
