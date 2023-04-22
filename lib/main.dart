import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_naverda/styles/color.dart';
import 'package:project_naverda/view/onboarding/walkthrough.dart';

import 'controller/walhthrough_controller.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _controller = Get.put(WalkthroughController());

  MyApp({super.key});

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
          home: Obx(() {
            if (_controller.isFirstTime) {
              return WalkthroughScreen();
            } else {
              return Container();
            }
          }),
        );
      },
    );
  }
}
