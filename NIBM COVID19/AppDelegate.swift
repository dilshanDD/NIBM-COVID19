//
//  AppDelegate.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 8/29/20.
//  Copyright © 2020 NIBM. All rights reserved.
//
import FirebaseCore
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: homeViewController())
        return true
    }

}

