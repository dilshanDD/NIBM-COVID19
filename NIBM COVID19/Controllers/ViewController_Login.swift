//
//  ViewController_Login.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/8/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class ViewController_Login: UIViewController {
   // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with Email"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private let emailContainerView: UIView = {
        let view = UIView()
        
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        return view
    }()

    private let emailTextFiled: UIView = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        return tf
    }()
    // MARK: - Lifecycale
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        
        view.addSubview(emailContainerView)
         emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 50)
        
        
        
        
    }
    

   
    
   

}
