//
//  TableViewSource.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol FilterTableItemDelegate: class {
    func selectType(type: Types)
}


final class FilterTableViewDatasource: NSObject, FilterTableViewDatasourceProtocol {
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    weak var delegateVC: FilterTableItemDelegate?
    var models = [CellViewAnyModel]()

    required init(tableView: UITableView, delegate: UITableViewDelegate, delegateVC: FilterTableItemDelegate, builder: BuilderModelProtocol) {
        self.tableView = tableView
        self.delegate = delegate
        self.delegateVC = delegateVC
        super.init()
        self.tableView?.separatorColor = UIColor.clear
        
        tableView.register(cellType: LocationTableViewCell.self)
        tableView.register(cellType: RangeTableViewCell.self)
        tableView.register(cellType: SortByTableViewCell.self)
        tableView.register(cellType: SelectTypesTableViewCell.self)
        tableView.register(cellType: SelecterTableViewCell.self)
        tableView.register(cellType: ShowResultsTableViewCell.self)
        tableView.register(cellType: RangeMinusPlusButtonsTableViewCell.self)

        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = UIView(frame: .zero)
        self.models = builder.buildModel(delegate: delegateVC)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.models[indexPath.row]
        let cell = tableView.dequeueReusableCell(with: model, for: indexPath)
        cell.layoutIfNeeded()
        return cell
    }
}

class FilterTableViewDelegate: NSObject, UITableViewDelegate {
    var delegate: FilterTableItemDelegate
    
    init(_ delegate: FilterTableItemDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.clear
    }
    
}
