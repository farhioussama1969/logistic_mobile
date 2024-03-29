import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/storage_keys_constants.dart';
import '../services/local_storage_service.dart';

class TranslationUtil {
  static Locale? currentLang = const Locale('en');

  static void changeLang({required String lang}) {
    LocalStorageService.saveData(
        key: StorageKeysConstants.localeLang,
        value: lang,
        type: DataTypes.string);
    Get.updateLocale(Locale(lang));
    currentLang = Locale(lang);
  }

  static Future<void> initialize() async {
    if (await LocalStorageService.loadData(
            key: StorageKeysConstants.localeLang, type: DataTypes.string) !=
        null) {
      currentLang = Locale(await LocalStorageService.loadData(
          key: StorageKeysConstants.localeLang, type: DataTypes.string));
    }
  }
}
