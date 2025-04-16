import 'dart:math';
import 'package:flutter/material.dart';

class Logo extends StatefulWidget {

  bool load;

  Logo({
    super.key,
    this.load = false,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo>  with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {

    if(widget.load){
      _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2), );
      _animationController.repeat();
      _animation = Tween(begin: 0.0, end: 360.0).animate(_animationController)..addListener((){setState(() {});});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 26,
      height: 26,
      child: Stack(
        
        alignment: Alignment.center,
        children: [
          
          if (widget.load)
          Container(
            alignment: Alignment.center,
            transformAlignment: Alignment.center,
          
            transform: Matrix4.rotationZ(_animation.value * (pi / 180)),
          
                
            width: 20,
            height: 16,
            // color: Colors.red,
                
            child: const Stack(
                
              children: [
                
                Align(child: CircleAvatar(backgroundColor: Colors.white, radius: 1.3,), alignment: Alignment(0, -1.5),),
                Align(child: CircleAvatar(backgroundColor: Colors.white, radius: 1.3,), alignment: Alignment.bottomLeft,),
                Align(child: CircleAvatar(backgroundColor: Colors.white, radius: 1.3,), alignment: Alignment.bottomRight,),
              ],
                
            ),
                
            
          ),
      
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/logo.png'),
            radius: widget.load ?  8.5 : 10,
          ),
      
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.load) {
      _animationController.dispose();
    }
    super.dispose();
  }
}
