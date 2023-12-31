//
//  LoginViewModel.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 29/08/23.
//

import Foundation
import Firebase

protocol LoginViewModelProtocol: AnyObject {
    func successLogin()
    func errorLogin(errorMessage: String)
    
}

class LoginViewModel {
    private weak var delegate: LoginViewModelProtocol?
    
    public func delegate(delegate: LoginViewModelProtocol?){
        self.delegate = delegate
    }
    private var auth = Auth.auth()
    
    public func login(email: String, password: String){
        auth.signIn(withEmail: email, password: password){
            authResult, error in
            if error == nil {
                print("sucesso login")
                self.delegate?.successLogin()
            } else {
                print("error login, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription  ?? "")
            }
        }
    }
    
    public func registerUser(email: String, password: String){
        auth.createUser(withEmail: email, password: password){
            authResult, error in
            if error == nil {
                print("sucesso cadastro")
            } else {
                print("error cadastro, error: \(error?.localizedDescription ?? "")")
            }
        }
    }
}
