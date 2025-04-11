import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LightBlueShadow extends StatelessWidget {
  Widget? child;

  LightBlueShadow({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(234, 241, 251, 1),
            // color: Color.fromARGB(255, 235, 235, 235),
            blurRadius: 15,
            spreadRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
