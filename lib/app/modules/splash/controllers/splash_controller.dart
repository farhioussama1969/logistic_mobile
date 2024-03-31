import 'package:get/get.dart';
import 'package:loogisti/app/modules/config_controller.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    await Get.find<ConfigController>().initialize();
    Future.delayed(const Duration(seconds: 2), () {
      //  Get.find<UserController>().initialize();
      Get.toNamed(Routes.SIGN_IN);
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
