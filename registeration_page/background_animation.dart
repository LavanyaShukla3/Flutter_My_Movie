import 'package:flutter/material.dart';

class BackgroundAnimation extends StatefulWidget {
  const BackgroundAnimation({super.key});

  @override
  BackgroundAnimationState createState() => BackgroundAnimationState();
}


class BackgroundAnimationState extends State<BackgroundAnimation> with SingleTickerProviderStateMixin {
  //controller - manages the animation - duration
  late AnimationController _controller;
  //Animation-control the curves
  late Animation<double> _animation;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      //this represents current context
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    //tween- creating an intermediate state between the two endpoints
    //used with AnimationController, which helps play the animations forward or backward.
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      //parent- on what the curve is applied to
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {

        //making the animation opaque
        return Stack(
              children: [
                Positioned.fill(
                  left: _animation.value * MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/movie.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  left: (_animation.value - 1.0) * MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/movie.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
       );
      },
    );
  }
}
