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
    }
    
    
    @IBAction func signupButton(_ sender: Any) {
        
        if Helper.isEmailHasdot(emailTextField.text! ) && Helper.isEmailHasAtSymbol( emailTextField.text!) && Helper.isEmailOrPasswordNotBlank(emailTextField.text!, passwordTextField.text!) && Helper.isPasswordLengthEnough(passwordTextField.text!) {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authDataRessult, error in
                if error != nil {
                    Helper.giveErrorMessage(title: "Sign Up Error", message: error?.localizedDescription ?? "User could not be created", vc: self)
                }  else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else {
            Helper.giveErrorMessage(title: "Error", message: "Something went wrong", vc: self)
        }
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
}

