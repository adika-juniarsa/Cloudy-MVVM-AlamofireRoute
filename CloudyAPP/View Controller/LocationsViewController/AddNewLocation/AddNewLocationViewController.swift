//
//  AddNewLocationViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit
import CoreLocation

protocol AddNewLocationViewControllerDelegate {
    func controller(_ controller:AddNewLocationViewController, didAddLocation location:Location)
}

class AddNewLocationViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var locations: [Location] = []
    
    private lazy var geocoder = CLGeocoder()
    
    var delegate: AddNewLocationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add Location"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchbar.becomeFirstResponder()
    }
    
    private func setupView(){
        
    }
    
    private func updateView(){
        
    }
    
    
    private func geocode(addressString: String?){
        guard let addressString = addressString else {
            locations = []
            
            tableView.reloadData()
            
            return
        }
        
        geocoder.geocodeAddressString(addressString){ [weak self] (placemarks, error) in
            DispatchQueue.main.async {
                self?.processResponse(withPlacemarks: placemarks, error: error)
            }
        }
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?){
        if let error = error {
            print("Unable to Forward Geocode Address (\(error))")
        } else if let matches = placemarks {
            //update locations
            locations = matches.compactMap({ (match) -> Location? in
                guard let name = match.name else {return nil}
                guard let location = match.location else {return nil}
                return Location(name:name, latitude:location.coordinate.latitude, longitude:location.coordinate.longitude)
            })
            
            tableView.reloadData()
        }
    }
    
}

extension AddNewLocationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.reuseIdentifier, for: indexPath) as? LocationTableViewCell else {fatalError("Unexpected Table View Cell")}
        
        let location = locations[indexPath.row]
        
        let viewModel = LocationsViewLocationViewModel(location: location.location, locationAsString: location.name)
        
        cell.configure(withViewModel: viewModel)
        
        return cell
    }
}


extension AddNewLocationViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = locations[indexPath.row]
        
        delegate?.controller(self, didAddLocation: location)
        
        navigationController?.popViewController(animated: true)
    }
}

extension AddNewLocationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        geocode(addressString: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        locations = []
        
        tableView.reloadData()
    }
}
