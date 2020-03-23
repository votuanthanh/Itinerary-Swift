//
//  ActivityModel.swift
//  Itinerary
//
//  Created by ThanhVt on 3/22/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import Foundation
import UIKit

struct ActivityModel {
    var id: String!
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}
