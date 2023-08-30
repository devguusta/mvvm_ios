//
//  ViewController.swift
//  ConfigViewCode
//
//  Created by Premiersoft on 14/07/23.
//

import UIKit

class LoginViewController: UIViewController {
   private var loginScreen: LoginScreen?
    
    private var viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        loginScreen = LoginScreen( )
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedloginButton() {
        if loginScreen!.loginButton.isEnabled{
            self.loginScreen?.loading.startAnimating()
            viewModel.login(email: loginScreen?.emailTextField.text ?? "" , password: loginScreen?.passwordTextField.text ?? "")
        }
        }
       
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        let email: String = loginScreen?.emailTextField.text ?? ""
        let password: String = loginScreen?.passwordTextField.text ?? ""
        if email.isEmpty || password.isEmpty {
            print("Botao desabilitado")
            loginScreen?.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.4)
            loginScreen?.loginButton.isEnabled = false
        
        } else {
            loginScreen?.loginButton.backgroundColor = .darkGray
            loginScreen?.loginButton.isEnabled = true
            print("botao habilitado")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
      
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
}

extension LoginViewController: LoginViewModelProtocol {
    func successLogin() {
        let homeViewController: HomeViewController = HomeViewController()
      
        self.navigationController?.pushViewController(homeViewController, animated: true)
        self.loginScreen?.loading.stopAnimating()
    }
    
    func errorLogin(errorMessage: String) {
        
        print(#function)
        self.loginScreen?.loading.stopAnimating()
        Alert(controller: self).showAlertInformation(title: "Ops, erro ao fazer login", message: errorMessage)
    }
    
    
}
