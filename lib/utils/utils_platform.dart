import 'dart:io' show Platform, Process, ProcessResult;

import 'package:flutter/foundation.dart' as Foundation;
import 'package:msk_utils/utils/utils_sentry.dart';

class UtilsPlatform {
  static bool isDebug() {
    return Foundation.kDebugMode;
  }

  static bool isRelease() {
    return Foundation.kReleaseMode;
  }

  static bool isProfile() {
    return Foundation.kProfileMode;
  }

  static isMobile() {
    return (!Foundation.kIsWeb && (Platform.isAndroid || Platform.isIOS));
  }

  static isWeb() {
    return (Foundation.kIsWeb);
  }

  static isDesktop() {
    return (!Foundation.kIsWeb &&
        (Platform.isWindows || Platform.isMacOS || Platform.isLinux));
  }

  static isWindows() {
    return (!Foundation.kIsWeb && Platform.isWindows);
  }

  static isAndroid() {
    return (!Foundation.kIsWeb && Platform.isAndroid);
  }

  static isIOS() {
    return (!Foundation.kIsWeb && Platform.isIOS);
  }

  static Future<ProcessResult> openProcess(String command,
      {List<String> args, bool runInShell = true}) async {
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
