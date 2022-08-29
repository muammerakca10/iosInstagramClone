//
//  ViewController.swift
//  instagramClone
//
//  Created by MAC on 22.08.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
//        if emailTextField.text != "" && passwordTextField.text != "" {
//            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authDataResult, error) in
//
//                if error != nil {
//                    GiveError.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "Something went wrong" , vc: self)
//                } else {
//                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
//                }
//            }
//        } else {
//            GiveError.giveErrorMessage(title: "Error", message: "Enter a valid email and password", vc: self)
//        }
        if emailTextField.text == "" || passwordTextField.text == "" {
            GiveError.giveErrorMessage(title: "Error", message: "Enter a valid email and password", vc: self)
            return
        }
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authDataResult, error) in
            
            if error != nil {
                GiveError.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "Something went wrong" , vc: self)
                return
            }
            self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            
        }
    }
    
    
    @IBAction func signupButton(_ sender: Any) {
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            GiveError.giveErrorMessage(title: "Error", message: "Enter a valid username and password", vc: self)
            return
        }
            
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdataresult, error) in
            if error != nil {
                GiveError.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "Something went wrong" , vc: self)
                return
            }
            self.performSegue(withIdentifier: "toFeedVC", sender: nil)
        }
    }
    
}
