//
//  AppDelegate.swift
//  Todooy
//
//  Created by Lou Macleod on 23/12/2017.
//  Copyright © 2017 Lou Macleod. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
   
    //print(Realm.Configuration.defaultConfiguration.fileURL)
    
    
    do {
       _ = try Realm()
    } catch {
      print("Error inititialising new realm, \(error)")
    }
    
    return true
  }
  
}

