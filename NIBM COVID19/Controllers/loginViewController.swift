//
//  loginViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/11/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

      
      // MARK: - Lifecycle
      override func viewDidLoad() {
          super.viewDidLoad()
        view.backgroundColor = .backgroundColor
          
          
          view.addSubview(titleLabel)
          titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
          titleLabel.centerX(inView: view)
          
          view.addSubview(emailContainerView)
          emailContainerView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16, height: 50)
          
          view.addSubview(passwordContainerView)
          passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 50)


          let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
                  stack.axis = .vertical
                  stack.distribution = .fillEqually
                  stack.spacing = 16
                  
                  view.addSubview(stack)
                  stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)

        
          view.addSubview(dontHaveAccountButton)
          dontHaveAccountButton.centerX(inView: view)
          dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
        configureNavigationBar()
      }
     
    
      // MARK: - Propeties
      private let titleLabel: UILabel = {
          let label = UILabel()
          label.text = "Sign in"
          label.font = UIFont(name: "Avenir-Light", size: 36)
          label.textColor = UIColor(white: 1, alpha: 0.8)
          
          return label
      }()
      
     private lazy var emailContainerView: UIView = {
                 let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled as! UITextField)
                 view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                 return view
                 }()
      
      private let emailTextFiled: UIView = {
                  return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
                 }()
      
      private lazy var passwordContainerView: UIView = {
                 let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled as! UITextField)
                 view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                 return view
                 }()

      private let passwordTextFiled: UIView = {
                  return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
                 }()
      
      private let loginButton: UIButton = {
                 let button = UIButton(type: .system)
                 button.setTitle("Log In", for: .normal)
                 button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .mainBlueTint
                 button.layer.cornerRadius = 5
                 button.heightAnchor.constraint(equalToConstant: 50).isActive = true
             
             return button
         }()
      
      let dontHaveAccountButton: UIButton = {
              let button = UIButton(type: .system)
              let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
              
              attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
          
              button.setAttributedTitle(attributedTitle, for: .normal)
              button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
              return button
      }()
      
      //MARK: - Helper Functions
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
      //MARK: - Functions
      
      @objc func handleShowSignUp() {
          let signUp = signUpViewController()
          navigationController?.pushViewController(signUp, animated: true)
          
      }
}
