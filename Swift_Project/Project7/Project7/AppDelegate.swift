//
//  AppDelegate.swift
//  Project7
//
//  Created by Geunhye Yu on 2023/03/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate{

    // it is called when the app has finished loading and is ready to use
    //hijack it to insert a second ViewController into our tab bar
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // here is the code is supposed to be but "window:UIWindow?" is moved in SceneDelegate
        //So I put the code in the SceneDelegate. but here is where the tutorial says
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

