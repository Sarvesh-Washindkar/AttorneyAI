import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),

        // Icon(Icons.auto_awesome, size: 42, color: AppColors.primary,),
        SizedBox(
            width: 80,
            height: 80,
            child: Image.asset("assets/images/logo.png")),

        const Spacer(),
      ],
    );
  }
}
