#import "FlutterStartupPlugin.h"



static NSString* startupReason;

@implementation FlutterStartupPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:NAMESPACE @"/methods"
            binaryMessenger:[registrar messenger]];
  FlutterStartupPlugin* instance = [[FlutterStartupPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
  [registrar addApplicationDelegate: instance];
}

+ (void)load
{  [[NSNotificationCenter defaultCenter]
      addObserverForName:UIApplicationDidFinishLaunchingNotification
                  object:[UIApplication sharedApplication]
                   queue:nil
              usingBlock:^(NSNotification *note) {
                  NSDictionary* launchOptions = [note userInfo];
                  NSLog(@"%d",[launchOptions count]);
                  if(![launchOptions count])  startupReason = @"User";
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsAnnotationKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsBluetoothCentralsKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsBluetoothPeripheralsKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsCloudKitShareMetadataKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsLocationKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsNewsstandDownloadsKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsSourceApplicationKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsUserActivityDictionaryKey]) != nil){}
                  else if((startupReason = [launchOptions objectForKey:UIApplicationLaunchOptionsUserActivityTypeKey]) != nil){}
              }];
}

- (BOOL)application:(UIApplication*)application
didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
  NSString *reason = nil;


  return(YES);
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"startupReason" isEqualToString:call.method]) {
    result(startupReason);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
