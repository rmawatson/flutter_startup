# flutter_startup

provides access to the iOS startup reasons. The intented application is to control the behavior of the main isolate based on why the app was started. For example, when using `bluetooth-central` background mode, with an active background scan, if the app is killed and there is an event to be handled for the bluetooth 'centralManger' iOS will relauch the app for a limited period of time to handle the event. Using the startup reason the main isolate can do what is needed before the app is killed (about 10 seconds in this case).

# Usage
```
void main() async {
  print("${await FlutterStartup.startupReason}");
}
```
where `startupReason` is one of;

```
StartupReasonUser                      = "User"
iOSStartupReasonAnnotation             = "UIApplicationLaunchOptionsAnnotationKey"            
iOSStartupReasonBluetoothCentrals      = "UIApplicationLaunchOptionsBluetoothCentralsKey"      
iOSStartupReasonBluetoothPeripherals   = "UIApplicationLaunchOptionsBluetoothPeripheralsKey"   
iOSStartupReasonCloudKitShareMetadata  = "UIApplicationLaunchOptionsCloudKitShareMetadataKey" 
iOSStartupReasonLocalNotification      = "UIApplicationLaunchOptionsLocalNotificationKey"      
iOSStartupReasonLocation               = "UIApplicationLaunchOptionsLocationKey"               
iOSStartupReasonNewsstandDownloads     = "UIApplicationLaunchOptionsNewsstandDownloadsKey"     
iOSStartupReasonRemoteNotification     = "UIApplicationLaunchOptionsRemoteNotificationKey"     
iOSStartupReasonShortcutItem           = "UIApplicationLaunchOptionsShortcutItemKey"           
iOSStartupReasonSourceApplication      = "UIApplicationLaunchOptionsSourceApplicationKey"      
iOSStartupReasonURL                    = "UIApplicationLaunchOptionsURLKey"                 
iOSStartupReasonUserActivityDictionary = "UIApplicationLaunchOptionsUserActivityDictionaryKey"
iOSStartupReasonUserActivityType       = "UIApplicationLaunchOptionsUserActivityTypeKey"   
iOSStartupReasonUser                   = StartupReasonUser    
AndroidStartupReasonUser               = StartupReasonUser
```
