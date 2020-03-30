//
//  ActivityTableViewCell.swift
//  Itinerary
//
//  Created by ThanhVt on 3/23/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addShadowAndRounedCorner()
        title.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        subTitleLabel.font = UIFont(name: Theme.bodyFontName, size: 17)
    }
    
    func setup(model: ActivityModel) {
        title.text = model.title
        subTitleLabel.text = model.subTitle
        activityImageView?.image = getActivityImageView(type: model.activityType)
    }
    
    func getActivityImageView(type: ActivityType) -> UIImage? {
        switch type {
        case .flight:
            return UIImage(named: "flight")
        case .hotel:
            return UIImage(named: "hotel")
        case .food:
            return UIImage(named: "food")
        case .excursion:
            return UIImage(named: "car")
        case .auto:
            return UIImage(named: "car")
        }
    }
}
