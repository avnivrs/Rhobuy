import 'package:get/get.dart';
import 'package:project_naverda/view/auth/Login.dart';
import 'package:project_naverda/view/auth/emailverify.dart';
import 'package:project_naverda/view/auth/signup.dart';
import 'package:project_naverda/view/forgottenpassword/reset_done.dart';
import 'package:project_naverda/view/forgottenpassword/rest_your_password.dart';
import 'package:project_naverda/view/onboarding/walkthrough.dart';

class RoutesController extends GetxController {
  static const String initialPage = '/';
  static const String loginPage = '/login';
  static const String signUpPage = '/signup';
  static const String emailVerifyPage = '/emailVerify';
  static const String resetPasswordPage = '/resetPassword';
  static const String resetDonePage = '/restDone';

  static final routes = [
    GetPage(name: initialPage, page: () => const WalkthroughScreen()),
    GetPage(name: loginPage, page: () => const LoginScreen()),
    GetPage(name: signUpPage, page: () => const SignupScreen()),
    GetPage(name: emailVerifyPage, page: () => const EmailVerificationScreen()),
    GetPage(name: resetPasswordPage, page: () => const ResetPasswordScreen()),
    GetPage(name: resetDonePage, page: () => const ResetDoneScreen()),
  ];
}
// https://avniverse-accounts.fly.dev/graphql
