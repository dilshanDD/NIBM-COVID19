//
//  AuthButtonUIButton.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/12/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

class AuthButtonUIButton: UIButton {

  override init(frame: CGRect) {
      super.init(frame: frame)
      
      setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
      backgroundColor = .mainBlueTint
      layer.cornerRadius = 5
      heightAnchor.constraint(equalToConstant: 50).isActive = true
      titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
  }
  
  required init?(coder: NSCoder) {
      fatalError("AuthButtonUIButton coder error")
  }
}
