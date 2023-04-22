import 'package:get/get.dart';

import '../serivces/hiveservices.dart';

class WalkthroughController extends GetxController {
  final _isFirstTime = true.obs;

  bool get isFirstTime => _isFirstTime.value;

  @override
  void onInit() {
    _loadIsFirstTime();
    super.onInit();
  }

  Future<void> _loadIsFirstTime() async {
    final box = await HiveService.openBox();
    _isFirstTime.value = box.get('isFirstTime', defaultValue: true)!;
  }

  Future<void> markAsNotFirstTime() async {
    final box = await HiveService.openBox();
    await box.put('isFirstTime', false);
    _isFirstTime.value = false;
  }
}
