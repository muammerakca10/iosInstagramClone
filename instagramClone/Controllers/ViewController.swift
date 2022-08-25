//
//  ViewController.swift
//  instagramClone
//
//  Created by MAC on 22.08.2022.
//

import UIKit

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
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            <#code#>
        } else {
            errorMessage(titleInput: "error", messageInput: "Email and Password cannot be empty")
        }
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    
    func errorMessage(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
}

