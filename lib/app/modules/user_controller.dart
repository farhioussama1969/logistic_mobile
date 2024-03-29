import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/app_version_info_service.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/user_model.dart';
import 'package:loogisti/app/modules/config_controller.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class UserController extends GetxController {
  UserModel? user;

  initialize({bool? skipLocalAuth, bool? skipUpdateChecker}) async {
    String currentAppVersion = Get.find<ConfigController>().appVersion!;
  }

  Future<void> setUser(UserModel user) async {
    this.user = user;
    update([GetBuildersIdsConstants.userInfosComponents]);
    await LocalStorageService.saveData(
      key: StorageKeysConstants.userData,
      value: jsonEncode(user.toJson()),
      type: DataTypes.string,
    );
    log('User data: ${this.user?.toJson()}');
    if (user.status == 'Banned') {
      return;
    }
  }

  void refreshUserData() {}

  Future<void> clearUser() async {
    await LocalStorageService.deleteData(key: StorageKeysConstants.userData);
    await LocalStorageService.deleteData(
        key: StorageKeysConstants.taxiliApiToken);
    await LocalStorageService.deleteData(key: StorageKeysConstants.fcmToken);
    await LocalStorageService.deleteData(key: StorageKeysConstants.localAuth);
    await LocalStorageService.deleteData(
        key: StorageKeysConstants.localAuthAsk);
  }
}
