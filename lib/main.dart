import 'package:flutter/material.dart';
import 'package:unit_test_example/photo/photo_screen.dart';
import 'counter/counter_screen.dart';
import 'user/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PhotoScreen(),
      // home:  const CounterScreen(),
      // home: UserScreen(),
    );
  }
}
