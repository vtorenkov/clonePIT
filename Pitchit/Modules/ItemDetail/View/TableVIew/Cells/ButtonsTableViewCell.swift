//
//  ButtonsTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 7/28/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

protocol ItemButtonsProtocol: class {
    func messageAction()
    func favoritesAction()
    func shareAction()
}

class ButtonsTableViewCell: UITableViewCell, NibReusable {
    weak var delegate: ItemButtonsProtocol?
    
    @IBAction func messageAction(_ sender: Any) {
        print("messageAction")
    }
    @IBAction func favoriteAction(_ sender: Any) {
        delegate?.favoritesAction()
    }

    @IBAction func shareAction(_ sender: Any) {
        print("shareAction")
    }
    weak var item: ItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    static var reuseIdentifier: String { return "ButtonsTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ButtonsTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ButtonsTableViewCellModel {
    var delegate: ItemButtonsProtocol
    var item: ItemModel?
}

extension ButtonsTableViewCellModel: CellViewModel {
    func setup(cell: ButtonsTableViewCell) {
        cell.item = item
        cell.delegate = delegate
    }
}
