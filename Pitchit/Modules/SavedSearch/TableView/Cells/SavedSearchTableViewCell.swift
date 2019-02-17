//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit

class SavedSearchTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var menuImage: UIImageView!
    @IBOutlet var menuName: UILabel!
    @IBOutlet var switchLabel: UISwitch!
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var stackHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switchLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        switchLabel.tintColor = UIColor.switchColor
        switchLabel.thumbTintColor = UIColor.white
    }
    
    static var reuseIdentifier: String { return "SavedSearchTableViewCell" }
    static var nib: UINib { return UINib(nibName: "SavedSearchTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SavedSearchTableViewCellModel {
}

extension SavedSearchTableViewCellModel: CellViewModel {
    func setup(cell: SavedSearchTableViewCell) {
        
        for view in cell.stackView.arrangedSubviews {
            cell.stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        var height: CGFloat = 0.0
        for index in 0...Int(arc4random_uniform(4) + 1) {
            let view = SavedSearchView.loadFromNib()
            view.updateView(index: index)
            view.widthAnchor.constraint(equalToConstant: cell.stackView.frame.size.width).isActive = true
            cell.stackView.addArrangedSubview(view)
            height += view.frame.height
        }
        cell.stackHeight.constant = height
    }
}

