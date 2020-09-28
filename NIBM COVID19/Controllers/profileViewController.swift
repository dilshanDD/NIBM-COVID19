//
//  profileViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/14/20.
//  Copyright © 2020 NIBM. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import LocalAuthentication

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
    
    private let faceIDButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Try FaceID", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    attributedTitle.append(NSAttributedString(string: "",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(handlefaceID), for: .touchUpInside)
    return button
    }()
    
    private let updateButton: UIButton = {
           let button = UIButton(type: .system)
           let attributedTitle = NSMutableAttributedString(string: "Update", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
           attributedTitle.append(NSAttributedString(string: "",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]))
           button.setAttributedTitle(attributedTitle, for: .normal)
           button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
           return button
           }()
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "UserPic")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let userTemp: UILabel = {
        let label = UILabel()
        label.text = "97 F (31.1 C)"
        label.font = UIFont(name: "Avenir-Light" , size: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Selectors

    @objc func handleLoginRegister() {
         handleRegister()
    }
    
    @objc func handlefaceID() {
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics,localizedReason: "Message") {
                (good,error) in
                if good {
                    print("Good")
                }else {
                    print("Try Again")
                }
            }
        }
     }
    
    
    func configureUI() {
        view.backgroundColor = .black
        
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
        
                
        DetailsviewController.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: DetailsviewController.topAnchor, constant: 0).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: DetailsviewController.leadingAnchor, constant: 0).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: DetailsviewController.trailingAnchor, constant: 0).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: DetailsviewController.layoutMarginsGuide.heightAnchor, multiplier: 1).isActive = true
        profileImageView.backgroundColor = .lightGray
        
        

        let stack = UIStackView(arrangedSubviews: [nameContainerView,indexContainerView,countryContainerView])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: DetailsviewController.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(updateButton)
        updateButton.centerX(inView: view)
        updateButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        
        view.addSubview(userTemp)
        userTemp.translatesAutoresizingMaskIntoConstraints = false
        userTemp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        userTemp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        userTemp.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        userTemp.topAnchor.constraint(equalTo: countryContainerView.bottomAnchor, constant: 10).isActive = true
        
        
        view.addSubview(faceIDButton)
        faceIDButton.translatesAutoresizingMaskIntoConstraints = false
        faceIDButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        faceIDButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        faceIDButton.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        faceIDButton.bottomAnchor.constraint(equalTo: updateButton.bottomAnchor, constant: -20).isActive = true
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    
}
extension profileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleRegister() {
                guard
                    let name = nameTextFiled.text,
                    let index = indexTextFiled.text,
                    let country = countryTextFiled.text else {
                    
                        print("form error ...")
                            
            let alert = UIAlertController(title: "Error", message: "All Fields must be filled !", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
             self.present(alert, animated: true)
             return
                }
       
        
        guard let uid = Service.shared.currentUid else {
                        return
                    }
        
                    //successfully authenticated user
                    let imageName = NSUUID().uuidString
                    let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
        
                    if let uploadData = self.profileImageView.image!.pngData() {
        
                        storageRef.putData(uploadData, metadata: nil, completion: { (_, err) in
        
                            if let error = err {
                                print(error)
                                return
                            }
        
                            storageRef.downloadURL(completion: { (url, err) in
                                if let err = err {
                                    print(err)
                                    return
                                }
        
                                guard let url = url else { return }
                                let values = ["name": name, "index": index, "profileImageUrl": url.absoluteString, "country":country]
        
                                self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                            })
        
                        })
                        let uialert = UIAlertController(title: "Information", message: "User data updated Successfully" , preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) {(action : UIAlertAction!) -> Void in self.navigationController!.popToRootViewController(animated: true)}
                        uialert.addAction(okAction)
                        self.present(uialert, animated: true, completion: nil)
                    }
                
    }
    
    fileprivate func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateUserProfileWithImage(imageUrl:values["profileImageUrl"] as! String, username: values["name"] as! String, uIndex: values["index"] as! String, country: values["country"] as! String)
    }
    
    @objc func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
}

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}
