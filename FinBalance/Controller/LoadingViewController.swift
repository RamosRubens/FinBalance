//
//  LoadingViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 22/07/21.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let authManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(durationInSeconds: 2.0){
            self.showInitialView()
        }
    }
    
    private func showInitialView(){
        if authManager.isUserLoggedIn() {
            PresenterManager.shared.show(vc: .mainTabBarController)
        } else {
            performSegue(withIdentifier: K.Segue.showOnbording, sender: nil)
        }
    }
}
