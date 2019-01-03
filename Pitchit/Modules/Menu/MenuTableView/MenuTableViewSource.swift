//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol MenuTableItemDelegate: class {
    func didClickMenu(type: MenuType)
}

final class MenuTableViewDatasource: NSObject, MenuTableViewDatasourceProtocol {
  
  weak var tableView: UITableView?
  weak var delegate: UITableViewDelegate?
  weak var delegateVC: MenuTableItemDelegate?
  
  required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : MenuTableItemDelegate) {
    self.tableView = tableView
    self.delegate = delegate
    self.delegateVC = delegateVC
    super.init()
    self.tableView?.separatorColor = UIColor.clear

    tableView.register(cellType: MenuTableViewCell.self)
    self.tableView?.estimatedRowHeight = 100
    self.tableView?.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = UIView(frame: .zero)
    self.setupTableView()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MenuType.allTypes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var model: CellViewAnyModel
    let type = MenuType.allTypes[indexPath.row]
    model = MenuTableViewCellModel(type: type)
    
    return tableView.dequeueReusableCell(with: model, for: indexPath)
    
  }
  
}


class MenuTableViewDelegate: NSObject, UITableViewDelegate {
  weak var delegate: MenuTableItemDelegate?
  
  init(_ delegate: MenuTableItemDelegate) {
    self.delegate = delegate
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
    //    return UITableViewAutomaticDimension
  }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = MenuType.allTypes[indexPath.row]
        delegate?.didClickMenu(type: type)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
