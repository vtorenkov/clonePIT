//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit
import Cosmos

class ChatTableViewCell: UITableViewCell, NibReusable {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    }
}
