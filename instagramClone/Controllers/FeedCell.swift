//
//  FeedCell.swift
//  instagramClone
//
//  Created by MAC on 27.08.2022.
//

import UIKit

class FeedCell: UITableViewCell {
    
    @IBOutlet var emailTextFieldCell: UILabel!
    
    @IBOutlet var descriptionTextFieldCell: UILabel!
    
    @IBOutlet var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
