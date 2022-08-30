//
//  SettingsViewController.swift
//  instagramClone
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var profilePostArray = [Post]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        for post in FeedViewController.postArray {
            if post.email == Auth.auth().currentUser?.email {
                profilePostArray.append(post)
            }
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutBarButtonTapped))
        
        //self.tabBarItem.title = "@Profile"
        
        self.navigationItem.title = Auth.auth().currentUser?.email
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailTextFieldCell.text = profilePostArray[indexPath.row].email
        cell.descriptionTextFieldCell.text = profilePostArray[indexPath.row].comment
        cell.imageViewCell.sd_setImage(with: URL(string: profilePostArray[indexPath.row].imageURL))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilePostArray.count
    }
    
    
    
    
}
