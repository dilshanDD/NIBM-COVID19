//
//  loginViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/11/20.
//  Copyright © 2020 NIBM. All rights reserved.
//
import Firebase
import FirebaseDatabase
import FirebaseAuth
import UIKit

class loginViewController: UIViewController {

      
      // MARK: - Lifecycle
      override func viewDidLoad() {
          super.viewDidLoad()
       configureUI()
                 
        
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
                 let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled)
                 view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                 return view
                 }()
    
      private lazy var passwordContainerView: UIView = {
                 let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled )
                 view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                 return view
                 }()
    
      private let emailTextFiled: UITextField = {
                  return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
                 }()
    
      private let passwordTextFiled: UITextField = {
                  return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
                 }()
      
      
        private let signInButton: AuthButtonUIButton = {
                let button = AuthButtonUIButton(type: .system)
                button.setTitle("Sign In", for: .normal)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
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
      

    // MARK: - Helper Function
    
    func configureUI() {
        
        configureNavigationBar()
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews:
        [emailContainerView, passwordContainerView, signInButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
    

    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
      //MARK: - Selectors
      
      @objc func handleShowSignUp() {
          let signUp = signUpViewController()
          navigationController?.pushViewController(signUp, animated: true)
          
      }
    
    @objc func handleSignIn() {
        guard let email = emailTextFiled.text else { return }
        guard let password = passwordTextFiled.text else { return }
        print("Login Clicked !")
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Faild to log user with error \(error)")
                return
            }
        
//            let keyWindow = UIApplication.shared.connectedScenes
//            .filter({$0.activationState == .foregroundActive})
//            .map({$0 as? UIWindowScene})
//            .compactMap({$0})
//            .first?.windows
//            .filter({$0.isKeyWindow}).first
//
//            guard let controller = keyWindow?.rootViewController as? homeViewController else { return }
//            controller.configureUI()
            
            self.dismiss(animated: true, completion: nil)
            print("Login Successful..")
            
        }
    }
    
}
