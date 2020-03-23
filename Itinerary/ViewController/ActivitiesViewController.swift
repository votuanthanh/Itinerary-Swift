//
//  ActivitiesViewController.swift
//  Itinerary
//
//  Created by ThanhVt on 3/18/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var tripId: UUID!
    var tripModel: TripModel?
    var sectionHeaderHeight: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        TripFunctions.readTrip(by: self.tripId) { [weak self] (model: TripModel?) in
            guard let self = self else { return }
            self.tripModel = model
            
            guard let model = model else { return }
            self.title = model.title
            self.imageView.image = model.image
            self.tableView.reloadData()
        }

        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: "header")?.contentView.bounds.height ?? 0
    }
}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tripModel = self.tripModel else { return nil }
        let dayModel = tripModel.dayModels[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderTableViewCell
        cell.setup(model: dayModel)
        
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = tripModel?.dayModels[section].title ?? ""
        let subTitle = tripModel?.dayModels[section].subTitle ?? ""
        
        return "\(title) - \(subTitle)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        
        return cell!
        
    }
    
    
}
