//
//  DayViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol DayViewControllerDelegate {
    func controllerDidTapLocationButton(controller: DayViewController)
    func controllerDidTapSettingButton(controller: DayViewController)
}

class DayViewController: WeatherViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var desctriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var delegate: DayViewControllerDelegate?
    
    var now: Weathers?{
        didSet{
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func reloadData() {
        updateView()
    }
    
    private func setupView(){
    }
    

    //Mark: function
    private func weatherDataContainer(withData data:Weathers){
        inditicatorView.stopAnimating()
        containerView.isHidden = false
        
        //mvvm
        let viewModel = DayViewViewModel(currently: data.currently!)
        
        //set data to view
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        windSpeedLabel.text = viewModel.windSpeed
        temperatureLabel.text = viewModel.temperature
        desctriptionLabel.text = viewModel.summary
        iconImageView.image = viewModel.image
        
    }
    
    private func updateView() {
        if let now = now {
            weatherDataContainer(withData: now)
        }else{
            //cloudy was unable to fetch weather data
        }
    }

    @IBAction func didTapButtonSetting(_ sender: UIButton) {
        delegate?.controllerDidTapSettingButton(controller: self)
    }
    
    @IBAction func didTapButtonLocation(_ sender: UIButton) {
        delegate?.controllerDidTapLocationButton(controller: self)
    }
    
    
}
