import 'dart:async';

import 'package:flutter/material.dart';

class EmailTimeDown extends StatefulWidget {
  const EmailTimeDown({Key? key}) : super(key: key);

  @override
  State<EmailTimeDown> createState() => _EmailTimeDownState();
}

class _EmailTimeDownState extends State<EmailTimeDown> {
  late Timer _timer;
  int _seconds = 60;
  int _minutes = 1;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _minutes--;
            _seconds = 59;
          } else {
            _timer.cancel();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_minutes',
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(width: 10),
                Text(
                  '$_seconds',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
