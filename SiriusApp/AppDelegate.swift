//
//  AppDelegate.swift
//  SiriusApp
//
//  Created by Всеволод on 19/11/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
    /*    let tabBarController = UITabBarController()
        
        let dealsViewController = DealsViewController() as UIViewController
        dealsViewController.view.backgroundColor = UIColor.white
        dealsViewController.title = "Deals"
        
        let charterViewController = CharterViewController() as UIViewController
        charterViewController.view.backgroundColor = UIColor.white
        charterViewController.title = "Charter"
        
        let notificationsViewController = NotifecationsViewController() as UIViewController
        notificationsViewController.view.backgroundColor = UIColor.white
        notificationsViewController.title = "Уведомления"
        
        let profileViewController = ProfileViewController() as UIViewController
        profileViewController.view.backgroundColor = UIColor.white
        profileViewController.title = "Профиль"
        
        dealsViewController.tabBarItem = UITabBarItem(title: "Deals", image: UIImage(named: "Deals"), tag: 0)
        charterViewController.tabBarItem = UITabBarItem(title: "Charter", image: UIImage(named: "Charter"), tag: 1)
        notificationsViewController.tabBarItem = UITabBarItem(title: "Уведомления", image: UIImage(named: "Notifications"), tag: 2)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "Profile"), tag: 3)
        

       // tabBarController.viewControllers = controllers
        
        let navigationController = UINavigationController(rootViewController: dealsViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.barStyle = .black
        let controllers = [/*dealsViewController */navigationController,charterViewController,notificationsViewController,profileViewController]
        
            tabBarController.viewControllers = controllers
        
      //  tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
       
        window!.rootViewController = tabBarController */
        
        let welcomeViewController = WelcomeViewController() as UIViewController
        welcomeViewController.view.backgroundColor = UIColor.white
        welcomeViewController.title = ""
        
        let navigationController = UINavigationController(rootViewController: welcomeViewController)
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.isHidden = true
        window!.rootViewController =  navigationController // WelcomeViewController()
        window!.makeKeyAndVisible()
        return true
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

