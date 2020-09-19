//
//  DSurveyViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/15/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class DSurveyViewController: UIViewController {

      override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            configureNavigationBar()
            view.addSubview(descriptionTextView)
            
            setupBottomControls()
            
            setupLayout()
        
        }


     // MARK: - Properties

    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Three"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Contact!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nHave you been interract with sick peole recently ?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()


       private let noButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("NO", for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           button.setTitleColor(.mainColor, for: .normal)
        button.addTarget(self, action: #selector(NoNext), for: .touchUpInside)
           return button
       }()
       
       private let yesButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("YES", for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitleColor(.mainColor, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(YesNext), for: .touchUpInside)
           return button
       }()
     
       private let pageControl: UIPageControl = {
           let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.currentPage = 3
           
           pc.currentPageIndicatorTintColor = .mainColor
           pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
           return pc
       }()
       
     //MARK: - Functions
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    fileprivate func setupBottomControls() {
            let bottomControlsStackView = UIStackView(arrangedSubviews: [noButton, pageControl, yesButton])
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.distribution = .fillEqually
            
            view.addSubview(bottomControlsStackView)
            
            NSLayoutConstraint.activate([
                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
                ])
        }
        
        private func setupLayout() {
            let topImageContainerView = UIView()
            view.addSubview(topImageContainerView)
            topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
            
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            topImageContainerView.addSubview(bearImageView)
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
           
          
        }
    
     //MARK: - Selectors
    
    @objc func YesNext() {
               handleYESQD()
               let closeV = homeViewController()
        
                let uialert = UIAlertController(title: "Information", message: "Survey updated Successfully" , preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) {(action : UIAlertAction!) -> Void in self.navigationController!.pushViewController(closeV, animated: true)}
                uialert.addAction(okAction)
                self.present(uialert, animated: true, completion: nil)
        
        
                }
           
           @objc func NoNext() {
               handleNOQD()
               let closeV = homeViewController()
               
               let uialert = UIAlertController(title: "Information", message: "Survey updated Successfully" , preferredStyle: UIAlertController.Style.alert)
               let okAction = UIAlertAction(title: "OK", style: .default) {(action : UIAlertAction!) -> Void in self.navigationController!.pushViewController(closeV, animated: true)}
               uialert.addAction(okAction)
               self.present(uialert, animated: true, completion: nil)
               
           }
}

extension DSurveyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleYESQD() {
                        var QD: Int?
                            QD = 10
                        guard let uid = Service.shared.currentUid else {
                        return
                        }
                          let values = ["QD": QD]
                          self.registerYesQDWithUID(uid, values: values as [String : AnyObject])
                        }
    func handleNOQD() {
                        var QD: Int?
                            QD = 5
                        guard let uid = Service.shared.currentUid else {
                        return
                        }
                          let values = ["QD": QD]
                          self.registerYesQDWithUID(uid, values: values as [String : AnyObject])
                        }
    
    
    fileprivate func registerYesQDWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateQD(QD:values["QD"] as! Int)
    }

}

