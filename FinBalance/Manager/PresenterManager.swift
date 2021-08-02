//
//  PresenterManager.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 23/07/21.
//

import UIKit

class PresenterManager {
    
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC {
        case mainTabBarController
        case calculator
        case onbording
    }
    
    func show(vc: VC) {
        
        var viewController: UIViewController
        
        switch vc {
        case .mainTabBarController:
            viewController = UIStoryboard(name: K.StorybordID.main, bundle: nil).instantiateViewController(identifier: K.StorybordID.mainTabBarController)
        case .onbording:
            viewController = UIStoryboard(name: K.StorybordID.main, bundle: nil).instantiateViewController(identifier: K.StorybordID.onbordingController)
        case .calculator:
            viewController = UIStoryboard(name: K.StorybordID.calculator, bundle: nil).instantiateViewController(identifier: K.StorybordID.calculator)
        }

        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = viewController

            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
