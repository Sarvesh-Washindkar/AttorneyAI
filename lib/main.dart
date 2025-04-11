import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'home_page.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyBuA0c8M9HWlXKog5SHpx1CCFTULtHRA2I');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff5966ff)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
