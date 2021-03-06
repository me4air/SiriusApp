//
//  TapBarViewController.swift
//  SiriusApp
//
//  Created by Всеволод on 09/12/2018.
//  Copyright © 2018 me4air. All rights reserved.
//

import UIKit

class TapBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dealsViewController = DealsViewController() as UIViewController
        dealsViewController.view.backgroundColor = UIColor.white
        dealsViewController.title = "Возвратный рейс"
        
        let charterViewController = CharterViewController() as UIViewController
        charterViewController.view.backgroundColor = UIColor.white
        charterViewController.title = "Чартер"
        
        let notificationsViewController = NotifecationsViewController() as UIViewController
        notificationsViewController.view.backgroundColor = UIColor.white
        notificationsViewController.title = "Уведомления"
        
        let profileViewController = ProfileViewController() as UIViewController
        profileViewController.view.backgroundColor = UIColor.white
        profileViewController.title = "Профиль"
        
        dealsViewController.tabBarItem = UITabBarItem(title: "Возвратный рейс", image: UIImage(named: "Deals"), tag: 0)
        charterViewController.tabBarItem = UITabBarItem(title: "Чартер", image: UIImage(named: "Charter"), tag: 1)
        notificationsViewController.tabBarItem = UITabBarItem(title: "Уведомления", image: UIImage(named: "Notifications"), tag: 2)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "Profile"), tag: 3)
        
        notificationsViewController.tabBarItem.badgeValue = "5"
        
        
        // tabBarController.viewControllers = controllers
        
        let dealsNavigationController = UINavigationController(rootViewController: dealsViewController)
        dealsNavigationController.navigationBar.prefersLargeTitles = true
        dealsNavigationController.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        dealsNavigationController.navigationBar.largeTitleTextAttributes = textAttributes
        dealsNavigationController.navigationBar.titleTextAttributes = textAttributes
        dealsNavigationController.navigationBar.barStyle = .black
        
        let charterNavigationController = UINavigationController(rootViewController: charterViewController)
        charterNavigationController.navigationBar.prefersLargeTitles = true
        charterNavigationController.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        charterNavigationController.navigationBar.largeTitleTextAttributes = textAttributes
        charterNavigationController.navigationBar.titleTextAttributes = textAttributes
        charterNavigationController.navigationBar.barStyle = .black
        
        let notificationNavigationController = UINavigationController(rootViewController: notificationsViewController)
        notificationNavigationController.navigationBar.prefersLargeTitles = true
        notificationNavigationController.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        notificationNavigationController.navigationBar.largeTitleTextAttributes = textAttributes
        notificationNavigationController.navigationBar.titleTextAttributes = textAttributes
        notificationNavigationController.navigationBar.barStyle = .black
        
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.navigationBar.prefersLargeTitles = false
        profileViewController.navigationController?.isNavigationBarHidden = true
        profileNavigationController.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2039215686, blue: 0.3607843137, alpha: 1)
        profileNavigationController.navigationBar.largeTitleTextAttributes = textAttributes
        profileNavigationController.navigationBar.titleTextAttributes = textAttributes
        profileNavigationController.navigationBar.barStyle = .black
        
        
        let controllers = [/*dealsViewController */dealsNavigationController,/*charterViewController*/charterNavigationController, notificationNavigationController/*notificationsViewController*/, profileNavigationController/*profileViewController*/]
        
        self.viewControllers = controllers
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
