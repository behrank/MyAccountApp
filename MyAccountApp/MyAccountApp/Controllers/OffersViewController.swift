//
//  OffersViewController.swift
//  MyAccountApp
//
//  Created by Can Behran Kankul on 12.12.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

let cellReuseIdentifier = "\(OfferCollectionViewCell.self)"

class OffersViewController: UIViewController {
    
    //UI
    @IBOutlet private weak var offerCollectionView: UICollectionView!
    private var fetchedObjects: FetchOffersResponseModel = [] {
        didSet {
            DispatchQueue.main.async {
                self.offerCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        offerCollectionView.register(UINib(nibName: "OfferCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        offerCollectionView.dataSource = self
        offerCollectionView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchOffersFromNetwork()
    }
}
// MARK: Network
extension OffersViewController {
    private func fetchOffersFromNetwork() {
        let target: NetworkTarget = NetworkTarget.fetchOffers
         target.call(completion: { (fetchedoffers: FetchOffersResponseModel?) in
            if let fetchedArray = fetchedoffers {
                self.fetchedObjects = fetchedArray
            }
         }) { (error) in
            debugPrint(error)
         }
    }
}
// MARK: CollectionView
extension OffersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        if let currentCell = cell as? OfferCollectionViewCell {
            currentCell.setupUI(with: fetchedObjects[indexPath.row])
            currentCell.addShadowToBackground()
            return currentCell
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let currentCell = cell as? OfferCollectionViewCell {
            currentCell.addShadowToBackground()
        }
    }
}
extension OffersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
extension OffersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 318)
    }
}
