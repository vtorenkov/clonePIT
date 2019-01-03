//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

enum AddItemDescCellType {
    case desc
    case aditionalVideosPics
    case publicItemButton
    static let allTypes = [desc, aditionalVideosPics, publicItemButton]
}

protocol ItemDescTableItemDelegate: class {
    func uploadItem()
    func selectImageFullSize(image: UIImage?)
    func addPhoto()
}

final class ItemDescTableViewDatasource: NSObject, ItemDescTableViewDatasourceProtocol {
  
  weak var tableView: UITableView?
  weak var delegate: UITableViewDelegate?
  var delegateVC: ItemDescTableItemDelegate
    weak var item: ItemModel?

  required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : ItemDescTableItemDelegate, item: ItemModel) {
    self.tableView = tableView
    self.delegate = delegate
    self.delegateVC = delegateVC
    self.item = item
    super.init()
    self.tableView?.separatorColor = UIColor.clear
    
  
    tableView.register(cellType: DescTextPitchTableViewCell.self)
    tableView.register(cellType: ItemConditionTableViewCell.self)
    tableView.register(cellType: AdditionalPicsVidsTableViewCell.self)
    tableView.register(cellType: PublicButtonTableViewCell.self)

    self.tableView?.estimatedRowHeight = 100
    self.tableView?.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = UIView(frame: .zero)
    self.setupTableView()
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return AddItemDescCellType.allTypes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var model: CellViewAnyModel
    let type = AddItemDescCellType.allTypes[indexPath.row]
    
    switch type {
    case .desc:
        model = DescTextPitchTableViewCellModel(item: self.item)
//    case .itemContidition:
//        model = ItemConditionTableViewCellModel(type: type, item: self.item)
    case .aditionalVideosPics:
        model = AdditionalPicsVidsTableViewCellModel(item: self.item, delegate: self.delegateVC)
    case .publicItemButton:
        model = PublicButtonTableViewCellModel(delegate: self.delegateVC)
    }

    return tableView.dequeueReusableCell(with: model, for: indexPath)
    
  }
  
}


class ItemDescTableViewDelegate: NSObject, UITableViewDelegate {
  var delegate: ItemDescTableItemDelegate
  
  init(_ delegate: ItemDescTableItemDelegate) {
    self.delegate = delegate
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let type = AddItemDescCellType.allTypes[indexPath.row]
    
    switch type {
    case .desc:
        return kScreenHeight / 5
   
    case .aditionalVideosPics:
        return kScreenHeight / 5
    case .publicItemButton:
        return kScreenHeight / 10
    }
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
