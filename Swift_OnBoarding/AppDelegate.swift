//
//  AppDelegate.swift
//  Swift_OnBoarding
//
//  Created by Santhosh Kumar on 25/03/20.
//  Copyright © 2020 WeKanCode. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setRootViewController()
        
        return true
    }
    
    func setRootViewController() {
        
        var viewController = UIViewController()
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if !(UserDefaults.standard.object(forKey: "SHOW_ONBOARD_TUTORIAL") != nil) {
            viewController = (mainStoryboard.instantiateViewController(withIdentifier: "OnBoardingViewController") as? OnBoardingViewController)!
        } else {
            viewController = (mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController)!
        }
        
        navController = UINavigationController(rootViewController: viewController)
        navController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

