//
//  AppDelegate.swift
//  Examples
//
//  Created by Alex Anderson on 2/4/17.
//  Copyright © 2017 Alex Anderson. All rights reserved.
// hey really

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var _light: UIImageView? = nil
    private var _lightSwitch: UISwitch? = nil


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = LightController()
        window?.rootViewController?.view.backgroundColor = UIColor.cyan
        window?.makeKeyAndVisible()
        
        _light = UIImageView()
        _light?.backgroundColor = UIColor.red
        _light?.image = UIImage(named: "off")
        
        _light?.frame = CGRect(x: 20.0, y: 20.0, width: 300, height: 350)
        window?.rootViewController?.view.addSubview(_light!)
        
        _lightSwitch = UISwitch()
        _lightSwitch?.frame = CGRect(x: 50, y: 380, width: 200, height: 200)
        _lightSwitch?.addTarget(self, action: #selector(lightSwitchChanged), for: UIControlEvents.valueChanged)
        window?.rootViewController?.view.addSubview(_lightSwitch!)
        
        NSLog("hey")
        
        return true
    }
    
    func lightSwitchChanged() {
        NSLog("LIght switch changed")
        if _lightSwitch!.isOn {
            _light?.image = UIImage(named: "on")
        }
        else {
            _light?.image = UIImage(named: "off")
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

