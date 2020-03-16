//
//  FloatingActionButton.swift
//  Itinerary
//
//  Created by ThanhVt on 3/16/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit


class FloatingActionButton: UIButton {
    override func draw(_ rect: CGRect) {
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
