//
//  PopupUIView.swift
//  Itinerary
//
//  Created by ThanhVt on 3/16/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class PopupUIView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Theme.backgroundColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
}
