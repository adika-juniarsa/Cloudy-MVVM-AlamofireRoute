//
//  WeatherViewController.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var inditicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func reloadData() {
        
    }
    
    private func setupView() {
        containerView.isHidden = true
        inditicatorView.startAnimating()
    }
    
}
