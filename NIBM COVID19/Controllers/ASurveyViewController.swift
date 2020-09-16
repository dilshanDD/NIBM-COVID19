//
 //  ASafeViewController.swift
 //  NIBM COVID19
 //
 //  Created by DilshanKumarasingheMac on 9/15/20.
 //  Copyright © 2020 NIBM. All rights reserved.
 //


import UIKit

class ASurveyViewController: UIViewController {

            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .white
         
                view.addSubview(descriptionTextView)
                
                setupBottomControls()
                
                setupLayout()
                
              
            }
        

         // MARK: - Properties

        let bearImageView: UIImageView = {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "1"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let descriptionTextView: UITextView = {
            let textView = UITextView()
            
            let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            textView.attributedText = attributedText
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textAlignment = .center
            textView.isEditable = false
            textView.isScrollEnabled = false
            return textView
        }()
       
        
           private let previousButton: UIButton = {
               let button = UIButton(type: .system)
               button.setTitle("PREV", for: .normal)
               button.translatesAutoresizingMaskIntoConstraints = false
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
               button.setTitleColor(.gray, for: .normal)
               return button
           }()
           
           private let nextButton: UIButton = {
               let button = UIButton(type: .system)
               button.setTitle("NEXT", for: .normal)
               button.translatesAutoresizingMaskIntoConstraints = false
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
               button.setTitleColor(.mainPink, for: .normal)
               return button
           }()
           
           private let pageControl: UIPageControl = {
               let pc = UIPageControl()
               pc.currentPage = 0
               pc.numberOfPages = 4
               pc.currentPageIndicatorTintColor = .mainPink
               pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
               return pc
           }()
           
         //MARK: - Functions
        fileprivate func setupBottomControls() {
                let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
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
        
    }
    extension UIColor {
        static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    }


