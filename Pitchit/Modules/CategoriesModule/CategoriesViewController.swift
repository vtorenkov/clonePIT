//
//  CategoriesViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension CategoriesViewController: CatsCollectionInteract {
    func selectCategory() {
        print("cat select")
    }
}

class CategoriesViewController: UIViewController {
    @IBOutlet var gradiendView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var catsCollectionViewDatasource: CatsCollectionDatasource?
    fileprivate var catsCollectionViewDelegate: CatsCollectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories".uppercased()
        
        catsCollectionViewDelegate = CatsCollectionDelegate(self, collectionView: collectionView)
        catsCollectionViewDatasource = CatsCollectionDatasource(collectionView: collectionView, delegate: catsCollectionViewDelegate!, delegateVC: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradiendView.addGradient()
        self.view.sendSubview(toBack: gradiendView)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
