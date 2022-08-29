//
//  FeedViewController.swift
//  instagramClone
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var emailArray = [String]()
    var commentArray = [String]()
    var imageArray = [String]()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDatasFromFirebase()
    }
    
    func getDatasFromFirebase () {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Post").addSnapshotListener { (snapshot, error) in
            
            if error != nil {
                Helper.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "An error Occurred", vc: self)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        
                        //let documentID = document.documentID
                        
                        if let email = document.get("email") as? String {
                            self.emailArray.append(email)
                        }
                        
                        if let comment = document.get("comment") as? String {
                            self.commentArray.append(comment)
                        }
                        
                        
                        if let imageURL = document.get("imageURL") as? String {
                            self.imageArray.append(imageURL)
                        }
                        
                        
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailTextFieldCell.text = emailArray[indexPath.row]
        cell.descriptionTextFieldCell.text = commentArray[indexPath.row]
        cell.imageViewCell.image = nil
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    

}
