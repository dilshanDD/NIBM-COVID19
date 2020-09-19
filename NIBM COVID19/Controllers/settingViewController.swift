//
//  settingViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore

class settingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
       configureUI()
        

      
    }
    //Main Controllers
      let labelviewController = UIView()
      let profileviewController = UIView()
      let contactviewController = UIView()
      let shareviewController = UIView()
    
    
 
    // MARK: - Propeties
    private let goProfilePicture = UIImageView(image: #imageLiteral(resourceName: "pngwave"))
    private let goContactUsPicture = UIImageView(image: #imageLiteral(resourceName: "pngwave"))
    private let goSharePicture = UIImageView(image: #imageLiteral(resourceName: "pngwave"))
    
    private let titleLabel: UILabel = {
     let label = UILabel()
     label.text = "Settings"
     label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = .black
     
     return label
 }()
    
   
    
    private let profileButton: UIButton = {
       let button = UIButton(type: .system)
       let attributedTitle = NSMutableAttributedString(string: "Profile", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
       attributedTitle.append(NSAttributedString(string: ".................................................",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
       button.setAttributedTitle(attributedTitle, for: .normal)
       button.addTarget(self, action: #selector(goProfileActions), for: .touchUpInside)
       return button
           }()

    private let contactButton: UIButton = {
          let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Contact Us / About Us", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
           attributedTitle.append(NSAttributedString(string: "......................",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
           button.setAttributedTitle(attributedTitle, for: .normal)
           button.addTarget(self, action: #selector(goContactActions), for: .touchUpInside)
           return button
           }()
    
    private let shareButton: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Share with friends", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
           attributedTitle.append(NSAttributedString(string: "......................",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
           button.setAttributedTitle(attributedTitle, for: .normal)
           button.addTarget(self, action: #selector(goShareActions), for: .touchUpInside)
           return button
           }()
    
// Logout ............
    private let logoutButton: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Logout", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
           attributedTitle.append(NSAttributedString(string: "",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
           button.setAttributedTitle(attributedTitle, for: .normal)
           button.addTarget(self, action: #selector(goLogoutActions), for: .touchUpInside)
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
    
    
       @objc func goProfileActions() {
           let profile = profileViewController()
           navigationController?.pushViewController(profile, animated: true)
           
       }
    
    @objc func goContactActions() {
              let contact = contactUsViewController()
              navigationController?.pushViewController(contact, animated: true)
              
          }
    @objc func goShareActions() {
              let share = shareViewController()
              navigationController?.pushViewController(share, animated: true)
              
          }
    @objc func goLogoutActions(){
  
            do {
                try Auth.auth().signOut()
             print("Signout !");
            } catch {
                print("DEBUG: sign out error")
            }            
               
            DispatchQueue.main.async {
             let nav = UINavigationController(rootViewController: homeViewController())
             nav.modalPresentationStyle = .fullScreen
             self.present(nav, animated: true, completion: nil)
                     }
          
         }
   
    
    @objc func Back() {
       navigationController?.popViewController(animated: true)
          }
//MARK: - Helper Functions
    
  func  configureUI()
{
        view.addSubview(labelviewController)
            labelviewController.translatesAutoresizingMaskIntoConstraints = false
            labelviewController.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
            labelviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
            labelviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
            labelviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        
        view.addSubview(profileviewController)
             profileviewController.translatesAutoresizingMaskIntoConstraints = false
             profileviewController.topAnchor.constraint(equalTo: labelviewController.bottomAnchor, constant: 0).isActive = true
             profileviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
             profileviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
             profileviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        
        
    view.addSubview(contactviewController)
              contactviewController.translatesAutoresizingMaskIntoConstraints = false
              contactviewController.topAnchor.constraint(equalTo: profileviewController.bottomAnchor, constant: 0).isActive = true
              contactviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
              contactviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
              contactviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
              
        
        view.addSubview(shareviewController)
            shareviewController.translatesAutoresizingMaskIntoConstraints = false
            shareviewController.topAnchor.constraint(equalTo: contactviewController.bottomAnchor, constant: 0).isActive = true
            shareviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
            shareviewController.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
            shareviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
           
        
//.........Buttons

        
        labelviewController.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        profileviewController.addSubview(profileButton)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.topAnchor.constraint(equalTo: profileviewController.topAnchor, constant: 0).isActive = true
        profileButton.leadingAnchor.constraint(equalTo: profileviewController.leadingAnchor).isActive = true
        
        contactviewController.addSubview(contactButton)
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.topAnchor.constraint(equalTo: contactviewController.topAnchor, constant: 0).isActive = true
        contactButton.leadingAnchor.constraint(equalTo: contactviewController.leadingAnchor).isActive = true

        shareviewController.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.topAnchor.constraint(equalTo: shareviewController.topAnchor, constant: 0).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: shareviewController.leadingAnchor).isActive = true
        
//...Images..............
        
        profileviewController.addSubview(goProfilePicture)
        goProfilePicture.translatesAutoresizingMaskIntoConstraints = false
        goProfilePicture.topAnchor.constraint(equalTo: profileviewController.topAnchor, constant: 0).isActive = true
        goProfilePicture.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        goProfilePicture.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.1).isActive = true
        goProfilePicture.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        contactviewController.addSubview(goContactUsPicture)
        goContactUsPicture.translatesAutoresizingMaskIntoConstraints = false
        goContactUsPicture.topAnchor.constraint(equalTo: contactviewController.topAnchor, constant: 0).isActive = true
        goContactUsPicture.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        goContactUsPicture.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.1).isActive = true
        goContactUsPicture.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        shareviewController.addSubview(goSharePicture)
        goSharePicture.translatesAutoresizingMaskIntoConstraints = false
        goSharePicture.topAnchor.constraint(equalTo: shareviewController.topAnchor, constant: 0).isActive = true
        goSharePicture.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
        goSharePicture.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.1).isActive = true
        goSharePicture.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06).isActive = true
        
        view.addSubview(logoutButton)
        logoutButton.centerX(inView: view)
        logoutButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
        
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        

    
        
    }
    
}
