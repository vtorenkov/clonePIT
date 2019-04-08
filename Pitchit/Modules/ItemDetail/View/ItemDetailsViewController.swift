//
//  ItemDetailsViewController.swift
//  Pitchit
//
//  Created by Alex on 7/24/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import NYTPhotoViewer
import Kingfisher

extension ItemDetailsViewController: ItemDetailsTableItemDelegate{
    func tapOnImquire() {
        RouterItem.sharedInstance.openItemInquire(target: self, item: self.item)
    }
    
    func showImageFullSize(image: String) {
        if let url = URL(string: image) {
            KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                let dataSource = DataSource(image: image)
                let photoController = NYTPhotosViewController(dataSource: dataSource)
                self.present(photoController, animated: true, completion: nil)
            })
        }
    }
    
    func messageAction() {
    }
    
    func favoritesAction() {
        if let item = self.item {
            presenter.sendToFavorites(offerId: item.id)
        }
    }
    
    func shareAction() {
    }
    
    func showUser(with id:String) {
    }
}

class ItemDetailsViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    fileprivate var itemDetailsTableViewDatasource: ItemDetailsTableViewDatasource?
    fileprivate var itemDetailsTableViewDelegate: ItemDetailsTableViewDelegate?
    var item: ItemModel?
    
    lazy var presenter: PresenterDetails = PresenterDetails(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemDetailsTableViewDelegate = ItemDetailsTableViewDelegate(self, item: item)
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
