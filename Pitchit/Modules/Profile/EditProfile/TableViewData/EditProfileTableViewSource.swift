//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol EditProfileTableItemDelegate: class {
    func addPurchaseMethod()
    func removePurchaseMethod()
    func selectPhoto()
}

enum EditProfileType {
    case TopAvatar
    case nameSurname
    case email
    case phone
    
    case paymentCard
    case addPayment
    static let allTypes = [[TopAvatar, nameSurname, email, phone], [paymentCard, addPayment]]
}

final class EditProfileTableViewDatasource: NSObject, EditProfileTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: EditProfileTableItemDelegate?
    var profile: UserProfile?
    
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC : EditProfileTableItemDelegate, profile: UserProfile?) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.profile = profile
        super.init()
        self.tableView?.separatorColor = UIColor.clear
        
        tableView.register(cellType: PaymentTableViewCell.self)
        tableView.register(cellType: SingleTextTableViewCell.self)
        tableView.register(cellType: DoubleTextTableViewCell.self)
        tableView.register(cellType: AvatarTableViewCell.self)
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EditProfileType.allTypes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model: CellViewAnyModel
        let type = EditProfileType.allTypes[indexPath.section][indexPath.row]
        
        switch type {
        case .TopAvatar:
            model = AvatarTableViewCellModel(type: type)
        case .nameSurname:
            model = DoubleTextTableViewCellModel(type: type, profile: profile)
        case .email:
            model = SingleTextTableViewCellModel(type: type, profile: profile)
        case .phone:
            model = SingleTextTableViewCellModel(type: type, profile: profile)
        case .paymentCard:
            model = PaymentTableViewCellModel(type: type)
        case .addPayment:
            model = PaymentTableViewCellModel(type: type)
        }
        return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EditProfileType.allTypes.count
    }
}


class EditProfileTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: EditProfileTableItemDelegate
    
    init(_ delegate: EditProfileTableItemDelegate) {
        self.delegate = delegate
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = EditProfileType.allTypes[indexPath.section][indexPath.row]
        switch type {
        case .addPayment:
            self.delegate.addPurchaseMethod()
        case .paymentCard:
            self.delegate.removePurchaseMethod()
        case .TopAvatar:
            self.delegate.selectPhoto()
        default: break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderTableViewCell.loadFromNib()
        return view
    }
}
