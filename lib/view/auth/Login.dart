import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/controller/login_controller.dart';
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
                  sizedBoxHeight(80),
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
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const Text(
                        ' account!',
                        style: TextStyle(fontSize: 15, color: kGreyColor),
                      ),
                    ],
                  ),
                  sizedBoxHeight(60),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kGreyColor),
                    decoration: buildInputDecoration('Email address'),
                  ),
                  sizedBoxHeight(30),
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
                  buildGoogle((){}),
                  sizedBoxHeight(40),
                   Center(
                    child: Text(
                      'Don’t have an account yet? ',
                      style: TextStyle(color: kGreyColor,fontSize: 14.sp),
                    ),
                  ),
                  sizedBoxHeight(20),
                  Center(
                    child: InkWell(
                        onTap: () => Get.to(const SignupScreen()),
                        child:  Text(
                          'Create an account now!',
                          style: TextStyle(
                              color: kGreyColor,fontSize: 11.sp,fontWeight: FontWeight.w600),
                        )),
                  ),
                  sizedBoxHeight(Get.height * 0.1.h+30.h),
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
