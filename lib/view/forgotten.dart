import 'package:flutter/material.dart';
import 'package:project_naverda/widget/basic_widget.dart';

import '../styles/color.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: symmetricPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              sizedBoxHeight(50),
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
              buildAuthButton('Login', () {}),

            ],
          ),
        ),
      ),
    );
  }
}
