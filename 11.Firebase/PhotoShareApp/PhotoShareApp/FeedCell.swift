//
//  FeedCell.swift
//  PhotoShareApp
//
//  Created by Ömer Faruk Kazar on 6.09.2022.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
