//
//  Common.swift
//  instagramClone
//
//  Created by MAC on 24.08.2022.
//

import Foundation
import UIKit

class GiveError : NSObject {
    
    class func giveErrorMessage(title: String, message: String, vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
}
