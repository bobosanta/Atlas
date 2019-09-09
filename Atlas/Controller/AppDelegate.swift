//
//  AppDelegate.swift
//  Atlas
//
//  Created by Dan Pop on 17/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //        MARK: Realm
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let favourites = Favourites()
        favourites.name = "Favourites"
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(favourites)
            }
        } catch {
            print("Error creating a new Realm \(error)")
        }
        
        
        //        MARK: Firebase
        FirebaseApp.configure()
        
        let myDatabase = Database.database().reference()
        
        myDatabase.setValue("We got data")
        
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            if let user = user {
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tabBarcontroller") as! UITabBarController
                UIApplication.shared.keyWindow?.rootViewController = viewController
            } else {
                // user is not logged in
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }


}

