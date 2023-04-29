import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/styles/constants.dart';
import 'package:project_naverda/widget/basic_widget.dart';

import '../../styles/color.dart';
import 'EmailTimer.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: backButton(),
                ),
                sizedBoxHeight(72),
                Container(
                  padding: symmetricPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildHeader('Forgot Password?'),
                            sizedBoxHeight(12),
                            buildHeaderDes(
                                "Enter the email address associated with your account and we'll send you a link to reset your password."),
                          ],
                        ),
                      ),
                      sizedBoxHeight(50),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: kGreyColor),
                        decoration: buildInputDecoration('Email address'),
                      ),
                      sizedBoxHeight(30),
                      buildAuthButton(
                          'Proceed', () => Get.to(const EmailTimeDown())),
                      sizedBoxHeight(20),
                      Center(
                        child: TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'Return to login',
                              style: TextStyle(
                                fontFamily: fontFamily,
                                  fontWeight: FontWeight.w600, fontSize: 12.sp),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
