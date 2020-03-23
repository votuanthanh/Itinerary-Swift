//
//  DayModel.swift
//  Itinerary
//
//  Created by ThanhVt on 3/22/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import Foundation

struct DayModel {
    var id: String!
    var title = ""
    var subTitle = ""
    var activityModels = [ActivityModel]()
    
    init(title: String, subTitle: String, data: [ActivityModel]? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle

        if let data = data {
            self.activityModels = data
        }
    }
}
