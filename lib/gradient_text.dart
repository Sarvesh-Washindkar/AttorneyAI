import 'package:attorney_ai/app_colors.dart';
import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  const GradientText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2500));
    _animation = Tween(begin: 0.0, end: 1.7).animate(_animationController)..addListener((){setState(() {});});
    _animationController.repeat();


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          stops: [
            _animation.value - 0.3,
            _animation.value,
            _animation.value + 0.3
          ],
          colors: const [AppColors.secondaryText, Color.fromARGB(255, 230, 230, 230), AppColors.secondaryText],
        ).createShader(rect),
        child: Text(widget.text, style: const TextStyle(color: Colors.white, fontSize: 16),),
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
    
    super.dispose();
  }
}
