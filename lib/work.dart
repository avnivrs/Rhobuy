import 'package:flutter/material.dart';

class SlidingLinearProgressIndicator extends StatefulWidget {
  @override
  _SlidingLinearProgressIndicatorState createState() => _SlidingLinearProgressIndicatorState();
}

class _SlidingLinearProgressIndicatorState extends State<SlidingLinearProgressIndicator> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller!);
    _controller!.repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation!.value,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        );
      },
    );
  }
}
