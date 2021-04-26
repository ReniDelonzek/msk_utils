import 'package:msk_utils/utils/utils_platform.dart';
import 'package:package_info/package_info.dart';
import 'package:msk_utils/extensions/string.dart';

class UtilsVersion {
  static const VERSION = 9;

  static Future<int> getVersion() async {
    if (UtilsPlatform.isMobile) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.buildNumber.toInt();
    }
    return UtilsVersion.VERSION;
  }

  static Future<Map> getDataVersion() async {
    if (UtilsPlatform.isMobile) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return {
        'pacote': packageInfo.packageName,
        'numVersion': packageInfo.buildNumber.toInt()
      };
    }
    return {};
  }
}
