import 'package:flutter/material.dart';

import '../../styles/color.dart';
import '../../widget/basic_widget.dart';

class EnterNewPasswordScreen extends StatelessWidget {
  const EnterNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            buildHeader('Forgot Password?'),
                            sizedBoxHeight(12),
                          ],
                        ),
                      ),
                      sizedBoxHeight(50),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: kGreyColor),
                        decoration: buildInputDecorationII('Password'),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: kGreyColor),
                        decoration: buildInputDecorationII('Confirm Password'),
                      ),
                      sizedBoxHeight(30),
                      buildAuthButton(
                        'Reset',
                        () => null,
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
