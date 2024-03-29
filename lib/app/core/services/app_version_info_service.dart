import 'package:package_info_plus/package_info_plus.dart';

class AppVersionInfoService {
  static Future<String?> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String?> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  static int getExtendedVersionNumber(String version) {
    if (version == "") return 0;
    List versionCells = version.split('.');
    print("versionCells: $versionCells");
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}
