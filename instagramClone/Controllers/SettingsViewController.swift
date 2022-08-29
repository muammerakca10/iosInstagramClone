//
//  SettingsViewController.swift
//  instagramClone
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toFeedVC", sender: nil)
        } catch {
            GiveError.giveErrorMessage(title: "Error", message: "Could not log out", vc: self)
        }
        
        
    }
    
}
