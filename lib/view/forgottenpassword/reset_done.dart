import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_naverda/view/auth/Login.dart';
import 'package:project_naverda/widget/basic_widget.dart';

class ResetDoneScreen extends StatelessWidget {
  const ResetDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxHeight(72),
            Container(
              padding: symmetricPadding,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHeader('Reset Done'),
                        sizedBoxHeight(12),
                        buildHeaderDes(
                            'Click “Return to login” to get back into your account. Let’s get shopping again!'),
                        sizedBoxHeight(50),
                        buildAuthButton('Return to login',
                            () => Get.offAll(const LoginScreen()))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
