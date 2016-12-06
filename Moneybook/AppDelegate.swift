//
//  AppDelegate.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 9..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    /*
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Register for remote notifications
        if #available(iOS 8.0, *) {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        } else {
            // Fallback
            let types: UIRemoteNotificationType = [.Alert, .Badge, .Sound]
            application.registerForRemoteNotificationTypes(types)
        }
        
        FIRApp.configure()
        
        // Add observer for InstanceID token refresh callback.
        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotificaiton),
                                                         name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
        
        return true
    }
    
    // [START receive_message]
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject],
                     fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // Print message ID.
        print("Message ID: \(userInfo["gcm.message_id"]!)")
        
        // Print full message.
        print("%@", userInfo)
    }
    // [END receive_message]
    
    // [START refresh_token]
    func tokenRefreshNotificaiton(notification: NSNotification) {
        let refreshedToken = FIRInstanceID.instanceID().token()!
        print("InstanceID token: \(refreshedToken)")
        
        // Connect to FCM since connection may have failed when attempted before having a token.
        connectToFcm()
    }
    // [END refresh_token]
    
    // [START connect_to_fcm]
    func connectToFcm() {
        FIRMessaging.messaging().connectWithCompletion { (error) in
            if (error != nil) {
                print("Unable to connect with FCM. \(error)")
            } else {
                print("Connected to FCM.")
            }
        }
    }
    // [END connect_to_fcm]
    
    func applicationDidBecomeActive(application: UIApplication) {
        connectToFcm()
    }
    
    // [START disconnect_from_fcm]
    func applicationDidEnterBackground(application: UIApplication) {
        FIRMessaging.messaging().disconnect()
        print("Disconnected from FCM.")
    }
    // [END disconnect_from_fcm]

*/


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //create the notificationCenter
        let center  = UNUserNotificationCenter.current()
        center.delegate = self
        // set the type as sound or badge
        center.requestAuthorization(options: [.sound,.alert,.badge]) { (granted, error) in
            // Enable or disable features based on authorization
            
        }
        FIRMessaging.messaging().remoteMessageDelegate = self

        

        
        FIRApp.configure()
  /*
        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotificaiton),
                                               name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
    */
        application.registerForRemoteNotifications()
        return true
        
    }

/*
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    

     func applicationWillEnterForeground(_ application: UIApplication) {
     // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
     }
    

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
 
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        FIRInstanceID.instanceID().setAPNSToken(deviceToken as Data, type: FIRInstanceIDAPNSTokenType.unknown)
        //let refreshedToken = FIRInstanceID.instanceID().token()!
        //print("refreshed token : \(refreshedToken)")
        
        print( "노티피케이션 등록을 성공함, 디바이스 토큰 : \(deviceTokenString)" )
        
    }
    */
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print( "노티피케이션 APNS 등록 중 에러 발생 :  \(error.localizedDescription)" )
    }
 
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        //FIRInstanceID.instanceID().setAPNSToken(deviceToken as Data, type: FIRInstanceIDAPNSTokenType.prod)
        //let refreshedToken = FIRInstanceID.instanceID().token()!
        //print("refreshed token : \(refreshedToken)")
        
        print( "노티피케이션 등록을 성공함, 디바이스 토큰 : \(deviceTokenString)" )
        
    }
    
    /*
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any])
    {
        
        print("Message ID: \(userInfo["gcm.message_id"]!)")
        print("노티피케이션을 받았습니다. :\(userInfo)")
    }
    */
    func tokenRefreshNotificaiton(notification: NSNotification) {
        //let refreshedToken = FIRInstanceID.instanceID().token()!
        //print("인스턴스 아이디토큰 : \(refreshedToken)")
        
        // Connect to FCM since connection may have failed when attempted before having a token.
        connectToFCM()
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,  willPresent notification: UNNotification, withCompletionHandler   completionHandler: @escaping (_ options:   UNNotificationPresentationOptions) -> Void) {
        print("Handle push from foreground")
        // custom code to handle push while app is in the foreground
        print("\(notification.request.content.userInfo)")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Handle push from background or closed")
        // if you set a member variable in didReceiveRemoteNotification, you  will know if this is from closed or background
        print("\(response.notification.request.content.userInfo)")
    }
    
    
    func connectToFCM() {
        FIRMessaging.messaging().connect { (error) in
            if(error != nil) {
                print("Cannot connected FCM")
                print(error.debugDescription)
                print(error!)
            } else {
                print("connected to FCM")
                
            }
        }
    }

    
    /*
    func applicationDidBecomeActive(_ application: UIApplication) {
        connectToFCM()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        FIRMessaging.messaging().disconnect()
        print("Disconnected from FCM.")
    }
 */
}

extension AppDelegate : FIRMessagingDelegate {
    // Receive data message on iOS 10 devices.
    func applicationReceivedRemoteMessage(_ remoteMessage: FIRMessagingRemoteMessage) {
        print("%@", remoteMessage.appData)
    }
}

