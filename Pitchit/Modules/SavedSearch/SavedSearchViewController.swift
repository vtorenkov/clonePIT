//
//  SavedSearchViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension SavedSearchViewController: SavedSearchTableItemDelegate{
    
}

class SavedSearchViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    fileprivate var savedSearchViewDatasource: SavedSearchTableViewDatasource?
    fileprivate var savedSearchViewDelegate: SavedSearchTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.savedSearchViewDelegate = SavedSearchTableViewDelegate(self)
        self.savedSearchViewDatasource = SavedSearchTableViewDatasource(tableView: tableView, delegate: self.savedSearchViewDelegate!, delegateVC: self)
        self.title = "Saved search".uppercased()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
