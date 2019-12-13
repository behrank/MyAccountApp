//
//  FetchOffersResponseModel.swift
//  MyAccountApp
//
//  Created by Can Behran Kankul on 12.12.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation

// MARK: - FetchOffersResponseModelElement
class FetchOffersResponseModelElement: Codable {
    var id: String?
    var version: Int?
    var createdDate: String?
    var code: String?
    var name: String?
    var type: String?
    var benefits: [Benefit]?
    var price: Int?
    var currency, period: String?
    var status: Bool?

    init(id: String?, version: Int?, createdDate: String?, code: String?, name: String?, type: String?, benefits: [Benefit]?, price: Int?, currency: String?, period: String?, status: Bool?) {
        self.id = id
        self.version = version
        self.createdDate = createdDate
        self.code = code
        self.name = name
        self.type = type
        self.benefits = benefits
        self.price = price
        self.currency = currency
        self.period = period
        self.status = status
    }
}

// MARK: - Benefit
class Benefit: Codable {
    var availableServices: [String]?
    var type: String?
    var val: Int?

    init(availableServices: [String]?, type: String?, val: Int?) {
        self.availableServices = availableServices
        self.type = type
        self.val = val
    }
}

typealias FetchOffersResponseModel = [FetchOffersResponseModelElement]
