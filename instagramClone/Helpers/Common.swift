//
//  Common.swift
//  instagramClone
//
//  Created by MAC on 24.08.2022.
//

import Foundation

class Helper {
    public func isEmailHasdot (email : String) -> Bool {
        if email.contains(".") {
            return true
        } else {
            return false
        }
    }
    
    public func isEmailHasAtSymbol (email : String) -> Bool {
        if email.contains("@") {
            return true
        } else {
            return false
        }
    }
    
    public func isPasswordLengthEnough (password : String) -> Bool {
        if password.count > 5 {
            return true
        } else {
            return false
        }
    }
    
    public func isEmailOrPasswordNotBlank (email: String , password : String) -> Bool {
        if email != "" && password != "" {
            return true
        } else {
            return false
        }
    }
    
}
