import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/styles/color.dart';
import 'package:project_naverda/view/Login.dart';

class CountdownProgressBar extends StatefulWidget {
  final int durationSeconds;
  final int index;

  const CountdownProgressBar({
    Key? key,
    required this.durationSeconds,
    required this.index,
  }) : super(key: key);

  @override
  _CountdownProgressBarState createState() => _CountdownProgressBarState();
}

class _CountdownProgressBarState extends State<CountdownProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller);
    _controller.forward().whenComplete(() {
      if (widget.index == 0) {
        Get.to(const LoginScreen(), transition: Transition.rightToLeftWithFade,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut);
      }
    });
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
        return LinearProgressIndicator(
          value: _animation.value,
          backgroundColor: kBgColor,
          minHeight: 12.spMax,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.black54),
        );
      },
    );
  }
}

class Countdown extends StatefulWidget {
  const Countdown({
    Key? key,
    required this.duration,
    required this.builder,
    required this.onFinish,
    this.interval = const Duration(seconds: 1),
  }) : super(key: key);

  final Duration duration;
  final Duration interval;
  final void Function() onFinish;
  final Widget Function(BuildContext context, Duration remaining) builder;

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer? _timer;
  Duration? _duration;

  @override
  void initState() {
    _duration = widget.duration;
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(widget.interval, timerCallback);
  }

  void timerCallback(Timer timer) {
    setState(() {
      if (_duration?.inSeconds == 0) {
        timer.cancel();
        widget.onFinish();
      } else {
        _duration = Duration(seconds: _duration!.inSeconds - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _duration!);
  }
}

class CountdownFormatted extends StatelessWidget {
  const CountdownFormatted({
    Key? key,
    required this.duration,
    required this.builder,
    required this.onFinish,
    this.interval = const Duration(seconds: 1),
    required this.formatter,
  }) : super(key: key);

  final Duration duration;
  final Duration interval;
  final void Function() onFinish;

  /// An function to format the remaining time
  final String Function(Duration) formatter;

  final Widget Function(BuildContext context, String remaining) builder;

  Function(Duration) _formatter() {
    return formatter;
    // if (duration.inHours >= 1) return formatByHours;
    // if (duration.inMinutes >= 1) return formatByMinutes;
    //
    // return formatBySeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      interval: interval,
      onFinish: onFinish,
      duration: duration,
      builder: (BuildContext ctx, Duration remaining) {
        return builder(ctx, _formatter()(remaining));
      },
    );
  }
}

String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) =>
    twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}
