//
//  FavoritesViewController.swift
//  Pitchit
//
//  Created by Alex on 1/6/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

extension FavoritesViewController: FavoritesTableItemDelegate{
    func tapHeart(favoriteId: String) {
        presenter.addToFavorites(favoriteId: favoriteId)
    }
}

class FavoritesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var favoritesViewDatasource: FavoritesTableViewDatasource?
    fileprivate var favoritesViewDelegate: FavoritesTableViewDelegate?
    
    lazy var presenter: PresenterFavorites = PresenterFavorites(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites".uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]

        self.favoritesViewDelegate = FavoritesTableViewDelegate(self)
        self.favoritesViewDatasource = FavoritesTableViewDatasource(tableView: tableView, delegate: self.favoritesViewDelegate!, delegateVC: self)
        
        presenter.getAllFavorites()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        closeProgramaticalyController()
    }
}
