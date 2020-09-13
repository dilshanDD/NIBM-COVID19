//
//  settingViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homepicview)
            homepicview.translatesAutoresizingMaskIntoConstraints = false
            homepicview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            homepicview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
            homepicview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
            homepicview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
            homepicview.backgroundColor = .red
       
    }
       let homepicview = UIView()


}
