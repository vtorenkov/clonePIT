//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol ProfileTableItemDelegate: class {
    func selectItem(item: ItemModel)
    func tapOnrate()
    func selectPosts(of type: PosrType)
}

enum PosrType {
    case All
    case Favorites
}

enum ProfileType {
    case TopAvatar
    case Switch
    case Items
    case Personal
    
//    static let allTypes = [TopAvatar, Personal, Switch, Items]
    static let allTypes = [TopAvatar, Personal, Items]
}

final class ProfileTableViewDatasource: NSObject, ProfileTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: ProfileTableItemDelegate?
    weak var delegatePitch: PitchCollectionInteract?
    
    var items = [ItemModel]()
    var profile: UserProfile?

    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC: ProfileTableItemDelegate, delegatePitch: PitchCollectionInteract) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.delegatePitch = delegatePitch
        super.init()
        self.tableView?.separatorColor = UIColor.clear
        
        tableView.register(cellType: AvtarProfileTableViewCell.self)
        tableView.register(cellType: SwitchUITableViewCell.self)
        tableView.register(cellType: ProfileCollectionTableViewCell.self)
        tableView.register(cellType: PersonalAccountTableViewCell.self)
        
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileType.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model: CellViewAnyModel
        guard let profile = self.profile else {
            return UITableViewCell()
        }
        let type = ProfileType.allTypes[indexPath.row]
        switch type {
        case .TopAvatar:
            model = AvtarProfileTableViewCellModel(delegate: delegateVC, userProfile: profile)
        case .Personal:
            model = PersonalAccountTableViewCellModel(delegate: delegateVC, userProfile: profile)
        case .Switch:
            model = SwitchUITableViewCellModel(delegate: delegateVC, userProfile: profile)
        case .Items:
            model = ProfileCollectionTableViewCellModel(items: items, delegate: delegateVC, delegatePitch: delegatePitch, userProfile: profile)
        }
        return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
}

class ProfileTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: ProfileTableItemDelegate
    var profile: UserProfile?

    init(_ delegate: ProfileTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = ProfileType.allTypes[indexPath.row]
        switch type {
        case .TopAvatar:
            return kScreenHeight/3
        case .Switch:
            return kScreenHeight/15
        case .Items:
            return UITableViewAutomaticDimension
        case .Personal:
            return kScreenHeight/10
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
