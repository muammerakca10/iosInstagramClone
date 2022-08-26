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
    
    
    @IBOutlet var descriptionTextView: UITextField!
    
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
                    Helper.giveErrorMessage(title: "Error", message: error?.localizedDescription ?? "An error occurred!", vc: self)
                } else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                        }
                    }
                }
            }
        }
        
    }
    
}
