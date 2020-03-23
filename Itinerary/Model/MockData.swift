//
//  MockData.swift
//  Itinerary
//
//  Created by ThanhVt on 3/22/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import Foundation


class MockData {
    static func createMockTripModelData() -> [TripModel] {
        var tripModels = [TripModel]()
        tripModels.append(TripModel(title: "Trip to Bali", image: #imageLiteral(resourceName: "flower"), dayModels: createMockDayModelData()))
        tripModels.append(TripModel(title: "Trip to Italy", image: #imageLiteral(resourceName: "italy")))
        tripModels.append(TripModel(title: "Trip to Tulip", image: #imageLiteral(resourceName: "tulip")))
        
        return tripModels
    }
    
    static func createMockDayModelData() -> [DayModel] {
        var dayModels = [DayModel]()
        dayModels.append(DayModel(title: "November 14", subTitle: "Departure", data: createMockActivityModelData(sectionTitle: "November 14")))
        dayModels.append(DayModel(title: "November 15", subTitle: "Checking", data: createMockActivityModelData(sectionTitle: "November 15")))
        dayModels.append(DayModel(title: "November 16", subTitle: "Checking", data: createMockActivityModelData(sectionTitle: "November 16")))
        
        return dayModels
    }
    
    static func createMockActivityModelData(sectionTitle: String) -> [ActivityModel] {
        var activityModels = [ActivityModel]()
        
        switch sectionTitle {
        case "November 14":
            activityModels.append(ActivityModel(title: "From SLC", subTitle: "12:25 - 13:45", activityType: .flight, photo: #imageLiteral(resourceName: "flight")))
            activityModels.append(ActivityModel(title: "From LAX", subTitle: "14:25 - 23:45", activityType: .flight, photo: #imageLiteral(resourceName: "flight")))
        case "November 15":
            activityModels.append(ActivityModel(title: "Arrive in Bali", subTitle: "Take shuttle to hotel", activityType: .flight, photo: #imageLiteral(resourceName: "flight")))
            activityModels.append(ActivityModel(title: "Hotel Bali", subTitle: "Reservation#: 554466", activityType: .flight, photo: #imageLiteral(resourceName: "hotel")))
            activityModels.append(ActivityModel(title: "Pickup Car", subTitle: "Reservation#: AB345-X", activityType: .flight, photo: #imageLiteral(resourceName: "car")))
        case "November 16":
            activityModels.append(ActivityModel(title: "Breakfase on the Beach", subTitle: "With my wife - 9:00AM", activityType: .food, photo: #imageLiteral(resourceName: "food")))
            activityModels.append(ActivityModel(title: "Hotel Dalat", subTitle: "Reservation#: 554466", activityType: .hotel, photo: #imageLiteral(resourceName: "hotel")))
        default:
            print("AA")
        }
        
        return activityModels
    }
}
