# flutter_startup

Provides access to the iOS startup reasons. The intented application is to control the behavior of the main isolate based on why the app was started. For example, when using `bluetooth-central` background mode, with an active background scan, if the app is killed and there is an event to be handled for the bluetooth `centralManger`, iOS will relauch the app for a limited period of time to handle the event. 

Using the startup reason the main isolate can branch on the startup reason to perform some other task before the application is killed. (about 10 seconds in this case).

# Usage
```
void main() async {
  print("${await FlutterStartup.startupReason}");
}
```
where `startupReason` is one of;

```
FlutterStartup.StartupReasonUser                      = "User"
FlutterStartup.iOSStartupReasonAnnotation             = "UIApplicationLaunchOptionsAnnotationKey"            
FlutterStartup.iOSStartupReasonBluetoothCentrals      = "UIApplicationLaunchOptionsBluetoothCentralsKey"      
FlutterStartup.iOSStartupReasonBluetoothPeripherals   = "UIApplicationLaunchOptionsBluetoothPeripheralsKey"   
FlutterStartup.iOSStartupReasonCloudKitShareMetadata  = "UIApplicationLaunchOptionsCloudKitShareMetadataKey" 
FlutterStartup.iOSStartupReasonLocalNotification      = "UIApplicationLaunchOptionsLocalNotificationKey"      
FlutterStartup.iOSStartupReasonLocation               = "UIApplicationLaunchOptionsLocationKey"               
FlutterStartup.iOSStartupReasonNewsstandDownloads     = "UIApplicationLaunchOptionsNewsstandDownloadsKey"     
FlutterStartup.iOSStartupReasonRemoteNotification     = "UIApplicationLaunchOptionsRemoteNotificationKey"     
FlutterStartup.iOSStartupReasonShortcutItem           = "UIApplicationLaunchOptionsShortcutItemKey"           
FlutterStartup.iOSStartupReasonSourceApplication      = "UIApplicationLaunchOptionsSourceApplicationKey"      
FlutterStartup.iOSStartupReasonURL                    = "UIApplicationLaunchOptionsURLKey"                 
FlutterStartup.iOSStartupReasonUserActivityDictionary = "UIApplicationLaunchOptionsUserActivityDictionaryKey"
FlutterStartup.iOSStartupReasonUserActivityType       = "UIApplicationLaunchOptionsUserActivityTypeKey"   
FlutterStartup.iOSStartupReasonUser                   = StartupReasonUser    
FlutterStartup.AndroidStartupReasonUser               = StartupReasonUser
```
