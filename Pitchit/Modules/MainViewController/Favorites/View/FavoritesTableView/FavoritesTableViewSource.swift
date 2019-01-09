//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol FavoritesTableItemDelegate: class {
}

final class FavoritesTableViewDatasource: NSObject, FavoritesTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: FavoritesTableItemDelegate?
    
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : FavoritesTableItemDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        super.init()
        
        tableView.register(cellType: FavoritesTableViewCell.self)
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = FavoritesTableViewCellModel()
        return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
}

class FavoritesTableViewDelegate: NSObject, UITableViewDelegate {
    weak var delegate: FavoritesTableItemDelegate?
    
    init(_ delegate: FavoritesTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
