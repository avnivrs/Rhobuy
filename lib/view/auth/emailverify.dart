import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/view/auth/animated_welcome.dart';
import 'package:project_naverda/widget/basic_widget.dart';

import '../../styles/color.dart';
import '../../widget/countdown.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int levelClock = 70;
  String email = 'okoriec01@gmail.com';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: backButton(),
            ),
            sizedBoxHeight(76),
            Container(
              padding: symmetricPadding,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeader('Email verification'),
                        sizedBoxHeight(12),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text:
                                'Please take a moment to verify your email address. '
                                'We sent an email with a verification link to ',
                            style: TextStyle(
                              fontSize: 14.0.sp,
                              color: kGreyColor,
                              height: 1.6,
                            ),
                            children: [
                              TextSpan(
                                text: email,
                                style: TextStyle(
                                  color: kBlackColor,
                                  overflow: TextOverflow.clip,
                                  fontSize: 14.0.sp,
                                  height: 1.6,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' If you didn’t receive the email, check your spam folder or tap the resend button.',
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: kGreyColor,
                                  height: 1.6,
                                ),
                              ),
                              TextSpan(
                                  text: 'Open mail app',
                                  style: TextStyle(
                                      fontSize: 14.0.sp,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2.0.sp,
                                      decorationStyle: TextDecorationStyle.solid,
                                      color: kBlackColor,
                                      height: 1.6,
                                      fontWeight: FontWeight.w500),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      await LaunchApp.openApp(
                                          androidPackageName:
                                              'com.google.android.gm',
                                          appStoreLink: 'id422689480',
                                          openStore: true);
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(50),
                  Center(
                    child: CountdownTimer(
                      animation: StepTween(
                        begin: levelClock, // THIS IS A USER ENTERED NUMBER
                        end: 0,
                      ).animate(_controller),
                    ),
                  ),
                  sizedBoxHeight(20),
                  InkWell(
                    onTap: () => levelClock == 0
                        ? Get.to(const AnimatedWelcomeScreen())
                        : null,
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20.r),
                        decoration: BoxDecoration(
                            color: levelClock == 0
                                ? kGreyBgColor
                                : kLightGreyBgColor,
                            borderRadius: buildBorderRadius(50)),
                        child: Text(
                          'Resend',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
