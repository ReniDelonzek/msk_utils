import 'dart:io';
import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter/widgets.dart';

import 'utils_platform.dart';

class UtilsSentry {
  static String dsn =
      'https://4e841b37a9f7415283450cc4157c4ce4@o408228.ingest.sentry.io/5278728';
  static String package;
  static String version;

  /// Inicializa o sentry com alguns dados relevantes, como dsn, o pacote e a versão
  init(String dsn, String package, String version) {
    UtilsSentry.dsn = dsn;
    UtilsSentry.package = package;
    UtilsSentry.version = version;
  }

  static void configureSentry({String dsn}) {
    FlutterError.onError =
        (FlutterErrorDetails details, {bool forceReport = false}) {
      if (UtilsPlatform.isDebug()) {
        // In development mode, simply print to console.
        FlutterError.dumpErrorToConsole(details);
      } else {
        // In production mode, report to the application zone to report to Sentry.
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    };
  }

  static Future<Event> getSentryEnvEvent(
      dynamic exception, dynamic stackTrace) async {
    /// return Event with IOS extra information to send it to Sentry
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return Event(
        release: UtilsSentry.version ?? packageInfo?.version ?? '0.0',
        environment: 'production', // replace it as it's desired
        extra: <String, dynamic>{
          'name': iosDeviceInfo.name,
          'model': iosDeviceInfo.model,
          'systemName': iosDeviceInfo.systemName,
          'systemVersion': iosDeviceInfo.systemVersion,
          'localizedModel': iosDeviceInfo.localizedModel,
          'utsname': iosDeviceInfo.utsname.sysname,
          'identifierForVendor': iosDeviceInfo.identifierForVendor,
          'isPhysicalDevice': iosDeviceInfo.isPhysicalDevice,
          'version': UtilsSentry.version,
          'package': package
        },
        exception: exception,
        stackTrace: stackTrace,
      );
    }

    /// return Event with Andriod extra information to send it to Sentry
    if (Platform.isAndroid) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return Event(
        release: packageInfo?.version ?? androidDeviceInfo.version.codename,
        environment: 'production', // replace it as it's desired
        extra: <String, dynamic>{
          'type': androidDeviceInfo.type,
          'model': androidDeviceInfo.model,
          'device': androidDeviceInfo.device,
          'id': androidDeviceInfo.id,
          'androidId': androidDeviceInfo.androidId,
          'brand': androidDeviceInfo.brand,
          'display': androidDeviceInfo.display,
          'hardware': androidDeviceInfo.hardware,
          'manufacturer': androidDeviceInfo.manufacturer,
          'product': androidDeviceInfo.product,
          'supported32BitAbis': androidDeviceInfo.supported32BitAbis,
          'supported64BitAbis': androidDeviceInfo.supported64BitAbis,
          'supportedAbis': androidDeviceInfo.supportedAbis,
          'isPhysicalDevice': androidDeviceInfo.isPhysicalDevice,
          'package': package,
          'version': UtilsSentry.version ??
              packageInfo?.version ??
              androidDeviceInfo.version.codename
        },
        exception: exception,
        stackTrace: stackTrace,
      );
    }

    return Event(
        release: UtilsSentry.version ?? '0.0',
        environment: 'production',
        exception: exception,
        stackTrace: stackTrace,
        extra: {
          'platform': Platform.operatingSystem,
          'version': UtilsSentry.version,
          'package': package
        });
  }

  static Future<void> reportError(Object error, StackTrace stackTrace,
      {dynamic data, String dsn}) async {
    if (UtilsPlatform.isDebug()) {
      // In development mode, simply print to console.
      // Print the full stacktrace in debug mode.
      print(error);
      print(stackTrace);
      return;
    } else {
      try {
        final SentryClient sentry =
            new SentryClient(dsn: dsn ?? UtilsSentry.dsn);
        // In production mode, report to the application zone to report to Sentry.
        final Event event = await getSentryEnvEvent(error, stackTrace);
        if (event.extra != null) {
          event.extra['json'] = data;
        }
        print('Sending report to sentry.io ${stackTrace.toString()}');
        await sentry.capture(event: event);
      } catch (e) {
        print('Sending report to sentry.io failed: $e');
        print('Original error: $error');
      }
    }
  }
}
