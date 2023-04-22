import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
            child: Container(
              padding: symmetricPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(),
                  sizedBoxHeight(85),
                  buildHeader('Forgot Password?'),
                  sizedBoxHeight(20),
                  buildHeaderDes(
                      "Enter the email address associated with your account and we'll send you a link to reset your password."),
                  sizedBoxHeight(50),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Email address'),
                  ),
                  sizedBoxHeight(40),
                  buildAuthButton('Proceed', ()=>Get.to(const EmailTimeDown())),
                  sizedBoxHeight(15),
                  Center(
                    child: TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'Return to login',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12.sp),
                        )),
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
