import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/controller/signup_controller.dart';

import '../styles/color.dart';
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
                  backButton(),
                  sizedBoxHeight(65),
                  buildHeader('Create an account'),
                  sizedBoxHeight(10),
                  buildHeaderDes(
                      "You are one step away from an inspired \nshopping! Let’s get you signed up into "),
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
                  sizedBoxHeight(30),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Email address'),
                  ),
                  sizedBoxHeight(30),
                  Obx(() {
                    return TextFormField(
                      obscureText: controller.passwordObscureText.value,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: kGreyColor),
                      decoration: buildInputDecorationII('Password'),
                    );
                  }),
                  sizedBoxHeight(30),
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
                  buildAuthButton('Sign up', () {}),
                  sizedBoxHeight(30),
                  buildGoogle(() {}),
                  sizedBoxHeight(20),
                  const Center(
                    child: Text(
                      'Already have an account? ',
                      style: TextStyle(color: kGreyColor),
                    ),
                  ),
                  sizedBoxHeight(20),
                  Center(
                    child: InkWell(
                        onTap: () => Get.off(const LoginScreen()),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: kGreyColor, fontWeight: FontWeight.w600),
                        )),
                  ),
                  sizedBoxHeight(Get.height * 0.1 - 20),
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
