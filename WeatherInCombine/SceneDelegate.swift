//
//  SceneDelegate.swift
//  WeatherInCombine
//
//  Created by PRIYANS on 14/4/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        let vc = window?.rootViewController as! ViewController
        vc.dependencies = Dependencies(networkServices: NetworkService())
    }


}

