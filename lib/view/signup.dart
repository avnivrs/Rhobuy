import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/controller/signup_controller.dart';

import '../styles/color.dart';
import '../styles/constants.dart';
import '../widget/basic_widget.dart';
import 'Login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: symmetricPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: EdgeInsets.all(8.sp),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.3)),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.left_chevron,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  sizedBoxHeight(50),
                  Text(
                    'Create an account',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                  ),
                  sizedBoxHeight(10),
                  Text(
                    'You are one step away from an inspired \nshopping! '
                    'Let’s get you signed up into ',
                    style: TextStyle(fontSize: 16.sp, color: kGreyColor),
                  ),
                  sizedBoxHeight(8),
                  Row(
                    children: [
                      Text(
                        'Avniverse',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '  to access Rhobuy!',
                        style: TextStyle(fontSize: 16.sp, color: kGreyColor),
                      ),
                    ],
                  ),
                  sizedBoxHeight(54),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Name'),
                  ),
                  sizedBoxHeight(20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Email address'),
                  ),
                  sizedBoxHeight(20),
                  Obx(() {
                    return TextFormField(
                      obscureText: controller.passwordObscureText.value,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: kGreyColor),
                      decoration: buildInputDecorationII('Password'),
                    );
                  }),
                  sizedBoxHeight(20),
                  Obx(() {
                    return TextFormField(
                      obscureText: controller.confirmPasswordObscureText.value,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: kGreyColor),
                      decoration: buildInputDecorationIII('Confirm password'),
                    );
                  }),
                  sizedBoxHeight(20),
                  Row(
                    children: [
                      Obx(() {
                        return Checkbox(
                            checkColor: kBgColor,
                            fillColor: MaterialStateProperty.all(kGreyColor),
                            value: controller.checkedBool.value,
                            onChanged: (value) {
                              controller.checkedBool.value = value!;
                            });
                      }),
                      SizedBox(
                          width: 280.w,
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'By creating an account, I agree to our  and ',
                              style: TextStyle(
                                fontSize: 11.0.sp,
                                color: kGreyColor,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms of use',
                                  style: TextStyle(
                                      fontSize: 11.0.sp,
                                      color: kGreyColor,
                                      fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                    color: kGreyColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Privacy Policy ',
                                  style: TextStyle(
                                      fontSize: 11.0.sp,
                                      color: kGreyColor,
                                      fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  sizedBoxHeight(20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: kGreyColor,
                            borderRadius: buildBorderRadius(20)),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )),
                  ),
                  sizedBoxHeight(20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: kBgColor,
                            border: Border.all(color: kGreyColor, width: 1.0),
                            borderRadius: buildBorderRadius(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              '${imgUrl}google.png',
                              width: 20.w,
                            ),
                            sizedBoxWidth(10),
                            const Text(
                              'Google',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                  ),
                  sizedBoxHeight(20),
                  const Center(
                    child: Text(
                      'Already have an account yet? ',
                      style: TextStyle(color: kGreyColor),
                    ),
                  ),
                  sizedBoxHeight(15),
                  Center(
                    child: InkWell(
                        onTap: () => Get.to(const LoginScreen()),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: kGreyColor, fontWeight: FontWeight.w600),
                        )),
                  ),
                  sizedBoxHeight(Get.height * 0.1 - 50),
                  copyDateWidget(),
                  sizedBoxHeight(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
