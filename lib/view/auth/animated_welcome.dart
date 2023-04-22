import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_naverda/styles/color.dart';
import 'package:project_naverda/widget/basic_widget.dart';

class AnimatedWelcomeScreen extends StatelessWidget {
  const AnimatedWelcomeScreen({Key? key}) : super(key: key);

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
              sizedBoxHeight(80),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello, [user’s name]\n \n'
                    'I am Nick - Avniverse AI. I will be your personal shopping assistant. '
                    'Together we are on a mission to get your perfect piece.'
                    "Share your product need with me:"
                    " {I lost my mum's favorite high-quality silver bracelet with a rose gold"
                    " heart charm and cubic zirconia stones, and I need to replace it to make it "
                    "up to her.Can you help get exactly this?}, and I'll search multiple sources to find the best matches. ",
                    textAlign: TextAlign.justify,
                    textStyle: TextStyle(
                      letterSpacing: 1.2.sp,
                      height: 1.5.sp,
                      fontSize: 14.0.sp,
                      color: kGreyColor,
                      fontWeight: FontWeight.w600,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 0),
                displayFullTextOnTap: false,
                stopPauseOnTap: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
