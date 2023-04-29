import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/controller/login_controller.dart';
import 'package:project_naverda/styles/constants.dart';
import 'package:project_naverda/view/auth/signup.dart';

import '../../styles/color.dart';
import '../../widget/basic_widget.dart';
import '../forgottenpassword/enteremail.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxHeight(80),
                        buildHeader('Welcome Back!'),
                        sizedBoxHeight(12),
                        Text(
                          'Please login to Rhobuy using your',
                          style: TextStyle(fontSize: 15.sp, color: kGreyColor,fontFamily: fontFamily),
                        ),
                        sizedBoxHeight(8),
                        Row(
                          children: [
                            Text(
                              'Avniverse',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w500,fontFamily: fontFamily),
                            ),
                             Text(
                              ' account!',
                              style: TextStyle(fontSize: 15, color: kGreyColor,fontFamily: fontFamily),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(50),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Email address'),
                  ),
                  sizedBoxHeight(20),
                  Obx(() {
                    return TextFormField(
                      obscureText: controller.obscureText.value,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: kGreyColor),
                      decoration: buildInputDecorationLogin('Password'),
                    );
                  }),
                  sizedBoxHeight(10),
                  InkWell(
                      onTap: () => Get.to(const ForgotPasswordScreen()),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20).r,
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                              color: kGreyColor,
                              fontSize: 11.spMax,
                              fontFamily: fontFamily),
                        ),
                      )),
                  sizedBoxHeight(40),
                  buildAuthButton('Login', () {}),
                  sizedBoxHeight(20),
                  buildGoogle(() {}),
                  sizedBoxHeight(20),
                  GestureDetector(
                    onTap: () => Get.to(const SignupScreen()),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Don’t have an account yet? ',
                            style: TextStyle(
                                color: kGreyColor,
                                fontSize: 12.sp,
                                wordSpacing: 1.3),
                          ),
                        ),
                        sizedBoxHeight(10),
                        Center(
                          child: Text(
                            'Create an account now!',
                            style: TextStyle(
                                color: kGreyColor,
                                fontSize: 12.sp,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(86),
                  // sizedBoxHeight(Get.height * 0.1.h -20),
                  sizedBoxHeight(50),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: copyDateWidget(),
    );
  }
}
