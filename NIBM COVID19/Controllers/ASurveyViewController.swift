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
                let imageView = UIImageView(image: #imageLiteral(resourceName: "One"))
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleAspectFit
                return imageView
            }()

            let descriptionTextView: UITextView = {
                let textView = UITextView()
                
                let attributedText = NSMutableAttributedString(string: "Are you having any symptoms above ?", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
                
                attributedText.append(NSAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray]))
                
                textView.attributedText = attributedText
                textView.translatesAutoresizingMaskIntoConstraints = false
                textView.textAlignment = .center
                textView.isEditable = false
                textView.isScrollEnabled = false
                return textView
            }()

             //   var QA: Int?
               private let noButton: UIButton = {
                   let button = UIButton(type: .system)
                   button.setTitle("NO", for: .normal)
                   button.translatesAutoresizingMaskIntoConstraints = false
                   button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                   button.addTarget(self, action: #selector(NoNext), for: .touchUpInside)
                   button.setTitleColor(.mainColor, for: .normal)
                  
                   
                
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
                      pc.currentPage = 0
             
                   pc.currentPageIndicatorTintColor = .mainColor
                   pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
                   return pc
               }()
               
             //MARK: - Functions
                
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
                    
                    handleYESQA()
                    let B = BSurveyViewController()
                    navigationController?.pushViewController(B, animated: true)
                    
                }
    
                @objc func NoNext() {
                    
                    handleNOQA()
                    let B = BSurveyViewController()
                    navigationController?.pushViewController(B, animated: true)
                    
                }
               
                
            }
    extension UIColor {
        static var mainColor = UIColor(red: 142/255, green: 68/255, blue: 173/255, alpha: 1)
    }

extension ASurveyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleYESQA() {
                        var QA: Int?
                            QA = 10
                        guard let uid = Service.shared.currentUid else {
                        return
                        }
                          let values = ["QA": QA]
                          self.registerYesQAWithUID(uid, values: values as [String : AnyObject])
                        }
    func handleNOQA() {
                        var QA: Int?
                            QA = 5
                        guard let uid = Service.shared.currentUid else {
                        return
                        }
                          let values = ["QA": QA]
                          self.registerYesQAWithUID(uid, values: values as [String : AnyObject])
                        }
    
    
    fileprivate func registerYesQAWithUID(_ uid: String, values: [String: AnyObject]) {
        
        Service.shared.updateQA(QA:values["QA"] as! Int)
    }

}


