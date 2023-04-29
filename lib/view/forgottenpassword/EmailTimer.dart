import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/view/forgottenpassword/enter_new_password.dart';
import 'package:project_naverda/widget/basic_widget.dart';
import 'package:project_naverda/widget/countdown.dart';

import '../../styles/color.dart';
import '../auth/Login.dart';

class EmailTimeDown extends StatefulWidget {
  const EmailTimeDown({Key? key}) : super(key: key);

  @override
  State<EmailTimeDown> createState() => _EmailTimeDownState();
}

class _EmailTimeDownState extends State<EmailTimeDown>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int levelClock = 62;
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
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: symmetricPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(),
                  sizedBoxHeight(76),
                  buildHeader('Email sent!'),
                  sizedBoxHeight(20),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: 'We sent an email with a reset link to ',
                      style: TextStyle(
                        height: 1.6,
                        fontSize: 14.0.sp,
                        color: kGreyColor,
                      ),
                      children: [
                        TextSpan(
                          text: email,
                          style: TextStyle(
                              color: kBlackColor,
                              overflow: TextOverflow.clip,
                              fontSize: 14.0.sp,
                              height: 1.6,
                              fontWeight: FontWeight.w500),
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
                              height: 1.6,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5.sp,
                              decorationStyle: TextDecorationStyle.solid,
                              color: kBlackColor,
                              fontWeight: FontWeight.w500),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await LaunchApp.openApp(
                                  androidPackageName: 'com.google.android.gm',
                                  appStoreLink: 'id422689480',
                                  openStore: true);
                            },
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
                  GestureDetector(
                    onTap: () => levelClock == 0
                        ? Get.to(const EnterNewPasswordScreen())
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
                  sizedBoxHeight(20),
                  Center(
                      child: TextButton(
                          onPressed: () => Get.offAll(const LoginScreen()),
                          child:  Text('Return to login',style: TextStyle(fontSize: 12.sp),)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
