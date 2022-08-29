//
//  FeedViewController.swift
//  instagramClone
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postArray = [Post]()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDatasFromFirebase()
    }
    
    func getDatasFromFirebase () {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Post").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            
            if error != nil {
                GiveError.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "An error Occurred", vc: self)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.postArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        
                        //let documentID = document.documentID
                        
                        if let email = document.get("email") as? String {
                            
                            if let comment = document.get("comment") as? String {
                             
                                if let imageURL = document.get("imageURL") as? String {
                                    let post = Post(email: email, comment: comment, imageURL: imageURL)
                                    self.postArray.append(post)
                                }
                                
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailTextFieldCell.text = postArray[indexPath.row].email
        cell.descriptionTextFieldCell.text = postArray[indexPath.row].comment
        cell.imageViewCell.sd_setImage(with: URL(string: self.postArray[indexPath.row].imageURL))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    

}
