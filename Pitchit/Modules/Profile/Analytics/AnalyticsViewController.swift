//
//  AnalyticsViewController.swift
//  Pitchit
//
//  Created by Alex on 11/12/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension AnalyticsViewController: AnalyticsTableItemDelegate {
    
}

class AnalyticsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    fileprivate var analyticsTableViewDatasource: AnalyticsTableViewDatasource?
    fileprivate var analyticsTableViewDelegate: AnalyticsTableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Analytics".uppercased()
        self.analyticsTableViewDelegate = AnalyticsTableViewDelegate(self)
        self.analyticsTableViewDatasource = AnalyticsTableViewDatasource(tableView: tableView, delegate: self.analyticsTableViewDelegate!, delegateVC: self)
    }

}
