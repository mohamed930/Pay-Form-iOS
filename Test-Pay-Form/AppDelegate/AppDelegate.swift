//
//  AppDelegate.swift
//  Test-Pay-Form
//
//  Created by Mohamed Ali on 8/1/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import Stripe
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Stripe.setDefaultPublishableKey("pk_test_51HEAo8Egh0JtMO8MiveSQC7KgonME76FyBiJCVtvLpuHlwVTvYwkgxY78zwnzRCMuzPwWJHCdLAvzaiijzeGLRg500zEvXvWhA")
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        return true
    }


}

