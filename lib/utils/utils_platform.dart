import 'dart:io' show Platform, Process, ProcessResult;

import 'package:flutter/foundation.dart' as Foundation;
import 'package:msk_utils/utils/utils_sentry.dart';

class UtilsPlatform {
  static const bool isDebug = Foundation.kDebugMode;
  static const bool isProfile = Foundation.kProfileMode;
  static const bool isRelease = Foundation.kReleaseMode;

  static bool isMobile =
      !Foundation.kIsWeb && (Platform.isAndroid || Platform.isIOS);
  static const bool isWeb = Foundation.kIsWeb;
  static bool isDesktop = !Foundation.kIsWeb &&
      (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  static bool isWindows = !Foundation.kIsWeb && Platform.isWindows;
  static bool isMacos = !Foundation.kIsWeb && Platform.isMacOS;
  static bool isLinux = !Foundation.kIsWeb && Platform.isLinux;
  static bool isAndroid = !Foundation.kIsWeb && Platform.isAndroid;
  static bool isIOS = !Foundation.kIsWeb && Platform.isIOS;

  static Future<ProcessResult?> openProcess(String command,
      {List<String>? args, bool runInShell = true}) async {
    try {
      if (args != null) {
        return await Process.run(command, args, runInShell: runInShell);
      } else {
        return await Process.run(command, [], runInShell: runInShell);
      }
    } catch (error, stackTrace) {
      UtilsSentry.reportError(error, stackTrace);
      return null;
    }
  }
}
