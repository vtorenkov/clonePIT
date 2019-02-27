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
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        print(chatModel.name)
        print(chatModel.statusChat.rawValue)
        
        switch chatModel.offerType {
        case .buying:
            break
        case .selling:
            break
        }
        
        switch chatModel.statusChat {
        case .readed:
            cell.readUnreadLabel.isHidden = true
        case .undreaded:
            cell.readUnreadLabel.isHidden = false
        }
    }
}
