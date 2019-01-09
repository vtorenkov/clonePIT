//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

enum ItemDetailType {
    case video
    case buttons
    case userInfo
    case details
    case categoryCondition
    case additionalPhotos
    case map
    
    static let allTypes = [video, buttons, userInfo, details, categoryCondition, additionalPhotos, map]
}

protocol ItemDetailsTableItemDelegate {
    func showImageFullSize(image: UIImage?)
    func tapOnImquire()
}

final class ItemDetailsTableViewDatasource: NSObject, ItemDetailsTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    var delegateVC: ItemDetailsTableItemDelegate
    weak var item: ItemModel?
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : ItemDetailsTableItemDelegate, item: ItemModel?) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.item = item
        super.init()
        self.tableView?.separatorColor = UIColor.clear
        
        tableView.register(cellType: ProfileTableViewCell.self)
        tableView.register(cellType: MapTableViewCell.self)
        tableView.register(cellType: VideoTableViewCell.self)
        tableView.register(cellType: ButtonsTableViewCell.self)
        tableView.register(cellType: DetailsTableViewCell.self)
        tableView.register(cellType: AdditionalPhotosTableViewCell.self)
        tableView.register(cellType: CategoryConditionTableViewCell.self)
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemDetailType.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model: CellViewAnyModel
        let type = ItemDetailType.allTypes[indexPath.row]
        switch type {
        case .video:
            model = VideoTableViewCellModel(item: self.item, delegate: self.delegateVC)
        case .buttons:
            model = ButtonsTableViewCellModel(item: self.item)
        case .userInfo:
            model = ProfileTableViewCellModel(item: self.item)
        case .details:
            model = DetailsTableViewCellModel(item: self.item)
        case .categoryCondition:
            model = CategoryConditionTableViewCellModel(item: self.item)
        case .additionalPhotos:
            model = AdditionalPhotosTableViewCellModel(item: self.item, delegate: self.delegateVC)
        case .map:
            model = MapTableViewCellModel(item: self.item)
        }
        return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class ItemDetailsTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: ItemDetailsTableItemDelegate
    
    init(_ delegate: ItemDetailsTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = ItemDetailType.allTypes[indexPath.row]
        switch type {
        case .video:
            return kScreenHeight
        case .categoryCondition:
            return kScreenHeight/5
        case .additionalPhotos:
            return kScreenHeight/5
        case .map:
            return kScreenHeight/2
        case .buttons:
            return kScreenHeight/5
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
