import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/controller/login_controller.dart';
import 'package:project_naverda/styles/constants.dart';
import 'package:project_naverda/view/forgotten.dart';
import 'package:project_naverda/view/signup.dart';

import '../styles/color.dart';
import '../widget/basic_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: symmetricPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(),
                  sizedBoxHeight(70),
                  buildHeader('Welcome Back'),
                  sizedBoxHeight(10),
                  Text(
                    'Please login to Rhobuy using your',
                    style: TextStyle(fontSize: 15.sp, color: kGreyColor),
                  ),
                  sizedBoxHeight(8),
                  Row(
                    children: [
                      Text(
                        'Avniverse',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      const Text(
                        ' account!',
                        style: TextStyle(fontSize: 15, color: kGreyColor),
                      ),
                    ],
                  ),
                  sizedBoxHeight(50),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Email address'),
                  ),
                  sizedBoxHeight(25),
                  Obx(() {
                    return TextFormField(
                      obscureText: controller.obscureText.value,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: kGreyColor),
                      decoration: buildInputDecorationIV('Password'),
                    );
                  }),
                  TextButton(
                      onPressed: () => Get.to(const ForgotPasswordScreen()),
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(color: kGreyColor),
                      )),
                  sizedBoxHeight(20),
                  buildAuthButton('Login', () {}),
                  sizedBoxHeight(30),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: kBgColor,
                            border: Border.all(
                              color: kGreyColor,
                              width: 1.0.w,
                            ),
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
                  sizedBoxHeight(30),
                  const Center(
                    child: Text(
                      'Don’t have an account yet? ',
                      style: TextStyle(color: kGreyColor),
                    ),
                  ),
                  sizedBoxHeight(20),
                  Center(
                    child: InkWell(
                        onTap: () => Get.off(const SignupScreen()),
                        child: const Text(
                          'Create an account now!',
                          style: TextStyle(
                              color: kGreyColor, fontWeight: FontWeight.w600),
                        )),
                  ),
                  sizedBoxHeight(Get.height * 0.1.h),
                  copyDateWidget(),
                  sizedBoxHeight(50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
