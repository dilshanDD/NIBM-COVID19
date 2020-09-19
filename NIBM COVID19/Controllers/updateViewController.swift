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
    let tempviewController = UIView()

    // MARK: - Propeties
    private let goProfilePicture = UIImageView(image: #imageLiteral(resourceName: "pngwave"))
    
    private let tempLabel: UILabel = {
       let label = UILabel()
       label.text = "97F(31.1 C)"
       label.font = UIFont(name: "Avenir-Light", size: 32)
           label.textColor = UIColor.black
       return label
       }()
       
       let tempText: UITextField = {
       let text = UITextField()
           text.placeholder = "Enter temparature"
      
           return text
       }()
       
       private let updateButton: UIButton = {
          let button = UIButton(type: .system)
          let attributedTitle = NSMutableAttributedString(string: "update", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
          attributedTitle.append(NSAttributedString(string: " ",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
          button.setAttributedTitle(attributedTitle, for: .normal)
          button.addTarget(self, action: #selector(handleTempRegister), for: .touchUpInside)
          return button
              }()
    
    
    
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
        let close = homeViewController()
               navigationController?.pushViewController(close, animated: true)
                   }
    

    @objc func handleTempRegister() {
         handleTemparature()
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

        //      tempviewController
            view.addSubview(tempviewController)
            tempviewController.translatesAutoresizingMaskIntoConstraints = false
            tempviewController.topAnchor.constraint(equalTo: newSurveyviewController.bottomAnchor, constant: 0).isActive = true
            tempviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
           
            tempviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true

            tempviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.4).isActive = true
            
            
        //....Text Label
            
            tempviewController.addSubview(tempLabel)
             tempLabel.translatesAutoresizingMaskIntoConstraints = false
             tempLabel.topAnchor.constraint(equalTo: tempviewController.topAnchor, constant: 0).isActive = true
            
             tempLabel.leadingAnchor.constraint(equalTo: tempviewController.layoutMarginsGuide.leadingAnchor, constant: 70).isActive = true

            tempLabel.widthAnchor.constraint(equalTo: tempviewController.layoutMarginsGuide.heightAnchor, multiplier: 0.8).isActive = true
           
         //...temp Text
            
            tempviewController.addSubview(tempText)
             tempText.translatesAutoresizingMaskIntoConstraints = false
             tempText.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20).isActive = true
            
             tempText.leadingAnchor.constraint(equalTo: tempviewController.layoutMarginsGuide.leadingAnchor, constant: 70).isActive = true

            tempText.widthAnchor.constraint(equalTo: tempviewController.layoutMarginsGuide.heightAnchor, multiplier: 0.8).isActive = true
        //.....updateButton
            
            tempviewController.addSubview(updateButton)
             updateButton.translatesAutoresizingMaskIntoConstraints = false
             updateButton.topAnchor.constraint(equalTo: tempText.bottomAnchor, constant: 20).isActive = true
            
             updateButton.leadingAnchor.constraint(equalTo: tempviewController.layoutMarginsGuide.leadingAnchor, constant: 50).isActive = true

            updateButton.widthAnchor.constraint(equalTo: tempviewController.layoutMarginsGuide.heightAnchor, multiplier: 0.8).isActive = true
    }
    
}
extension updateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleTemparature() {
                guard
                    let temparature = tempText.text else {
                        print("Error")
                        return
        }
    
        guard let uid = Service.shared.currentUid else {
                        return
                    }
                      let values = ["temparature": temparature]
                      self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])

                        let uialert = UIAlertController(title: "Information", message: "Temparature updated Successfully" , preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) {(action : UIAlertAction!) -> Void in self.navigationController!.popToRootViewController(animated: true)}
                        uialert.addAction(okAction)
                        self.present(uialert, animated: true, completion: nil)
                    
                
    }
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateUserTemparature(temparature:values["temparature"] as! String)
    }

}

