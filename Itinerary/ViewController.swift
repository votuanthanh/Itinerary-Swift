//
//  ViewController.swift
//  Itinerary
//
//  Created by ThanhVt on 3/15/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var helpScreen: UIVisualEffectView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: FloatingActionButton!
    
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        TripFunctions.readTrips(completion: { [weak self] in
            self?.tableView.reloadData()
        })
        
        view.backgroundColor = Theme.backgroundColor
        
        if UserDefaults.standard.bool(forKey: "isScreenHelpView") == false {
            view.addSubview(helpScreen)
            helpScreen.frame = view.frame
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.indexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func closeHelpScreen(_ sender: AppUIButton) {
        helpScreen.removeFromSuperview()
        UIView.animate(withDuration: 0.5, animations: {
            self.helpScreen.alpha = 0
        }, completion: { (success) in
            self.helpScreen.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: "isScreenHelpView")
        })
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trip = Data.tripModels[indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alert = UIAlertController(title: "Delete trip", message: "Are you sure want to delete this trip: \(trip.title!)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                TripFunctions.deleteTrip(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
                actionPerformed(true)
            }))
            
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = Data.tripModels[indexPath.row]
        let storyBoard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        print(String(describing: ActivitiesViewController.self))
        let vc = storyBoard.instantiateInitialViewController() as! ActivitiesViewController
        vc.tripId = trip.id
        navigationController?.pushViewController(vc, animated: true)
    }
}

