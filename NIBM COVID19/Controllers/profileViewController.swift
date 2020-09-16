//
//  profileViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
        
        

    }
    let DetailsviewController = UIView()
     
//MARK - Properties
    private lazy var nameContainerView: UIView = {
           let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), textField: nameTextFiled)
           view.heightAnchor.constraint(equalToConstant: 50).isActive = true
           return view
       }()
       
       private lazy var indexContainerView: UIView = {
           let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: indexTextFiled)
           view.heightAnchor.constraint(equalToConstant: 50).isActive = true
           return view
       }()
       
       private lazy var countryContainerView: UIView = {
           let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: countryTextFiled)
           view.heightAnchor.constraint(equalToConstant: 50).isActive = true
           return view
       }()
    
    private let nameTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Name", isSecureTextEntry: false)
    }()
    
    private let indexTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Index", isSecureTextEntry: false)
    }()
    
    private let countryTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Country", isSecureTextEntry: false)
    }()
    
    private let updateButton: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Update", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
           attributedTitle.append(NSAttributedString(string: "",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
           button.setAttributedTitle(attributedTitle, for: .normal)
           button.addTarget(self, action: #selector(UpdateActions), for: .touchUpInside)
           return button
           }()
    
    //MARK: - Selectors

    @objc func UpdateActions() {
        
        
    }
    
    
    
    func configureUI() {
        view.backgroundColor = .white
        
//        view.addSubview(titleLabel)
//        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
//        titleLabel.centerX(inView: view)
        
        view.addSubview(DetailsviewController)
        DetailsviewController.translatesAutoresizingMaskIntoConstraints = false
        DetailsviewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        DetailsviewController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        DetailsviewController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true        
        DetailsviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.4).isActive = true
        DetailsviewController.backgroundColor = .lightGray
        

        let stack = UIStackView(arrangedSubviews: [nameContainerView,indexContainerView,countryContainerView])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: DetailsviewController.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(updateButton)
        updateButton.centerX(inView: view)
        updateButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
    }

}
