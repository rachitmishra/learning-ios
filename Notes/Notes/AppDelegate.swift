//
//  AppDelegate.swift
//  2Note
//
//  Created by Rachit Mishra on 24/08/18.
//  Copyright © 2018 ceeq. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var dataController = DataController(modelName: "Notes")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        dataController.load()
        
        let navController = window?.rootViewController as! NavigationController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       saveViewContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveViewContext()
    }


    func saveViewContext() {
        try! dataController.viewContext.save()
    }
    
    static func dataController() -> DataController {
        return (UIApplication.shared.delegate as! AppDelegate).dataController
    }
}

