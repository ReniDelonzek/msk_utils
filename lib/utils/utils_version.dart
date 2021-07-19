import 'package:msk_utils/extensions/string.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UtilsVersion {
  static Future<int> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber.toInt();
  }

  static Future<Map> getDataVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return {
      'pacote': packageInfo.packageName,
      'numVersion': packageInfo.buildNumber.toInt()
    };
  }
}
