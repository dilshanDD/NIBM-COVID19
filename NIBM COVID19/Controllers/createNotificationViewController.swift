//
//  createNotificationViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class createNotificationViewController: UIViewController {

       override func viewDidLoad() {
            super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
           

    
}
     
    func configUI() {
        //Back Button -...........
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            
        view.addSubview(NotiText)
        NotiText.translatesAutoresizingMaskIntoConstraints = false
        NotiText.topAnchor.constraint(equalTo: closeButton.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        NotiText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
            
        view.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.topAnchor.constraint(equalTo: NotiText.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        updateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 90).isActive = true
        
    }
    
        
    //MARK: - Selectors
    @objc func Back() {
    navigationController?.popViewController(animated: true)
       }
    
    
    //MARK: - Properties
   private let closeButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitle("Back", for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
       button.setTitleColor(.gray, for: .normal)
       button.addTarget(self, action: #selector(Back), for: .touchUpInside)
    
       return button
   }()
        let NotiText: UITextField = {
         let text = UITextField()
             text.placeholder = "Write Notification"
        
             return text
         }()
         
         private let updateButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSMutableAttributedString(string: "Post", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black])
            attributedTitle.append(NSAttributedString(string: " ",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.addTarget(self, action: #selector(handleNotifications), for: .touchUpInside)
            return button
                }()
        
           @objc func handleShowLogIn() {
               navigationController?.popViewController(animated: true)
           }
        
          @objc func handleNotifications() {
                  guard let notification = NotiText.text else { return }
           
                      let values = [
                          "notification": notification] as [String : Any]
                      
           
            Database.database().reference().child("notification").childByAutoId().setValue(values) { (error, ref) in
                            
                          let uialert = UIAlertController(title: "Information", message: "Notification created Successfully" , preferredStyle: UIAlertController.Style.alert)
                          let okAction = UIAlertAction(title: "OK", style: .default) {(action : UIAlertAction!) -> Void in self.navigationController!.popToRootViewController(animated: true)}
                          uialert.addAction(okAction)
                          self.present(uialert, animated: true, completion: nil)
                      }
                  }
}
    
    
    


