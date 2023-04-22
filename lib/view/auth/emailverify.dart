import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/view/auth/animated_welcome.dart';
import 'package:project_naverda/widget/basic_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: Container(
          padding: symmetricPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              sizedBoxHeight(65),
              buildHeader('Email verification'),
              sizedBoxHeight(20),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: 'Please take a moment to verify your email address. '
                      'We sent an email with a verification link to ',
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
                child: CountdownTimer(
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
                      onTap: () => Get.to(const AnimatedWelcomeScreen()),
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
            ],
          ),
        ),
      ),
    );
  }
}
