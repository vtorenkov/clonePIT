//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol SavedSearchTableItemDelegate: class {
}

final class SavedSearchTableViewDatasource: NSObject, SavedSearchTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: SavedSearchTableItemDelegate?
    
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : SavedSearchTableItemDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        super.init()
        
        tableView.register(cellType: SavedSearchTableViewCell.self)
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuType.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = SavedSearchTableViewCellModel()
        return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class SavedSearchTableViewDelegate: NSObject, UITableViewDelegate {
    weak var delegate: SavedSearchTableItemDelegate?
    
    init(_ delegate: SavedSearchTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
