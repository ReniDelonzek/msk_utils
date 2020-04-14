import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:msk_utils/utils/utils_sentry.dart';
import 'package:path_provider/path_provider.dart';

import 'utils_platform.dart';

class UtilsHive {
  static UtilsHive _instance;
  Completer<bool> completer = Completer();
  List<TypeAdapter> adapters;

  factory UtilsHive(List<TypeAdapter> adapters) {
    _instance ??= UtilsHive._internalConstructor(adapters);
    return _instance;
  }
  UtilsHive._internalConstructor(this.adapters);

  static UtilsHive getInstance() {
    return _instance;
  }

  initHive({String path}) async {
    if (!completer.isCompleted) {
      if (path != null) {
        Hive.init(path);
      } else {
        if (UtilsPlatform.isDesktop()) {
          Hive.init(Directory.current.path);
        } else {
          var dir = await getApplicationDocumentsDirectory();
          Hive.init(dir.path);
        }
        try {
          adapters.forEach((element) {
            Hive.registerAdapter(element);
          });
        } catch (e) {
          print(e);
        }
        completer.complete(true);
      }
    }
    return true;
  }

  Future<Box> getBox(String name) async {
    if (!completer.isCompleted) {
      await completer.future;
    }
    try {
      return (Hive.isBoxOpen(name) ? Hive.box(name) : await Hive.openBox(name));
    } catch (error, stackTrace) {
      UtilsSentry.reportError(error, stackTrace);
      await Hive.deleteBoxFromDisk(name);
      return (Hive.isBoxOpen(name) ? Hive.box(name) : await Hive.openBox(name));
    }
  }
}
