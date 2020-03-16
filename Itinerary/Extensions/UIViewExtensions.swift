//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit


extension UIView {
    func addShadowAndRounedCorner() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
}
