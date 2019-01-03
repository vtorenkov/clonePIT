//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

enum AddItemCellType {
    case video
    case nameText
    case priceText
    case locationText
    case category
    //    case addButton
    case itemCondition
    case desc
    case aditionalVideosPics
    case publicItemButton
    
    
    static let allTypes = [video, nameText, priceText, itemCondition, locationText, category, desc, aditionalVideosPics, publicItemButton]
}

protocol PostItemTableItemDelegate: class {
    func nextPostItemScreen()
    func addVideoToItem()
}

final class PostItemTableViewDatasource: NSObject, PostItemTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: PostItemTableItemDelegate?
    weak var delegateVCDesc: ItemDescTableItemDelegate?
    weak var item: ItemModel?
    
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : PostItemTableItemDelegate, item: ItemModel, delegateVCDesc: ItemDescTableItemDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.item = item
        self.delegateVCDesc = delegateVCDesc
        super.init()
        self.tableView?.separatorColor = UIColor.clear
        
        
        tableView.register(cellType: UploadVideoTableViewCell.self)
        tableView.register(cellType: TextPitchTableViewCell.self)
        tableView.register(cellType: CategoryPitchTableViewCell.self)
        //    tableView.register(cellType: UploadPItchTableViewCell.self)
        tableView.register(cellType: ItemConditionTableViewCell.self)
        tableView.register(cellType: DescTextPitchTableViewCell.self)
        tableView.register(cellType: AdditionalPicsVidsTableViewCell.self)
        tableView.register(cellType: PublicButtonTableViewCell.self)
        
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AddItemCellType.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model: CellViewAnyModel
        guard let delegateVC = self.delegateVC, let delegateVCDesc = self.delegateVCDesc else {
            return UITableViewCell()
        }
        
        let type = AddItemCellType.allTypes[indexPath.row]
        switch type {
        case .video:
            model = UploadVideoTableViewCellModel(type:type, delegate: delegateVC, item: self.item)
        case .category:
            model = CategoryPitchTableViewCellModel(type:type, item: self.item)
            //    case .addButton:
        //        model = UploadPItchTableViewCellModel(type:type, delegate: delegateVC, item: self.item)
        case .itemCondition:
            model = ItemConditionTableViewCellModel(item: self.item)
        case .desc:
            model = DescTextPitchTableViewCellModel(item: self.item)
        case .aditionalVideosPics:
            model = AdditionalPicsVidsTableViewCellModel(item: self.item, delegate: delegateVCDesc)
        case .publicItemButton:
            model = PublicButtonTableViewCellModel(delegate: delegateVCDesc)
        default:
            model = TextPitchTableViewCellModel(type:type, item: self.item)
        }
        
        
        return tableView.dequeueReusableCell(with: model, for: indexPath)
        
    }
    
}


class PostItemTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: PostItemTableItemDelegate
    
    init(_ delegate: PostItemTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = AddItemCellType.allTypes[indexPath.row]
        
        switch type {
            
        case .video:
            return kScreenHeight / 3
        case .nameText:
            return kScreenHeight / 5
        case .priceText:
            return kScreenHeight / 5
        case .locationText:
            return kScreenHeight / 5
        case .category:
            return kScreenHeight / 7
        case .desc:
            return kScreenHeight / 5
        case .aditionalVideosPics:
            return kScreenHeight / 5
        case .publicItemButton:
            return kScreenHeight / 10
        case .itemCondition:
            return kScreenHeight / 5
        default:
            return UITableViewAutomaticDimension
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
