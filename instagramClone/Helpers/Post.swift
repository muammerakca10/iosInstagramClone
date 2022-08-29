//
//  Post.swift
//  instagramClone
//
//  Created by MAC on 29.08.2022.
//

import Foundation

class Post {
    
    var email : String
    var comment : String
    var imageURL : String
    
    init(email : String, comment : String, imageURL : String) {
        self.email = email
        self.comment = comment
        self.imageURL = imageURL
    }
}
