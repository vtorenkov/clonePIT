
//
//  TableViewProtocol.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol PostItemTableViewDatasourceProtocol: UITableViewDataSource {
  
  weak var tableView: UITableView? {get}
  weak var delegate: UITableViewDelegate? {get}
  
  init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : PostItemTableItemDelegate, item: ItemModel, delegateVCDesc: ItemDescTableItemDelegate)
  
  func setupTableView()
}

extension PostItemTableViewDatasourceProtocol {
  func setupTableView() {
    self.tableView?.dataSource = self
    self.tableView?.delegate = self.delegate
    self.tableView?.reloadData()
    
  }
}
