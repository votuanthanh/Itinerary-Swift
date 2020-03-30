//
//  UITableViewCellExtension.swift
//  Itinerary
//
//  Created by ThanhVt on 3/23/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit


extension UITableViewCell {
    class var identifier:String {
        return String(describing: self)
    }
}
