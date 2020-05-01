import 'dart:io';
import 'dart:async';

import 'package:device_info/device_info.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter/widgets.dart';

import 'utils_platform.dart';

class UtilsSentry {
  static void configureSentry() {
    FlutterError.onError =
        (FlutterErrorDetails details, {bool forceReport = false}) {
      if (!UtilsPlatform.isRelease() && (!UtilsPlatform.isWindows())) {
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
      final IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return Event(
        release: '1.4',
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
        },
        exception: exception,
        stackTrace: stackTrace,
      );
    }

    /// return Event with Andriod extra information to send it to Sentry
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return Event(
        release: androidDeviceInfo.version.codename,
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
          'version': androidDeviceInfo.version.release,
          'supported32BitAbis': androidDeviceInfo.supported32BitAbis,
          'supported64BitAbis': androidDeviceInfo.supported64BitAbis,
          'supportedAbis': androidDeviceInfo.supportedAbis,
          'isPhysicalDevice': androidDeviceInfo.isPhysicalDevice,
        },
        exception: exception,
        stackTrace: stackTrace,
      );
    }

    /// Return standard Error in case of non-specifed paltform
    ///
    /// if there is no detected platform,
    /// just return a normal event with no extra information
    return Event(
      release: '1.7',
      environment: 'production',
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  static Future<void> reportError(Object error, StackTrace stackTrace,
      {dynamic data}) async {
    if (UtilsPlatform.isDebug() || UtilsPlatform.isWindows()) {
      // In development mode, simply print to console.
      print('No Sending report to sentry.io as mode is debugging DartError');
      // Print the full stacktrace in debug mode.
      print(error);
      print(stackTrace);
      return;
    } else {
      try {
        final SentryClient sentry = new SentryClient(
            dsn: 'https://10d8010b11f8485e9a2d1f4e11b00c1d@sentry.io/2272790');
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
