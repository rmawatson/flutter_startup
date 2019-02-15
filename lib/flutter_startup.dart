import 'dart:async';

import 'package:flutter/services.dart';

const _NAMESPACE = 'plugins.rmawatson.com/flutter_startup';

class FlutterStartup {

  static final StartupReasonUser = "User";
  static final iOSStartupReasonAnnotation = "UIApplicationLaunchOptionsAnnotationKey";
  static final iOSStartupReasonBluetoothCentrals = "UIApplicationLaunchOptionsBluetoothCentralsKey";
  static final iOSStartupReasonBluetoothPeripherals = "UIApplicationLaunchOptionsBluetoothPeripheralsKey";
  static final iOSStartupReasonCloudKitShareMetadata = "UIApplicationLaunchOptionsCloudKitShareMetadataKey";
  static final iOSStartupReasonLocalNotification = "UIApplicationLaunchOptionsLocalNotificationKey";
  static final iOSStartupReasonLocation = "UIApplicationLaunchOptionsLocationKey";
  static final iOSStartupReasonNewsstandDownloads = "UIApplicationLaunchOptionsNewsstandDownloadsKey";
  static final iOSStartupReasonRemoteNotification = "UIApplicationLaunchOptionsRemoteNotificationKey";
  static final iOSStartupReasonShortcutItem = "UIApplicationLaunchOptionsShortcutItemKey";
  static final iOSStartupReasonSourceApplication = "UIApplicationLaunchOptionsSourceApplicationKey";
  static final iOSStartupReasonURL = "UIApplicationLaunchOptionsURLKey";
  static final iOSStartupReasonUserActivityDictionary = "UIApplicationLaunchOptionsUserActivityDictionaryKey";
  static final iOSStartupReasonUserActivityType = "UIApplicationLaunchOptionsUserActivityTypeKey";
  static final iOSStartupReasonUser = StartupReasonUser;
  static final AndroidStartupReasonUser = StartupReasonUser;

  static String _startupReason;

  static const MethodChannel _channel =
      const MethodChannel('$_NAMESPACE/methods');

  static Future<String> get startupReason async {

    if (_startupReason == null)
      _startupReason = await _channel.invokeMethod('startupReason');

    return Future<String>.sync(() => _startupReason);
  }

  static Future<bool> get isUserStartup async => await startupReason == StartupReasonUser;
}
