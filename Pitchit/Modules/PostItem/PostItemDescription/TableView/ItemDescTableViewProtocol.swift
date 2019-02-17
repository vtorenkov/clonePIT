//
//  TableViewProtocol.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol ItemDescTableViewDatasourceProtocol: UITableViewDataSource {
  
  weak var tableView: UITableView? {get}
  weak var delegate: UITableViewDelegate? {get}
  
  init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : ItemDescTableItemDelegate, item: ItemModel)
  
  func setupTableView()
}

extension ItemDescTableViewDatasourceProtocol {
  func setupTableView() {
    self.tableView?.dataSource = self
    self.tableView?.delegate = self.delegate
    self.tableView?.reloadData()
    
  }
}
