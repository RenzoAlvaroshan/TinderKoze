//
//  AuthenticationViewModel.swift
//  TinderTutorial
//
//  Created by Renzo Alvaroshan on 08/06/22.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

struct RegisterViewModel: AuthenticationViewModel {
    var email: String?
    var fullname: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && fullname?.isEmpty == false && password?.isEmpty == false
    }
}
