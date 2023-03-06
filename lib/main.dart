import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealio_dealio/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MealioDealio()));
}

class MealioDealio extends StatelessWidget {
  const MealioDealio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mealio Dealio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
