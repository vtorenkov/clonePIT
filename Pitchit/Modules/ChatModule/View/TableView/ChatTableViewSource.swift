//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol ChatTableItemDelegate: class {
    
}

final class ChatTableViewDatasource: NSObject, ChatTableViewDatasourceProtocol {
    
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: ChatTableItemDelegate?
    
    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC: ChatTableItemDelegate) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        super.init()
        self.tableView?.separatorColor = UIColor.clear
        
        tableView.register(cellType: ChatTableViewCell.self)
        
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.setupTableView()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileType.allTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model = ChatTableViewCellModel()
        return tableView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class ChatTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: ChatTableItemDelegate
    
    init(_ delegate: ChatTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Remove") { (action, indexPath) in
            // delete item at indexPath
        }
        
        let share = UITableViewRowAction(style: .normal, title: "Remove") { (action, indexPath) in
            // share item at indexPath
        }
        
        return [delete, share]
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title:  "Remove", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            success(true)
        })
        //TODO: we need icon with text in one image here
        deleteAction.image = UIImage(named: "albums")
        deleteAction.title = "Remove"
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
