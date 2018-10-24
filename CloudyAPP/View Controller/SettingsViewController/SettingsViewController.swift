//
//  SettingsViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func controllerDidChangeTimeNotation(controller: SettingsViewController)
    func controllerDidChangeUnitsNotation(controller: SettingsViewController)
    func controllerDidChangeTemperatureNotation(controller: SettingsViewController)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Settings"
        
        setupView()
    }
    
    private func setupView() {
        setupTableView()
    }
    
    private func updateView(){
    }
    
    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    private enum Section: Int {
        case time
        case units
        case temperature
        
        var numberOfRows: Int {
            return 2
        }
        
        static var count: Int {
            return (Section.temperature.rawValue + 1)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { fatalError("Unexpected Section") }
        return section.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {fatalError("Unexpected Section")}
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else {fatalError("Unexpected Table View Cell")}
        
        switch section {
        case .time:
            cell.nameLabel.text = (indexPath.row == 0) ? "12 Hour" : "24 Hour"
            
            let timeNotation = UserDefaults.timeNotation()
            if indexPath.row == timeNotation.rawValue {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        case .units:
            cell.nameLabel.text = (indexPath.row == 0) ? "Imperial" : "Metric"
            
            let unitNotation = UserDefaults.unitsNotation()
            if indexPath.row == unitNotation.rawValue {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        case .temperature:
            cell.nameLabel.text = (indexPath.row == 0) ? "Fahrenheit" : "Celcius"
            
            let temperatureNotation = UserDefaults.temperatureNotation()
            if indexPath.row == temperatureNotation.rawValue {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let section = Section(rawValue: indexPath.section) else {fatalError("Unexpected Section")}
        
        switch section {
        case .time:
            let timeNotation = UserDefaults.timeNotation()
            guard indexPath.row != timeNotation.rawValue else { return }
            
            if let newTimeNotation = TimeNotation(rawValue: indexPath.row){
                UserDefaults.setTimeNotation(timeNotation: newTimeNotation)
                delegate?.controllerDidChangeTimeNotation(controller: self)
            }
        case .units:
            let unitNotation = UserDefaults.unitsNotation()
            guard indexPath.row != unitNotation.rawValue else {return}
            
            if let newUnitNotation = UnitsNotation(rawValue: indexPath.row){
                UserDefaults.setUnitsNotation(unitsNotation: newUnitNotation)
                delegate?.controllerDidChangeUnitsNotation(controller: self)
            }
        case .temperature:
            let temperatureNotation = UserDefaults.temperatureNotation()
            guard indexPath.row != temperatureNotation.rawValue else {return}
            
            if let newTemperatureNotation = TemperatureNotation(rawValue: indexPath.row){
                UserDefaults.setTemperatureNotation(temperatureNotation: newTemperatureNotation)
                delegate?.controllerDidChangeTemperatureNotation(controller: self)
            }
        }
        
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .none)
    }

}
