//
//  ItemDetailsViewController.swift
//  Pitchit
//
//  Created by Alex on 7/24/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import NYTPhotoViewer

extension ItemDetailsViewController: ItemDetailsTableItemDelegate{
    func tapOnImquire() {
        RouterItem.sharedInstance.openItemInquire(target: self, item: self.item)
    }
    
    func showImageFullSize(image: UIImage?) {
        let dataSource = DataSource(image: image)
        let photoController = NYTPhotosViewController(dataSource: dataSource)
        self.present(photoController, animated: true, completion: nil)
    }
}

class ItemDetailsViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    fileprivate var itemDetailsTableViewDatasource: ItemDetailsTableViewDatasource?
    fileprivate var itemDetailsTableViewDelegate: ItemDetailsTableViewDelegate?
    weak var item: ItemModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemDetailsTableViewDelegate = ItemDetailsTableViewDelegate(self)
        self.itemDetailsTableViewDatasource = ItemDetailsTableViewDatasource(tableView: tableView, delegate: self.itemDetailsTableViewDelegate!, delegateVC: self, item: item)
        if let item = self.item {
            priceLabel.text = item.price + "$"
        }
        let itemButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = itemButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func closeItemDetails(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
