//
//  LocationViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationViewControllerDelegate {
    func controller(_ controller: LocationViewController, didSelectLocation location:CLLocation)
}

class LocationViewController: UIViewController {
    
    private let segueAddLocation = "SegueAddLocation"
    
    var delegate: LocationViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentLocation: CLLocation?
    
    var favorites = UserDefaults.loadLocations()
    
    private var hasFavourites: Bool {
        return favorites.count > 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Locations"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case segueAddLocation:
            if let addLocationViewController = segue.destination as? AddNewLocationViewController{
                addLocationViewController.delegate = self
            } else {
                print("Unexpected destination view controller")
            }
        default:
            break
        }
    }
    
    private func setupView(){
        
    }
    
    private func updateView(){
        
    }
    
    @IBAction func unwindToLocationsViewController(segue: UIStoryboardSegue) {
        
    }
}

extension LocationViewController: UITableViewDataSource {
    
    private enum Section: Int {
        
        case current
        case favorite
        
        var title: String {
            switch self {
            case .current:
                return "Current Location"
            case .favorite:
                return "Favorite Location"
            }
        }
        
        var numberOfRows: Int {
            switch self {
            case .current:
                return 1
            case .favorite:
                return 0
            }
        }
        
        static var count: Int {
            return Section.favorite.rawValue + 1
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {fatalError("Unexpected Section")}
        
        switch section {
        case .current:
            return 1
        case .favorite:
            return max(favorites.count, 1)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else {fatalError("Unexpected Section")}
        
        return section.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {fatalError("Unexpected Section")}
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseIdentifier, for: indexPath) as? LocationTableViewCell else {fatalError("Unexpected Section")}
        
        var viewModel: LocationRepresentable?
        
        switch section {
        case .current:
            if let currentLocation = currentLocation {
                viewModel = LocationsViewLocationViewModel(location: currentLocation)
            } else {
                cell.nameLabel.text = "Current Location unknown"
            }
        case .favorite:
            if favorites.count > 0 {
                let favorite = favorites[indexPath.row]
                
                viewModel = LocationsViewLocationViewModel(location: favorite.location, locationAsString: favorite.name)
            } else {
                cell.nameLabel.text = "no favorites found"
            }
        }
        
        if let viewModel = viewModel {
            cell.configure(withViewModel: viewModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let section = Section(rawValue: indexPath.section) else {fatalError("Unexpected Section")}
        
        switch section {
        case .current:
            return false
        case .favorite:
            return hasFavourites
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Fetch Location
        let location = favorites[indexPath.row]
        
        //update favorites
        favorites.remove(at: indexPath.row)
        
        //remove locatoin
        UserDefaults.removeLocation(location)
        
        //update table view
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension LocationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let section = Section(rawValue: indexPath.section) else {fatalError("Unexpected Section")}
        
        var location: CLLocation?
        
        switch section {
        case .current:
            if let currentLocation = currentLocation {
                location = currentLocation
            }
        case .favorite:
            if hasFavourites{
                location = favorites[indexPath.row].location
            }
        }
        
        if let newLocation = location {
            //notify delegate
            delegate?.controller(self, didSelectLocation: newLocation)
            
            //dismiss view controller
            dismiss(animated: true, completion: nil)
        }
    }
}

extension LocationViewController: AddNewLocationViewControllerDelegate {
    func controller(_ controller: AddNewLocationViewController, didAddLocation location: Location) {
        UserDefaults.addLocation(location)
        
        favorites.append(location)
        
        tableView.reloadData()
    }
}


