import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/providers/theme.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            key: const ValueKey('close_settings_button'),
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Change theme"),
            IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).setTheme(
                    theme == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
              },
              icon: Icon(
                theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
