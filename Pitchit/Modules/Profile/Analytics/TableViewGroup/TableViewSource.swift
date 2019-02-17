//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol AnalyticsTableItemDelegate {
    
}

final class AnalyticsTableViewDatasource: NSObject, AnalyticsTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    var delegateVC: AnalyticsTableItemDelegate
    
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : AnalyticsTableItemDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        super.init()
        self.tableView?.separatorColor = UIColor.separatorColor
        
        tableView.register(cellType: AnalyticsTableViewCell.self)
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = ItemManager.sharedInstance.items
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model: CellViewAnyModel
        let items = ItemManager.sharedInstance.items

        model = AnalyticsTableViewCellModel(item: items[indexPath.row])
        return tableView.dequeueReusableCell(with: model, for: indexPath)
        
    }
    
}


class AnalyticsTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: AnalyticsTableItemDelegate
    
    init(_ delegate: AnalyticsTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kScreenHeight / 8 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
