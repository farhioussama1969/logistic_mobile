import 'dart:io';

import 'package:get/get.dart';
import 'package:loogisti/app/modules/config_controller.dart';

class NewUpdateController extends GetxController {
  String currentVersion = Get.find<ConfigController>().appVersion ?? '';
  String lastRequiredVersion = Platform.isAndroid
      ? Get.find<ConfigController>().generalSettingsData?.androidAppVersion?.required ?? ''
      : Get.find<ConfigController>().generalSettingsData?.iosAppVersion?.required ?? '';
  String lastOptionalAppVersion = Platform.isAndroid
      ? Get.find<ConfigController>().generalSettingsData?.androidAppVersion?.optional ?? ''
      : Get.find<ConfigController>().generalSettingsData?.iosAppVersion?.optional ?? '';

  @override
  void onInit() {
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
