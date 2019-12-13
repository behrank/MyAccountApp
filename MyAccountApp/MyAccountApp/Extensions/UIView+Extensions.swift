//
//  UIView+Extensions.swift
//  MyAccountApp
//
//  Created by Can Behran Kankul on 12.12.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

let cornerRadius: CGFloat = 12
let fillColor: UIColor = .black

extension UIView {
    
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.8)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 12.0
    }
}
