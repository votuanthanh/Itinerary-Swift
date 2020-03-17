//
//  TripModel.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit


class TripModel {
    var id: String!
    var title: String!
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.image = image
    }
}
