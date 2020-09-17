//
//  signUpViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/11/20.
//  Copyright © 2020 NIBM. All rights reserved.
//
import FirebaseAuth
import FirebaseDatabase
import Firebase
import UIKit
import GeoFire

class signUpViewController: UIViewController {
  
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()   }
    
    
    
    // MARK: - Properties
    
    private var location = LocationHandler.shared.locationManager.location
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "SignUp"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        return label
    }()
   
    private lazy var firstNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: firstNameTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var lastNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: lastNameTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()

    private lazy var roleContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), segentedControl: roleSelectControl)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()

    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextFiled)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    

    private let firstNameTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "First Name", isSecureTextEntry: false)
    }()
    
    private let lastNameTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Last Name", isSecureTextEntry: false)
    }()
    private let emailTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    

    
    private let passwordTextFiled: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()

    private let roleSelectControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Student","Lecturer","Guest"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white: 1, alpha: 0.87)
        sc.selectedSegmentIndex = 0
        
        return sc
    }()
    
    private let signUpButton: AuthButtonUIButton = {
        let button = AuthButtonUIButton(type: .system)
        button.setTitle("SignUp", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    // MARK: - Helper Function
    
    func uploadUserDataController(uid: String, values: [String: Any]) {
        REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
                    
          // self.handleShowLogIn()
          
        }
    }
    
    
    
    func configureUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [firstNameContainerView,lastNameContainerView,passwordContainerView,emailContainerView,roleContainerView,signUpButton ])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
    }
    
    // MARK: - Selectors
       
       @objc func handleShowLogIn() {
           navigationController?.popViewController(animated: true)
       }
    
       @objc func handleSignUp() {
         print("Signup clicked !!")
        
         guard let firstName = firstNameTextFiled.text else { return }
         guard let lastName = lastNameTextFiled.text else { return }
         guard let password = passwordTextFiled.text else { return }
         guard let email = emailTextFiled.text else { return }
         let role = roleSelectControl.selectedSegmentIndex
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        if let error = error {
            print("Faild to register user with error \(error)")
            return
        }
        guard let uid = result?.user.uid else { return }
            
        let values = [
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "email": email,            
            "role": role
        ] as [String : Any]
      
             let geoFire = GeoFire(firebaseRef: REF_USER_LOCATIONS)
           
            guard let location = self.location else { return }

                       geoFire.setLocation(location, forKey: uid, withCompletionBlock: { (error) in
                            
                           self.uploadUserDataController(uid: uid, values: values)
                           if let error = error {
                               print("DEBUG: fail to save loc \(error)")
                               return
                           }

                       })
                       
                        self.uploadUserDataController(uid: uid, values: values)
                   

       //  Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
//           print("Successfuly Registerd and save data..")
//       }
     } 
    
}
}
