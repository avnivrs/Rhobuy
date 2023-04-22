import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/widget/basic_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/color.dart';
import '../Login.dart';

class EmailTimeDown extends StatefulWidget {
  const EmailTimeDown({Key? key}) : super(key: key);

  @override
  State<EmailTimeDown> createState() => _EmailTimeDownState();
}

class _EmailTimeDownState extends State<EmailTimeDown>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  int levelClock = 62;
  String email = 'okoriec01@gmail.com';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        setState(() {
          levelClock = 0;
        });
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: symmetricPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(),
                  sizedBoxHeight(80),
                  buildHeader('Email sent!'),
                  sizedBoxHeight(20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: 'We sent an email with a reset link to ',
                      style: TextStyle(
                        fontSize: 15.0.sp,
                        color: kGreyColor,
                      ),
                      children: [
                        TextSpan(
                          text: email,
                          style: TextStyle(
                              color: kBlackColor,
                              overflow: TextOverflow.clip,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text:
                              ' If you didn’t receive the email, check your spam folder or tap the resend button.',
                          style: TextStyle(
                            fontSize: 15.0.sp,
                            color: kGreyColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Open mail app',
                          style: TextStyle(
                              fontSize: 15.0.sp,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0.sp,
                              decorationStyle: TextDecorationStyle.solid,
                              color: kBlackColor,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              try {
                                const url = "googlegmail://";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              } catch (e) {
                                print('failed to get app');
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(70),
                  Center(
                    child: Countdown(
                      animation: StepTween(
                        begin: levelClock, // THIS IS A USER ENTERED NUMBER
                        end: 0,
                      ).animate(_controller),
                    ),
                  ),
                  sizedBoxHeight(40),
                  levelClock == 0
                      ? InkWell(
                          onTap: () {},
                          child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 80.h,
                              decoration: BoxDecoration(
                                  color: kGreyBgColor,
                                  borderRadius: buildBorderRadius(50)),
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        )
                      : InkWell(
                          onTap: () {},
                          child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 80.h,
                              decoration: BoxDecoration(
                                  color: kLightGreyBgColor,
                                  borderRadius: buildBorderRadius(50)),
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                  sizedBoxHeight(10),
                  Center(
                      child: TextButton(
                          onPressed: () => Get.offAll(const LoginScreen()),
                          child: const Text('Return to login')))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()} min : ${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')} sec';

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
    );
  }
}
