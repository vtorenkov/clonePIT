//
//  MainViewController.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension MainViewController: FiltersActions {
    func showFilterView() {
        addFilterView()
    }
    func hidFilterView() {
        hidFilterCustomView()
    }
}

extension MainViewController: CategoriesCollectionInteract {
    func selectCategory(category: CategoryItemType) {
        self.category = category
        self.items = ItemManager.sharedInstance.items.filter{$0.type == category}
        self.pitchCollectionViewDatasource?.items = self.items
        self.pitchCollectionViewDatasource?.category = category
        self.categoriesCollectionViewDatasource?.category = category
        self.pitchCollectionViewDelegate?.items = self.items
        self.pitchCollection.reloadData()
        self.categoryCollection.reloadData()
    }
}

extension MainViewController: PitchCollectionInteract {
    func tapOnLike(item: ItemModel?) {
        self.alert(message: "Not yest implemented")
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

class MainViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var viewFilter: UIView!
    let viewFilterCustom = FilterView.loadFromNib()

    @IBOutlet var pitchCollection: UICollectionView!
    @IBOutlet var categoryCollection: UICollectionView!
    
    lazy var presenter: MainPresenter = MainPresenter(view: self)
    
    var pitchCollectionViewDatasource: PitchCollectionDatasource?
    var pitchCollectionViewDelegate: PitchCollectionDelegate?
    
    fileprivate var categoriesCollectionViewDatasource: CategoriesCollectionDatasource?
    fileprivate var categoriesCollectionViewDelegate: CategoriesCollectionDelegate?
    
    var items = [ItemModel]()
    var category: CategoryItemType = .art
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]
        self.title = "Pitchit".uppercased()
//        self.items = ItemManager.sharedInstance.items.filter{$0.type == category}
        self.initSearchBar()
        self.pitchCollectionViewDelegate = PitchCollectionDelegate(self, collectionView: pitchCollection, items: items)
        self.pitchCollectionViewDatasource = PitchCollectionDatasource(collectionView: pitchCollection, delegate: self.pitchCollectionViewDelegate!, delegateVC: self, presenter: presenter, items: items)
        self.pitchCollectionViewDelegate?.controller = self
        
        self.categoriesCollectionViewDelegate = CategoriesCollectionDelegate(self, collectionView: categoryCollection)
        self.categoriesCollectionViewDatasource = CategoriesCollectionDatasource(collectionView: categoryCollection, delegate: self.categoriesCollectionViewDelegate!, delegateVC: self, presenter: presenter)
        
        viewFilterCustom.frame = viewFilter.bounds
        viewFilterCustom.delegateMain = self
        viewFilter.addSubview(viewFilterCustom)
        viewFilter.isHidden = true
    }
    
    func initSearchBar() {
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.searchBar.delegate = self
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = UIColor.searchBackColor
        textFieldInsideSearchBar?.textColor = UIColor.black
        textFieldInsideSearchBar?.backgroundColor = UIColor.searchBackColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.presenter.getPosts()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidFilterCustomView()
    }
    
    func addFilterView() {
        viewFilter.isHidden = false
    }
    
    func hidFilterCustomView() {
        viewFilter.isHidden = true
    }
    
    @IBAction func openSettings(_ sender: Any) {
        Router.sharedInstance.openFilterView(target: self, type: self.category, delegate: self)
    }
    
    @IBAction func openFavorites(_ sender: Any) {
        RouterItem.sharedInstance.openFavorites(target: self)
    }
}














