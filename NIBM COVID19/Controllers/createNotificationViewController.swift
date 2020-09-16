//
//  createNotificationViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class createNotificationViewController: UIViewController {

       override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white

    //Back Button -...........
    view.addSubview(closeButton)
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        }
        
        
        //MARK: - Properties
        
        private let closeButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Home", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.setTitleColor(.gray, for: .normal)
            button.addTarget(self, action: #selector(Back), for: .touchUpInside)
         
            return button
        }()
        
        //MARK: - Selectors
        @objc func Back() {
        navigationController?.popViewController(animated: true)
           }

    }

