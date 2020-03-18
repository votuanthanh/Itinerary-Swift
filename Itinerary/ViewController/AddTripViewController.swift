//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by ThanhVt on 3/16/20.
//  Copyright © 2020 ThanhVt. All rights reserved.
//

import Photos
import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextLabel: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    var indexToEdit: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 26)
        imageView.layer.cornerRadius = 10
        
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        if let index = indexToEdit {
            let trip = Data.tripModels[index]
            imageView.image = trip.image
            tripTextLabel.text = trip.title
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        tripTextLabel.rightViewMode = .never

        guard tripTextLabel.text != "", let newTripName = tripTextLabel.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = UIImage(named: "warning")
            imageView.contentMode = .scaleAspectFit
            
            tripTextLabel.rightView = imageView
            tripTextLabel.rightViewMode = .always

            return
        }
        
        if let index = self.indexToEdit {
            TripFunctions.editTrip(index: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(trip: TripModel(title: newTripName, image: imageView.image))
        }

        if let doneSaving = self.doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.sourceType = .photoLibrary
        myPickerController.delegate = self
        self.present(myPickerController, animated: true)
    }
    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                    case .authorized:
                        self.presentPhotoPickerController()
                    case .notDetermined:
                        if status == PHAuthorizationStatus.authorized {
                            self.presentPhotoPickerController()
                        }
                    case .denied:
                        let alert = UIAlertController(title: "Photo Library Access Denied", message: "Photo Library access is previously denied. Please update your Settings if you wish to change this", preferredStyle: .alert)
                        let gotoSettingsAction = UIAlertAction(title: "Go to settings", style: .default) { (action) in
                            DispatchQueue.main.async {
                                let url = URL(string: UIApplication.openSettingsURLString)!
                                UIApplication.shared.open(url, options: [:])
                            }
                        }
                        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                        alert.addAction(gotoSettingsAction)
                        alert.addAction(cancelAction)
                        self.present(alert, animated: true)
                    
                    case .restricted:
                        print("Retricted")
                    default:
                        break
                }
            }
        }
    }
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            imageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: false)
    }
}
