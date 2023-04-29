import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_naverda/styles/color.dart';
import 'package:project_naverda/styles/constants.dart';
import 'package:project_naverda/widget/basic_widget.dart';

import '../../widget/countdown.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen>
    with SingleTickerProviderStateMixin {
  final int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
                child: CountdownProgressBar(
                  durationSeconds: 10,
                  index: _currentPageIndex,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 40.spMax, left: 20.spMax, right: 20.spMax),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop inspired,\ncreate magic.',
                      style:
                          TextStyle(fontSize: 34.sp, fontFamily: fontFamily,fontWeight: FontWeight.w600,height: 1.3),
                    ),
                    sizedBoxHeight(18),

                    Text(
                      'We believe that shopping is about more than just buying things - '
                      'it should be about discovering new parts of yourself and '
                      'expressing your innermost desires.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.5,
                          // wordSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor),
                    ),
                    sizedBoxHeight(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            walkthroughPills(
                                const Color.fromRGBO(65, 148, 244, 0.2),'pill_one.png'),
                            sizedBoxHeight(20),
                            walkthroughCircle(
                                kBgBlueColor, Iconsax.clock)
                          ],
                        ),
                        Column(
                          children: [
                            walkthroughCircle(
                                darkGreyColor, Iconsax.bag_24),
                            sizedBoxHeight(20),
                            walkthroughPills(const Color.fromRGBO(0, 0, 0, 0.1),'pill_two.png'),
                          ],
                        ),
                        Column(
                          children: [
                            walkthroughPills(
                                const Color.fromRGBO(106, 215, 187, 0.2),'pill_three.png'),
                            sizedBoxHeight(20),
                            walkthroughCircle(
                                 const Color(0xff6AD7BB), Iconsax.search_normal_1)
                          ],
                        ),
                      ],
                    ),

                    sizedBoxHeight(28),

                    copyDateWidget(),
                    sizedBoxHeight(30)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
