//
//  UploadViewController.swift
//  instagramClone
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImageFromGallery))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func selectImageFromGallery(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    @IBAction func uploadButtonTapped(_ sender: Any) {
        
        let uuid = UUID().uuidString
        
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("Media")
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let imageReference = mediaFolder.child("\(uuid).jpeg")
            
            imageReference.putData(data, metadata: nil) { (storagemetadata, error) in
                
                if error != nil {
                    GiveError.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "An error occurred!", vc: self)
                } else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            if let imageUrl = imageUrl {
                                let firestoreDatabase = Firestore.firestore()
                                
                                let firestorePost = ["imageURL" : imageUrl , "comment" : self.descriptionTextField.text! , "email" : Auth.auth().currentUser?.email , "date" : FieldValue.serverTimestamp() ] as [String : Any]
                                
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost) { (error) in
                                    if error != nil {
                                        GiveError.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "An error occurred", vc: self)
                                    } else {
                                        self.descriptionTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                        self.imageView.image = nil
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
