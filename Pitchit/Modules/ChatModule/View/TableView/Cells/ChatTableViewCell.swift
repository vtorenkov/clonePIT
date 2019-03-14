//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit
import Cosmos

class ChatTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var readUnreadLabel: UIView!
    
    @IBOutlet weak var chatName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: stack view with offerTypeView and lastMessageVIew views, progra,aticaly will remove one of them if needed
    @IBOutlet weak var stackViewMain: UIStackView!
    @IBOutlet weak var offerTypeView: UIView!
    @IBOutlet weak var lastMessageVIew: UIView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var offerTypeLabel: PaddingLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.circleCorners()
        readUnreadLabel.circleCorners()
    }
    
    static var reuseIdentifier: String { return "ChatTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ChatTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ChatTableViewCellModel {
    var chatModel: ChatModel
}

extension ChatTableViewCellModel: CellViewModel {
    func setup(cell: ChatTableViewCell) {
        cell.chatName.text = chatModel.name
        cell.timeLabel.text = chatModel.time
        
        if chatModel.isFuture {
            cell.stackViewMain.addArrangedSubview(cell.offerTypeView)
            cell.priceLabel.text = "\(chatModel.price)" + "$"
            switch chatModel.offerType {
            case .buying:
                cell.offerTypeLabel.text = "buying"
                cell.offerTypeLabel.backgroundColor = UIColor.red
            case .selling:
                cell.offerTypeLabel.backgroundColor = UIColor.blue
                cell.offerTypeLabel.text = "selling"
            }
            cell.offerTypeLabel.roundCornersSmall()
        } else {
            cell.offerTypeView.removeFromSuperview()
            cell.stackViewMain.removeArrangedSubview(cell.offerTypeView)
        }
    
        switch chatModel.statusChat {
        case .readed:
            cell.readUnreadLabel.isHidden = true
        case .undreaded:
            cell.readUnreadLabel.isHidden = false
        }
    }
}
