import 'package:get/get.dart';
import 'package:loogisti/app/core/constants/get_builders_ids_constants.dart';
import 'package:loogisti/app/core/services/app_version_info_service.dart';
import 'package:loogisti/app/core/utils/translation_util.dart';
import 'package:loogisti/app/data/models/general_settings_model.dart';
import 'package:loogisti/app/data/providers/taxili_api/config_provider.dart';

class ConfigController extends GetxController {
  String? appVersion;

  Future<void> getPackageVersion() async {
    appVersion = await AppVersionInfoService.getAppVersion();
    update([GetBuildersIdsConstants.splashVersionText]);
  }

  GeneralSettingsModel? generalSettingsData;

  Future<void> getGeneralSettingsData() async {
    await ConfigProvider().generalSettings(onLoading: () {}, onFinal: () {}).then((value) {
      if (value != null) {
        generalSettingsData = value;
      }
    });
  }

  initialize() async {
    await getPackageVersion();
    await getGeneralSettingsData();
  }

  String selectedAppLang = Get.locale?.languageCode ?? 'ar';

  bool saveAppLangLoading = false;

  void changeSaveAppLangLoading(bool loading) {
    saveAppLangLoading = loading;
    update([GetBuildersIdsConstants.profileAppLangWindowButton]);
  }

  void changeSelectedAppLang(String lang) {
    selectedAppLang = lang;
    update([GetBuildersIdsConstants.profileAppLangWindowList]);
  }

  void saveAppLang() {
    TranslationUtil.changeLang(lang: selectedAppLang);
    //AuthProvider().updateProfile(onLoading: () {}, onFinal: () {});
    // Get.find<HomeController>().refreshHome();
    Get.back();
  }
}
