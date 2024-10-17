import 'package:cryptocurrency_tracker/presentation/screens/cryptocurrency_tracker_screen.dart';
import 'package:cryptocurrency_tracker/core/string_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.cryptoTracker,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CryptocurrencyTrackerScreen(),
    );
  }
}
