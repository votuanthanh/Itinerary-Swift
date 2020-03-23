//
//  HeaderTableViewCell.swift
//  Itinerary
//
//  Created by ThanhVt on 3/23/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
        subTitle.font = UIFont(name: Theme.bodyFontName, size: 15)
    }

    func setup(model: DayModel) {
        title.text = model.title
        subTitle.text = model.subTitle
    }

}
