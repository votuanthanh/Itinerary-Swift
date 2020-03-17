//
//  TripFunctions.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class TripFunctions {
    
    static func createTrip(trip: TripModel) {
        Data.tripModels.append(trip)
    }

    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Dat lat trip"))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
    
    static func editTrip(index: Int, title: String!, image: UIImage?) {
        Data.tripModels[index].title = title
        Data.tripModels[index].image = image
    }
}
