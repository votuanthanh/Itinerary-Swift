//
//  TripTableViewCell.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRounedCorner()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
        cardView.backgroundColor = Theme.accentColor
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(tripModel: TripModel) {
        print(tripModel.title)
        titleLabel.text = tripModel.title
        if let tripImage = tripImageView.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            UIView.animate(withDuration: 1) {
                self.tripImageView.alpha = 1
            }
        }
        tripImageView.image = tripModel.image
    }

}
