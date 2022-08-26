//
//  Common.swift
//  instagramClone
//
//  Created by MAC on 24.08.2022.
//

import Foundation
import UIKit

class Helper : NSObject {
    class func isEmailHasdot (_ email : String) -> Bool {
        if email.contains(".") {
            return true
        } else {
            return false
        }
    }
    
    class func isEmailHasAtSymbol (_ email : String) -> Bool {
        if email.contains("@") {
            return true
        } else {
            return false
        }
    }
    
    class func isPasswordLengthEnough (_ password : String) -> Bool {
        if password.count > 5 {
            return true
        } else {
            return false
        }
    }
    
    class func isEmailOrPasswordNotBlank (_ email: String , _ password : String) -> Bool {
        if email != "" && password != "" {
            return true
        } else {
            return false
        }
    }
    
    class func isPasswordsEqual(_ password: String, _ repeatPassword: String) -> Bool{
        if password == repeatPassword {
            return true
        } else {
            return false
        }
    }
    
    class func giveErrorMessage(title: String, message: String, vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
}
