import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/tabs.dart';

final them = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: Colors.orangeAccent),
);
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: them,
      home: const TabsScreen(),
    );
  }
}
