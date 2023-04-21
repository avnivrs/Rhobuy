import 'package:flutter/material.dart';
import 'package:project_naverda/styles/color.dart';
import 'package:project_naverda/view/walkthrough.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 987),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat-Regular',
            scaffoldBackgroundColor: kBgColor,
            primarySwatch: Colors.grey,
          ),
          home:  const WalkthroughScreen(),
        );
      },
    );
  }
}