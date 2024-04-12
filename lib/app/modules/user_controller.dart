import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:loogisti/app/core/components/pop_ups/bottom_sheet_component.dart';
import 'package:loogisti/app/core/constants/firebase_messaging_tobics_constants.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/constants/storage_keys_constants.dart';
import 'package:loogisti/app/core/services/app_version_info_service.dart';
import 'package:loogisti/app/core/services/local_storage_service.dart';
import 'package:loogisti/app/data/models/user_model.dart';
import 'package:loogisti/app/modules/config_controller.dart';
import 'package:loogisti/app/routes/app_pages.dart';

class UserController extends GetxController {
  UserModel? user;

  initialize({bool? skipUpdateChecker}) async {
    String currentAppVersion = Get.find<ConfigController>().appVersion ?? '1.0.0';
    String lastRequiredAppVersion = Platform.isAndroid
        ? Get.find<ConfigController>().generalSettingsData?.androidAppVersion?.required ?? '1.0.0'
        : Get.find<ConfigController>().generalSettingsData?.iosAppVersion?.required ?? '1.0.0';
    String lastOptionalAppVersion = Platform.isAndroid
        ? Get.find<ConfigController>().generalSettingsData?.androidAppVersion?.optional ?? '1.0.0'
        : Get.find<ConfigController>().generalSettingsData?.iosAppVersion?.optional ?? '1.0.0';
    if ((AppVersionInfoService.getExtendedVersionNumber(currentAppVersion) <
                AppVersionInfoService.getExtendedVersionNumber(lastRequiredAppVersion) ||
            AppVersionInfoService.getExtendedVersionNumber(currentAppVersion) <
                AppVersionInfoService.getExtendedVersionNumber(lastOptionalAppVersion)) &&
        skipUpdateChecker != true) {
      Get.offAllNamed(Routes.NEW_UPDATE);
    } else {
      if (await LocalStorageService.loadData(key: StorageKeysConstants.serverApiToken, type: DataTypes.string) != null) {
        log(await LocalStorageService.loadData(key: StorageKeysConstants.serverApiToken, type: DataTypes.string));
        // await AuthProvider().getUserData().then((user) {
        //   if (user != null) {
        //     setUser(user);
        //     if (user.status == 'Banned') return;
        //     Get.offAllNamed(Routes.HOME);
        //   }
        // });
      } else {
        //Get.offAllNamed(Routes.GET_STARTED);
      }
    }
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
      Get.offAllNamed(Routes.BANNED);
      return;
    }
  }

  void refreshUserData() {
    // AuthProvider().getUserData(onLoading: () {}, onFinal: () {}).then((user) {
    //   if (user != null) {
    //     setUser(user);
    //   }
    // });
  }

  bool logoutLoading = false;
  void changeLogoutLoading(bool value) {
    logoutLoading = value;
    update([GetBuildersIdsConstants.logoutConfirmationWindow]);
  }

  Future<void> clearUser({bool? withoutLogout}) async {
    if (withoutLogout != true) {
      // await AuthProvider().logout(
      //   onLoading: () => changeLogoutLoading(true),
      //   onFinal: () => changeLogoutLoading(false),
      // );
    }
    await LocalStorageService.deleteData(key: StorageKeysConstants.userData);
    await LocalStorageService.deleteData(key: StorageKeysConstants.serverApiToken);
    await LocalStorageService.deleteData(key: StorageKeysConstants.fcmToken);
    FirebaseMessaging.instance.unsubscribeFromTopic(FirebaseMessagingTobicsConstants.clientsRegistered);

    await FirebaseMessaging.instance.deleteToken();
    user = null;
    FirebaseMessaging.instance.getToken().then((token) async {
      LocalStorageService.saveData(key: StorageKeysConstants.fcmToken, type: DataTypes.string, value: token);
      FirebaseMessaging.instance.subscribeToTopic(FirebaseMessagingTobicsConstants.clientsNotRegistered);
      FirebaseMessaging.instance.subscribeToTopic(FirebaseMessagingTobicsConstants.allClients);
    });
  }
}
