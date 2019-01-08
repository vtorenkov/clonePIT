//
//  UserCarUsTableViewCell.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import UIKit

enum MenuType: String {
    case Chats = "Chats"
    case Categories = "Categories"
    case Settings = "Settings"
    case InviteFriends = "Invite Friends"
    case Support = "Support"
    case Favorites = "Favorites"
    case SavedSearch = "Saved Search"
    case LogOut = "Log Out"
    
    static let allTypes = [Chats, Categories, Settings, InviteFriends, Support, Favorites, SavedSearch, LogOut]
}

class MenuTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var menuImage: UIImageView!
    @IBOutlet var menuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var reuseIdentifier: String { return "MenuTableViewCell" }
    static var nib: UINib { return UINib(nibName: "MenuTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct MenuTableViewCellModel {
    var type: MenuType
}

extension MenuTableViewCellModel: CellViewModel {
    func setup(cell: MenuTableViewCell) {
        cell.menuName.text = type.rawValue
        
        switch type {
        case .Chats:
            cell.menuImage.image = UIImage(named: "chat")
        case .Categories:
            cell.menuImage.image = UIImage(named: "categories")
        case .Settings:
            cell.menuImage.image = UIImage(named: "chat")
        case .InviteFriends:
            cell.menuImage.image = UIImage(named: "invite_friends")
        case .Support:
            cell.menuImage.image = UIImage(named: "support")
        case .Favorites:
            cell.menuImage.image = UIImage(named: "favorites")
        case .SavedSearch:
            cell.menuImage.image = UIImage(named: "saved_searches")
        case .LogOut:
            cell.menuImage.image = UIImage(named: "logOut")
        }
    }
}
