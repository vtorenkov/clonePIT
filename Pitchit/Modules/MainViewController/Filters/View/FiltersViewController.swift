//
//  FiltersViewController.swift
//  Pitchit
//
//  Created by Alex on 9/7/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
extension FiltersViewController: FilterTableItemDelegate {
    func selectType(type: Types) {
        print("selectType \(type.rawValue)")
    }
}

class FiltersViewController: UIViewController {
    var type: CategoryItemType?
    
    @IBOutlet var gradientView: UIView!
    fileprivate var filterTableViewDatasource: FilterTableViewDatasource?
    fileprivate var filterTableViewDelegate: FilterTableViewDelegate?
    
    @IBOutlet var tableView: UITableView!
    var buildModel: BuilderModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(type?.rawValue ?? "") Filters"
        buildModel = BuilderModel(type: type ?? .art)
        self.filterTableViewDelegate = FilterTableViewDelegate(self)
        self.filterTableViewDatasource = FilterTableViewDatasource(tableView: tableView, delegate: self.filterTableViewDelegate!, delegateVC: self, builder: buildModel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradientView.addGradient()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
