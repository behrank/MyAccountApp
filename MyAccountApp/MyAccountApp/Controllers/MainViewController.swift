//
//  MainViewController.swift
//  MyAccountApp
//
//  Created by Can Behran Kankul on 12.12.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //UI
    @IBOutlet private weak var menuContainerView: UIView!
    @IBOutlet weak var wrapperView: UIView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuContainerView.layer.cornerRadius = 12
        wrapperView.addShadow()
    }
}
