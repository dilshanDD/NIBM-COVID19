//
//  updateViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class updateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configures()
     }
    
    //Main Controllers
    let labelviewController = UIView()
    let createNotificationviewController = UIView()
    let newSurveyviewController = UIView()

    // MARK: - Propeties
    private let goProfilePicture = UIImageView(image: #imageLiteral(resourceName: "pngwave"))
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Update +"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = .black
        
        return label
    }()
       
       private let notificationButton: UIButton = {
          let button = UIButton(type: .system)
          let attributedTitle = NSMutableAttributedString(string: "Create Notification", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
          attributedTitle.append(NSAttributedString(string: "........................",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
          button.setAttributedTitle(attributedTitle, for: .normal)
          button.addTarget(self, action: #selector(goNotificationActions), for: .touchUpInside)
          return button
              }()
    
        private let surveyButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "New Survey", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "........................",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(goNewSurveyActions), for: .touchUpInside)
        return button
            }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(Back), for: .touchUpInside)
     
        return button
    }()
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .black
    }
    
    
    //MARK: - Selectors

    @objc func goNotificationActions() {
        let notification = createNotificationViewController()
        navigationController?.pushViewController(notification, animated: true)
        
    }
    
    @objc func goNewSurveyActions() {
        let A = ASurveyViewController()
        navigationController?.pushViewController(A, animated: true)
        
    }
    @objc func Back() {
                navigationController?.popViewController(animated: true)
                   }
     
    //MARK: - Helper Functions
    
    func configures()
    {
        view.addSubview(labelviewController)
            labelviewController.translatesAutoresizingMaskIntoConstraints = false
            labelviewController.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
            labelviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
            labelviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
            labelviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        
        view.addSubview(createNotificationviewController)
             createNotificationviewController.translatesAutoresizingMaskIntoConstraints = false
             createNotificationviewController.topAnchor.constraint(equalTo: labelviewController.bottomAnchor, constant: 0).isActive = true
             createNotificationviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
             createNotificationviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
             createNotificationviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
         
         view.addSubview(newSurveyviewController)
         newSurveyviewController.translatesAutoresizingMaskIntoConstraints = false
         newSurveyviewController.topAnchor.constraint(equalTo: createNotificationviewController.bottomAnchor, constant: 0).isActive = true
         newSurveyviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
         newSurveyviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
         newSurveyviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
         
         //.........Buttons

         
         labelviewController.addSubview(titleLabel)
         titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
         titleLabel.centerX(inView: view)
         
         createNotificationviewController.addSubview(notificationButton)
         notificationButton.translatesAutoresizingMaskIntoConstraints = false
         notificationButton.topAnchor.constraint(equalTo: createNotificationviewController.topAnchor, constant: 0).isActive = true
         notificationButton.leadingAnchor.constraint(equalTo: createNotificationviewController.leadingAnchor).isActive = true
         
         newSurveyviewController.addSubview(surveyButton)
         surveyButton.translatesAutoresizingMaskIntoConstraints = false
         surveyButton.topAnchor.constraint(equalTo: newSurveyviewController.topAnchor, constant: 0).isActive = true
         surveyButton.leadingAnchor.constraint(equalTo: newSurveyviewController.leadingAnchor).isActive = true
         
         
         //Back Button -...........
         view.addSubview(closeButton)
         closeButton.translatesAutoresizingMaskIntoConstraints = false
         closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
         closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true

        
    }
    
}
