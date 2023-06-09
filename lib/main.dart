import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_naverda/Api_Services/login_api_services.dart';
import 'package:project_naverda/Api_Services/register_api_services.dart';
import 'package:project_naverda/models/user_token_model.dart';
import 'package:project_naverda/routes/routes.dart';
import 'package:project_naverda/styles/color.dart';
import 'package:project_naverda/view/auth/Login.dart';
import 'package:project_naverda/view/onboarding/walkthrough.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService('', '', UserToken(token: ''))),
        ChangeNotifierProvider(create: (_) => SignUpState('','','', UserToken(token: ''))),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: kBgColor,
              primarySwatch: Colors.grey,
            ),
            initialRoute: AppRoute.initialPage,
            getPages: AppRoute.routes,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
