import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_naverda/view/forgottenpassword/reset_done.dart';

import '../../controller/signup_controller.dart';
import '../../styles/color.dart';
import '../../widget/basic_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

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
                            buildHeader('Reset your password'),
                          ],
                        ),
                      ),
                      sizedBoxHeight(30),
                      TextFormField(
                        obscureText: controller.passwordObscureText.value,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(color: kGreyColor),
                        decoration: buildInputDecorationII('Password'),
                      ),
                      sizedBoxHeight(20),
                      TextFormField(
                        obscureText: controller.passwordObscureText.value,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(color: kGreyColor),
                        decoration: buildInputDecorationII('Confirm Password'),
                      ),
                      sizedBoxHeight(40),
                      buildAuthButton(
                        'Reset',
                        () => Get.to(
                          const ResetDoneScreen(),
                        ),
                        false,
                      ),
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
