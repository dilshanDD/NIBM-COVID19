//
//  CSafeActionViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/15/20.
//  Copyright © 2020 NIBM. All rights reserved.
//
//1.Stay at least 6 feet (about 2 arms’ length) from other people.
//2. Cover your cough or sneeze with a tissue, then throw the tissue in the trash and wash your hands.
//3. When in public, wear a cloth face covering over your nose and mouth.
//4. Do not touch your eyes, nose, and mouth.
//5. Clean and disinfect
//frequently touched objects and surfaces.
//6. Stay at home when you are sick, except to get medical care.
//
//6.Stay home when you are sick, except to get medical care.
//7. Wash your hands often with soap and water for at least 20 seconds.
import UIKit

class CSafeActionViewController: UIViewController {

        // let's avoid polluting viewDidLoad
        // {} is referred to as closure, or anon. functions
        let bearImageView: UIImageView = {
            let imageView = UIImageView(image: #imageLiteral(resourceName: "3"))
            // this enables autolayout for our imageView
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let descriptionTextView: UITextView = {
            let textView = UITextView()
            
            let attributedText = NSMutableAttributedString(string: "Wear masks!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
            
            attributedText.append(NSAttributedString(string: "\n\n\nWhen in public, wear a cloth face covering over your nose and mouth.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            textView.attributedText = attributedText
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.textAlignment = .center
            textView.isEditable = false
            textView.isScrollEnabled = false
            return textView
        }()
        
        // make sure you apply the correct encapsulation principles in your classes
        private let previousButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("PREV", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)            
            button.setTitleColor(.SafemainPink, for: .normal)
            button.addTarget(self, action: #selector(Back), for: .touchUpInside)
            return button
        }()
        
        private let nextButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("NEXT", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(.SafemainPink, for: .normal)
            button.addTarget(self, action: #selector(DSafe), for: .touchUpInside)
            return button
        }()
        
        private let pageControl: UIPageControl = {
            let pc = UIPageControl()
            pc.numberOfPages = 7
            pc.currentPage = 2
            
            pc.currentPageIndicatorTintColor = .SafemainPink
            pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
            return pc
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // here's our entry point into our app
    //        view.addSubview(bearImageView)
            view.addSubview(descriptionTextView)
            view.backgroundColor = .white
            setupBottomControls()
            
            setupLayout()
        }
        
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
    //        topImageContainerView.backgroundColor = .blue
            view.addSubview(topImageContainerView)
            //enable auto layout
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
     @objc func DSafe() {
         let D = DSafeActionViewController()
         navigationController?.pushViewController(D, animated: true)
         
     }
    @objc func Back() {
                navigationController?.popViewController(animated: true)
                   }
     

    }


