//
//  AppUIButton.swift
//  Itinerary
//
//  Created by ThanhVt on 3/16/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
