import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class EmailTimeDown extends StatefulWidget {
  const EmailTimeDown({Key? key}) : super(key: key);

  @override
  State<EmailTimeDown> createState() => _EmailTimeDownState();
}

class _EmailTimeDownState extends State<EmailTimeDown> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SlideCountdown(

                    duration: Duration(minutes: 1),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
