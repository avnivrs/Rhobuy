import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_naverda/styles/color.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
              child: CountdownProgressBar(
                durationSeconds: 10,
                index: _currentPageIndex,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 40.spMax, left: 20.spMax, right: 20.spMax),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CountdownProgressBar(durationSeconds: 60)60
                    Text(
                      'Shop inspired,\ncreate magic.',
                      style:
                          TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w600),
                    ),
                    sizedBoxHeight(10),

                    Text(
                      'We believe that shopping is about more than just buying things - '
                      'it should be about discovering new parts of yourself and '
                      'expressing your innermost desires.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: kGreyColor),
                    ),
                    sizedBoxHeight(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            walkthroughPills(
                                const Color.fromRGBO(65, 148, 244, 0.2),'pill_one.png'),
                            sizedBoxHeight(20),
                            walkthroughCircle(
                                kBgBlueColor, Icons.access_time_outlined)
                          ],
                        ),
                        Column(
                          children: [
                            walkthroughCircle(
                                darkGreyColor, LineIcons.shoppingBag),
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
                                const Color(0xff6AD7BB), Icons.search)
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),

                    copyDateWidget(),
                    sizedBoxHeight(40)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
