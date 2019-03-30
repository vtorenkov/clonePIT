//
//  ProfileCollectionTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 9/8/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import Foundation

class ProfileCollectionTableViewCell: UITableViewCell, NibReusable {
    var items = [ItemModel]()
    @IBOutlet var collectionView: UICollectionView!
    
    weak var delegate: ProfileTableItemDelegate?
    weak var delegatePitch: PitchCollectionInteract?

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
        self.collectionView?.register(cellType: PitchCollectionViewCell.self)
    }
    
    @IBOutlet var collectionHeight: NSLayoutConstraint!
    //self.collectionView!.frame.size.height/2-10
    static var reuseIdentifier: String { return "ProfileCollectionTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ProfileCollectionTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ProfileCollectionTableViewCellModel {
    var items: [ItemModel]
    var delegate: ProfileTableItemDelegate?
    var delegatePitch: PitchCollectionInteract?
    var userProfile: UserProfile
}

extension ProfileCollectionTableViewCellModel: CellViewModel {
    func setup(cell: ProfileCollectionTableViewCell) {
        cell.items = items
        cell.delegate = delegate
        let itemsCount = Double(self.items.count) / 2
        cell.collectionView.reloadData()
        cell.collectionHeight.constant = CGFloat(round(Double(self.items.count))) * (kScreenHeight / 3)
    }
}

extension ProfileCollectionTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.items.count == 0 {
            self.collectionView?.setEmptyMessage("Nothing to show. Add new Items.")
        } else {
            self.collectionView?.restore()
        }
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let model = PitchCollectionViewCellModel(item: item, delegate: delegatePitch)
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: kScreenHeight / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        self.delegate?.selectItem(item: item)
    }
    
}
