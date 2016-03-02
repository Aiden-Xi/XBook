//
//  AppDelegate.swift
//  XBook
//
//  Created by Mr.Xi on 16/3/1.
//  Copyright © 2016 Mr.Xi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window = UIWindow(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        
        let tabbarController = UITabBarController()
        
        let rankController = UINavigationController(rootViewController: rankViewController())
        let searchController = UINavigationController(rootViewController: circleViewController())
        let pushController = UINavigationController(rootViewController: pushViewController())
        let circleController = UINavigationController(rootViewController: circleViewController())
        let moreController = UINavigationController(rootViewController: moreViewController())
        
        tabbarController.viewControllers = [rankController, searchController, pushController, circleController, moreController]
        
        let tabbarItem1 = UITabBarItem(title: "排行榜", image: UIImage(named: "rank_tab"), selectedImage: UIImage(named: "rank_tab_select"))
        let tabbarItem2 = UITabBarItem(title: "发现", image: UIImage(named: "search_tab"), selectedImage: UIImage(named: "search_tab_select"))
        let tabbarItem3 = UITabBarItem(title: "push", image: UIImage(named: "push_tab"), selectedImage: UIImage(named: "push_tab_select"))
        let tabbarItem4 = UITabBarItem(title: "圈子", image: UIImage(named: "circle_tab"), selectedImage: UIImage(named: "circle_tab_select"))
        let tabbarItem5 = UITabBarItem(title: "更多", image: UIImage(named: "more_tab"), selectedImage: UIImage(named: "more_tab_select"))
        
        rankController.tabBarItem = tabbarItem1
        searchController.tabBarItem = tabbarItem2
        pushController.tabBarItem = tabbarItem3
        circleController.tabBarItem = tabbarItem4
        moreController.tabBarItem = tabbarItem5
        
        rankController.tabBarController?.tabBar.tintColor = COLOR_RED
        
        self.window?.rootViewController = tabbarController
        self.window?.makeKeyAndVisible()
        
        printLog("33333")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

