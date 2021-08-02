//
//  LoginViewController.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 23/07/21.
//

import UIKit
import MBProgressHUD
import FirebaseAuth
import Loaf

class LoginViewController: UIViewController {
    
    weak var delegate: OnbordingDelegate?
    private let authManager = AuthManager()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    private enum PageType{
        case login
        case signUp
    }
    
    private var errorMessage: String? {
        didSet{
            showMessageErrorIfNeeded(text: errorMessage)
        }
    }
    
    private var currentPageType: PageType = .login{
        didSet{
            setupViewsfor(pageType: currentPageType)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsfor(pageType: .login)
        setupButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailtextField.becomeFirstResponder()
    }
    
    private func setupViewsfor(pageType: PageType) {
        errorMessage = nil
        confirmPasswordTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    
    private func showMessageErrorIfNeeded(text: String?){
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }
    
    private func setupButtons(){
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 0
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.borderWidth = 0
    }
    
    private func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertaction = UIAlertAction(title: K.Titles.ok, style: .default, handler: nil)
        alertController.addAction(okAlertaction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func forgetPasswordButtontapped(_ sender: Any) {
        let alertController = UIAlertController(title: K.Titles.forgetPasswordTitle, message: K.messages.informationEnterEmailAdress, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        let cancelAction = UIAlertAction(title: K.Titles.cancel, style: .cancel, handler: nil)
        let okAlertaction = UIAlertAction(title: K.Titles.ok, style: .default) {[weak self] _ in
            guard let this = self else { return }

            if let textField = alertController.textFields?.first, let email = textField.text, !email.isEmpty {
                this.authManager.resetPassword(withEmail: email) {  result in
                    MBProgressHUD.hide(for: this.view, animated: true)
                    switch result {
                        case .success:
                            this.showAlert(title: K.Titles.alertForgetPassword, message: K.messages.alertForgetPassword)
                        case .failure(let error):
                            Loaf(error.localizedDescription, state: .error, location: .top, sender: this).show()
                    }
                }
            }
        }
        
        alertController.addAction(okAlertaction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func singUpButtonTapped(_ sender: Any) {
        
        guard let email = emailtextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let passwordConfirmation = confirmPasswordTextField.text, !passwordConfirmation.isEmpty
              else {
                showMessageErrorIfNeeded(text: K.messages.errorInvalidForm)
                return
            }
        
        guard password == passwordConfirmation else {
            showMessageErrorIfNeeded(text: K.messages.errorPasswordsNotEquals)
            return
        }
        MBProgressHUD.showAdded(to: view, animated: true)

        authManager.singUp(email, password) { [weak self] result in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            switch result {
                case .success:
                    this.delegate?.showMainTabBarController()
                case .failure(let error):
                    this.showMessageErrorIfNeeded(text: error.localizedDescription)
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true)
        
        guard let email = emailtextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            showMessageErrorIfNeeded(text: K.messages.errorInvalidForm)
            return
        }
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        authManager.login(email, password) { [weak self] result in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            switch result {
                case .success:
                    this.delegate?.showMainTabBarController()
                case .failure(let error):
                    this.showMessageErrorIfNeeded(text: error.localizedDescription)
            }
        }
    }
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
    }
}

