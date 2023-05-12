import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_naverda/Api_Services/register_api_services.dart';
import 'package:project_naverda/controller/signup_controller.dart';
import 'package:provider/provider.dart';

import '../../styles/color.dart';
import '../../widget/basic_widget.dart';
import 'Login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: backButton(),
                  ),
                  Container(
                    padding: symmetricPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxHeight(49),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10).w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.6),
                                  ),
                                  Text(
                                    '  to access Rhobuy!',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: kGreyColor,
                                        height: 1.6),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        sizedBoxHeight(50),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(color: kGreyColor),
                          decoration: buildInputDecoration('Name'),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Enter name';
                            } else if (text!.length < 3) {
                              return 'Name entered is less than 3';
                            }
                          },
                        ),
                        sizedBoxHeight(20),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: kGreyColor),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Enter an email';
                            } else if (text!.isEmail == false) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          decoration: buildInputDecoration('Email address'),
                        ),
                        sizedBoxHeight(20),
                        Obx(() {
                          return TextFormField(
                            controller: passwordController,
                            obscureText: controller.passwordObscureText.value,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(color: kGreyColor),
                            decoration: buildInputDecorationII('Password'),
                            validator: (text) {
                              if (text!.length <= 8) {
                                return 'password isn\'t strong enough';
                              } else if (text!.contains(RegExp(r'[A-Z]'))) {
                                return 'Password should contain at least one uppercase letter';
                              }
                              return null;
                            },
                          );
                        }),
                        // okoriec01@gmail.com
                        sizedBoxHeight(20),
                        Obx(() {
                          return TextFormField(
                            obscureText:
                                controller.confirmPasswordObscureText.value,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(color: kGreyColor),
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            decoration:
                                buildInputDecorationII('Confirm password'),
                          );
                        }),
                        sizedBoxHeight(10),
                        Container(
                            width: 290.w,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        sizedBoxHeight(40),
                        Consumer<SignUpState>(
                          builder: (context, signUpState, child) =>
                              buildAuthButton('Sign up', () async {
                            if (formKey.currentState!.validate()) {
                              signUpState.name = nameController.text;
                              signUpState.email = emailController.text;
                              signUpState.password = passwordController.text;
                              await signUpState.signUp();
                            }
                          }, signUpState.isLoading),
                        ),
                        sizedBoxHeight(20),
                        buildGoogle(() {}),
                        sizedBoxHeight(20),
                        const Center(
                          child: Text(
                            'Already have an account? ',
                            style: TextStyle(color: kGreyColor),
                          ),
                        ),
                        sizedBoxHeight(10),
                        Center(
                          child: InkWell(
                              onTap: () => Get.offAll(const LoginScreen()),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: kGreyColor,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        sizedBoxHeight(Get.height * 0.1 - 20),
                        copyDateWidget(),
                        sizedBoxHeight(20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
