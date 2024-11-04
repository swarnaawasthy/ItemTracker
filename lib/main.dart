import 'package:flutter/material.dart';
import 'package:item_tracker/feature/item_list/provider/item_provider.dart';
import 'package:provider/provider.dart';

import 'feature/item_list/screen/home_screen.dart';

void main() {
  runApp(const ItemTrackerApp());
}

class ItemTrackerApp extends StatelessWidget {
  const ItemTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
      ],
      child: MaterialApp(
        title: 'Item Tracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}