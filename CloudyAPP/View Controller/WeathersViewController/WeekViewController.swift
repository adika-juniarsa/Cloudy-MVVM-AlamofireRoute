//
//  WeekViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import Foundation
import UIKit

protocol WeekViewControllerDelegate {
    func controllerDidRefresh(controller: WeekViewController)
}

class WeekViewController: WeatherViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: WeekViewControllerDelegate?
    
    var week: [Data]?{
        didSet{
            updateView()
        }
    }
    
    //MARK : -
    private lazy var dayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter
    }()
    
    //MARK : view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - public interface
    override func reloadData() {
        updateView()
    }
    
    //MARK : -
    private func setupTableView() {
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
    private func updateView(){
        inditicatorView.stopAnimating()
        tableView.refreshControl?.endRefreshing()
        
        if let week = week {
            updateWeatherDataContainer(withWeatherData: week)
        } else {
            //was unable to fetch weather data
        }
    }
    
    private func setupRefreshControl() {
        //initialize refresh control
        let refreshControl = UIRefreshControl()
        
        //configure refresh control
        refreshControl.addTarget(self, action: #selector(WeekViewController.didRefresh(sender:)), for: .valueChanged)
        
        //update table view
        tableView.refreshControl = refreshControl
    }
    
    
    private func setupView() {
        setupTableView()
        setupRefreshControl()
    }
    
    // MARK: - Actions
    
    @objc func didRefresh(sender: UIRefreshControl) {
        delegate?.controllerDidRefresh(controller: self)
    }
    
    private func updateWeatherDataContainer(withWeatherData weatherData: [Data]) {
        containerView.isHidden = false
        tableView.reloadData()
    }
}


extension WeekViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return week == nil ? 0:1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let week = week else { return 0 }
        return week.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DayViewTableViewCell.reuseIdentifier, for: indexPath) as? DayViewTableViewCell else { fatalError("unexpected table view cell")}
        
        if let week = week {
            let modelView = WeekModelView.init(data: week[indexPath.row])
            
            cell.dayLabel.text = modelView.date
            cell.dateLabel.text = modelView.time
            cell.temperatureLabel.text = modelView.temperature
            cell.windSpeedLabel.text = modelView.windSpeed
            cell.iconImageView.image = modelView.image
        }
        
        return cell
    }
}

