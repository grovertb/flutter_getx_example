import 'package:flutter_example/pages/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.off(
        () => HomePage(),
        transition: Transition.zoom,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
    print("SplashController: onClose");
  }
}
