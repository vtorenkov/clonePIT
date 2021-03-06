//
//  TableViewProtocol.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol FilterTableViewDatasourceProtocol: UITableViewDataSource {
    
    weak var tableView: UITableView? {get}
    weak var delegate: UITableViewDelegate? {get}
    
    init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC: FilterTableItemDelegate, builder: BuilderModelProtocol)
    
    func setupTableView()
}

extension FilterTableViewDatasourceProtocol {
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self.delegate
        self.tableView?.reloadData()
    }
}
