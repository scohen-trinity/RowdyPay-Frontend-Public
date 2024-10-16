import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class RotatingDashedCircle extends StatefulWidget {
  final Widget child;

  const RotatingDashedCircle({ super.key, required this.child });

  @override
  State<RotatingDashedCircle> createState() => _RotatingDashedCircleState();
}

class _RotatingDashedCircleState extends State<RotatingDashedCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 45),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14,
                child: DashedCircle(
                  color: Theme.of(context).colorScheme.primary,
                  dashes: 18,
                  child: const Padding(padding: EdgeInsets.all(15.0),
                    child: CircleAvatar(
                    radius: 100.0,
                    ),
                  ),
                ),
              );
            },
          ),
          widget.child,
        ],
      ),
    );
  }
}