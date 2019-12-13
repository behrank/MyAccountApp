//
//  OfferCollectionViewCell.swift
//  MyAccountApp
//
//  Created by Can Behran Kankul on 12.12.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    
    //UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleAppLabel: UILabel!
    @IBOutlet weak var internetLabel: UILabel!
    @IBOutlet weak var internetDescLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var minuteDescLabel: UILabel!
    @IBOutlet weak var smsLabel: UILabel!
    @IBOutlet weak var smsDescLabel: UILabel!
    @IBOutlet weak var callLabel: UILabel!
    @IBOutlet weak var callDescLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var wrapperView: UIView!
    
    func setupUI(with cellData: FetchOffersResponseModelElement) {
        containerView.layer.cornerRadius = 12
        
        titleLabel.text = "MyCell ".appending(cellData.type ?? "")
        
        if let minuteText = cellData.benefits?[0].val {
            minuteLabel.text = "\(minuteText)".appending("DK")
            minuteDescLabel.text = "ON DIGITAL SERVICES"
        }
        if let gbText = cellData.benefits?[1].val {
            internetLabel.text = "\(gbText)".appending("GB")
            internetDescLabel.text = "TO USE ON ANYTHING"
        }
        if let appText = cellData.benefits?[2].availableServices?.first, let appCount = cellData.benefits?[2].val {
            titleAppLabel.text = "\(appCount) ".appending(appText)
        }
        if let smsText = cellData.benefits?[3].val {
            smsLabel.text = "+ \(smsText) ".appending("SMS")
            smsDescLabel.text = "TEXTS"
        }
        if let callText = cellData.benefits?[4].val {
            callLabel.text = "+ \(callText) ".appending("MINS")
            callDescLabel.text = "ON CALLS"
        }
        
        priceLabel.text = "\(cellData.price ?? 0) \(cellData.currency ?? "TL")/".appending(cellData.period ?? "")
    }
    
    func addShadowToBackground() {
        DispatchQueue.main.async {
            self.wrapperView.addShadow()
        }
    }
}
