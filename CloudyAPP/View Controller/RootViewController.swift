//
//  ViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/22/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit
import CoreLocation

class RootViewController: UIViewController {
    
    // MARK: - Constants
    private let segueDayView = "SegueDayView"
    private let segueWeekView = "SegueWeekView"
    private let segueLocationView = "SegueLocationView"
    private let segueSettingView = "SegueSettingView"
    
    //MARK: properties
    @IBOutlet private var dayViewController: DayViewController!
    @IBOutlet private var weekViewController: WeekViewController!
    
    // MARK: -
    private var currentLocation: CLLocation? {
        didSet{
            fetchWeatherData()
        }
    }
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        
        locationManager.distanceFilter = 1000
        locationManager.desiredAccuracy = 1000
        
        return locationManager
    }()
    
    
    //MARK - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the viuserInfoically from a nib.
        
        setupNotificationHandling()
    }
    
    
    //MARK: segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case segueDayView:
            guard let destination = segue.destination as? DayViewController else {
                fatalError("Unexpected Destination View Controller")
            }
            
            destination.delegate = self
            
            self.dayViewController = destination
        case segueWeekView:
            guard let destination = segue.destination as? WeekViewController else {
                fatalError("Unexpected Destination View Controller")
            }
            
            destination.delegate = self
            
            self.weekViewController = destination
        case segueLocationView:
            guard let navigationController = segue.destination as? UINavigationController else { fatalError("unexpected destination view controller") }
            
            guard let destination = navigationController.topViewController as? LocationViewController else { fatalError("unexpected destination view controller") }
            
            //configure destination
            destination.delegate = self
            destination.currentLocation = currentLocation
        case segueSettingView:
            guard let navigationController = segue.destination as? UINavigationController else { fatalError("unexpected destination view controller") }
            
            guard let destination = navigationController.topViewController as? SettingsViewController else {
                fatalError("Unexpected Destination View Controller")
            }
            
            destination.delegate = self
        default:
            break
        }
    }
    
    //MARK: function helper
    @objc func applicationDidBecomeActive(notification: Notification) {
        requestLocation()
    }
    
    private func setupNotificationHandling(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(RootViewController.applicationDidBecomeActive(notification:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    private func requestLocation() {
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //MARK: -
    private func fetchWeatherData() {
        
        guard let location = currentLocation else { return }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        APIClient.fetchWeather(latitude: latitude, longitude: longitude, success: {(json) in
            //add data here
            let weather = Weathers.init(json: json)
            self.dayViewController.now = weather
            
            self.weekViewController.week = weather.daily?.data
        })
    }
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
    }
}

extension RootViewController: WeekViewControllerDelegate {
    func controllerDidRefresh(controller: WeekViewController) {
        fetchWeatherData()
    }
}

extension RootViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        } else {
            currentLocation = CLLocation(latitude: Defaults.latitude, longitude: Defaults.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location
            
            manager.delegate = nil
            manager.stopUpdatingLocation()
        } else {
            currentLocation = CLLocation(latitude: Defaults.latitude, longitude: Defaults.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if currentLocation == nil {
            currentLocation = CLLocation(latitude: Defaults.latitude, longitude: Defaults.longitude)
        }
    }
}


extension RootViewController: DayViewControllerDelegate {
    func controllerDidTapLocationButton(controller: DayViewController) {
        performSegue(withIdentifier: segueLocationView, sender: self)
    }
    
    func controllerDidTapSettingButton(controller: DayViewController) {
        performSegue(withIdentifier: segueSettingView, sender: self)
    }
    
}

extension RootViewController: LocationViewControllerDelegate {
    func controller(_ controller: LocationViewController, didSelectLocation location: CLLocation) {
        currentLocation = location
    }
}

extension RootViewController: SettingsViewControllerDelegate {
    func controllerDidChangeTimeNotation(controller: SettingsViewController) {
        dayViewController.reloadData()
        weekViewController.reloadData()
    }
    
    func controllerDidChangeUnitsNotation(controller: SettingsViewController) {
        dayViewController.reloadData()
        weekViewController.reloadData()
    }
    
    func controllerDidChangeTemperatureNotation(controller: SettingsViewController) {
        dayViewController.reloadData()
        weekViewController.reloadData()
    }
    
    
}


