import 'dart:async';

import 'package:attorney_ai/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Token extends StatefulWidget {
  String text;
  Token({
    super.key,
    required this.text,
  });

  @override
  State<Token> createState() => _TokenState();
}

class _TokenState extends State<Token> {

  double opacity = 0.0;

  @override
  void initState() {

    Timer(const Duration(milliseconds: 5), (){
      setState(() {
        opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 700),
      child: Text(
          widget.text,
          style: const TextStyle(
            color: AppColors.primaryText,
            
            fontSize: 16,
          ),
      ),
    );
  }
}
