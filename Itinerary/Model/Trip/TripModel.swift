//
//  TripModel.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import Foundation


class TripModel {
    var id: String!
    var title: String!
    
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
