//
//  BSurveyViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/15/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class BSurveyViewController: UIViewController {
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
        
        let attributedText = NSMutableAttributedString(string: "People!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "\n\n\n Have you been travelling in between last 14 days ?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
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
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           button.setTitleColor(.mainColor, for: .normal)
           button.addTarget(self, action: #selector(YesNext), for: .touchUpInside)
           return button
       }()
       
       private let pageControl: UIPageControl = {
           let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.currentPage = 1
           
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
        handleYESQB()
        let C = CSurveyViewController()
        navigationController?.pushViewController(C, animated: true)
         }
    
    @objc func NoNext() {
        handleNOQB()
        let C = CSurveyViewController()
        navigationController?.pushViewController(C, animated: true)
        
    }
    
    
    
    @objc func Back() {
                navigationController?.popViewController(animated: true)
                   }
            
 }
        
extension BSurveyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleYESQB() {
                        var QB: Int?
                            QB = 10
                        guard let uid = Service.shared.currentUid else {
                        return
                        }
                          let values = ["QB": QB]
                          self.registerYesQBWithUID(uid, values: values as [String : AnyObject])
                        }
    func handleNOQB() {
                        var QB: Int?
                            QB = 5
                        guard let uid = Service.shared.currentUid else {
                        return
                        }
                          let values = ["QB": QB]
                          self.registerYesQBWithUID(uid, values: values as [String : AnyObject])
                        }
    
    
    fileprivate func registerYesQBWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateQB(QB:values["QB"] as! Int)
    }

}

