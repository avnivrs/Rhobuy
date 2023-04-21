import 'package:get/get.dart';

class SignUpController extends GetxController {
  var passwordObscureText = true.obs;
  var confirmPasswordObscureText = true.obs;
  var checkedBool = false.obs;

  void toggleChecked() {
    checkedBool.toggle();
  }

  void toggleObscureText() {
    passwordObscureText.toggle();
  }

  void toggleConfirmObscureText() {
    confirmPasswordObscureText.toggle();
  }
}
