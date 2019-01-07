//
//  RouterItem.swift
//  Pitchit
//
//  Created by Alex on 11/25/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

class RouterItem {
    
    static let sharedInstance : RouterItem = {
        
        let instance = RouterItem()
        return instance
        
    }()
    
    
    func openItemInquire(target: UIViewController?, item: ItemModel?){
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "InquireViewController") as? InquireViewController{
            controller.item = item

            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openItemDetails(target: UIViewController?, item: ItemModel?){
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ItemDetailsViewController") as? ItemDetailsViewController{
            controller.item = item
            let navigationController = UINavigationController(rootViewController: controller)
            
            target?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func openPostItemDesc(target: UIViewController?, item: ItemModel?){
        let storyboard = UIStoryboard(name: "PostItemController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "PostItemDescViewController") as? PostItemDescViewController{
            controller.item = item
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openRecordVideo(target: UIViewController?, item: ItemModel?){
        let storyboard = UIStoryboard(name: "RecordVideo", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "RecordVideoViewController") as? RecordVideoViewController{
            controller.item = item
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openFavorites(target: UIViewController?){
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController{
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
