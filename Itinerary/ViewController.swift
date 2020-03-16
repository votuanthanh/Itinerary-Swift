//
//  ViewController.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: FloatingActionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        TripFunctions.readTrips(completion: { [weak self] in
            self?.tableView.reloadData()
        })
        
        view.backgroundColor = Theme.backgroundColor
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripTableViewCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
}

