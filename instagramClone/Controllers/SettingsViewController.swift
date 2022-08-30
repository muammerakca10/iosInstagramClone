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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutBarButtonTapped))
         
         
    }
    
    @objc private func logoutBarButtonTapped(){
        let alertLogout = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: UIAlertController.Style.alert)
        
        alertLogout.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action : UIAlertAction) in
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "toFeedVC", sender: nil)
            } catch {
                GiveError.giveErrorMessage(title: "Error", message: "Could not log out", vc: self)
            }
        }))
        
        alertLogout.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction) in
            alertLogout.dismiss(animated: true)
        }))
        
        present(alertLogout, animated: true)
    }
}
