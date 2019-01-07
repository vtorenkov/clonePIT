//
//  FavoritesViewController.swift
//  Pitchit
//
//  Created by Alex on 1/6/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

extension FavoritesViewController: FavoritesTableItemDelegate{
    
}

class FavoritesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    fileprivate var favoritesViewDatasource: FavoritesTableViewDatasource?
    fileprivate var favoritesViewDelegate: FavoritesTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        
        self.favoritesViewDelegate = FavoritesTableViewDelegate(self)
        self.favoritesViewDatasource = FavoritesTableViewDatasource(tableView: tableView, delegate: self.favoritesViewDelegate!, delegateVC: self)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
