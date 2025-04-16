import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AttorneyAI',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff5966ff)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),

      
    );
  }
}
