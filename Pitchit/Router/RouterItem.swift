//
//  RouterItem.swift
//  Pitchit
//
//  Created by Alex on 11/25/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

class RouterItem: GlobalRouter {
    
    static let sharedInstance : RouterItem = {
        let instance = RouterItem()
        return instance
    }()
    
    func openConfirmationScren(target: UIViewController){
        let storyboard = UIStoryboard(name: "ConfirmPurchase", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ConfirmPurchaseViewController") as? ConfirmPurchaseViewController {
            target.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openAddCard(target: UIViewController){
        let storyboard = UIStoryboard(name: "AddCard", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AddCardViewController") as? AddCardViewController {
            target.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openAddOfferOrder(target: UIViewController, item: ItemModel?){
        let storyboard = UIStoryboard(name: "AddOfferOrder", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AddOfferOrderViewController") as? AddOfferOrderViewController {
            controller.item = item
            target.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openPurchaseOrder(target: UIViewController, item: ItemModel?){
        let storyboard = UIStoryboard(name: "PurchaseOrder", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "PurchaseOrderViewController") as? PurchaseOrderViewController {
            controller.item = item
            target.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    func openItemInquire(target: UIViewController?, item: ItemModel?){
        let storyboard = UIStoryboard(name: "ItemDetail", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "InquireViewController") as? InquireViewController {
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
    
    func openFavorites(target: UIViewController?, presentationStyle: RouterPresentationStyle = .push){
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController{
            pushOrPresentController(target: target, controller: controller, presentationStyle: presentationStyle)
        }
    }
}
