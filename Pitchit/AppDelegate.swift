//
//  AppDelegate.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import SideMenu
import GooglePlaces
import IQKeyboardManager
import FBSDKLoginKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.registerMenu()
        IQKeyboardManager.shared().isEnabled = true
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        self.createItems()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application,
                                                         open: url,
                                                         sourceApplication: sourceApplication,
                                                         annotation: annotation)
    }
    
    func registerMenu() {
        let menuLeftNavigationController = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "UISideMenuNavigationController") as! UISideMenuNavigationController
        
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        SideMenuManager.default.menuShadowOpacity = 10.5
        
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        GMSPlacesClient.provideAPIKey("AIzaSyCY7_Tb4b_K82hGknYP3xwyhsuNJ85FbKU")
    }
    
    func createItems() {
        let videoUrl = "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4"
        let videoUrl2 = "http://techslides.com/demos/sample-videos/small.mp4"
        let author = UserModel()
        author.firstName = "Alex"
        author.lastName = "Test"
        author.fullName = "Alex Test"
        author.imageUrl = "https://ubistatic19-a.akamaihd.net/resource/en-us/game/southpark/thefracturedbutwhole/spfbw-characters-teamfreedom-mysterion-day.png"

        let item1 = ItemModel()
        item1.videoUrl = videoUrl
        item1.type = .art
        item1.desc = "Here is description of item1"
        item1.title = "Test item 1"
        item1.author = author
        item1.place = "Chisinau"
        item1.price = "64"
        item1.placeCoodinate = CLLocationCoordinate2D(latitude: 47.0194189, longitude: 28.8282381)
        item1.thumbImage = UIImage(named: "table_sample")
        
        let item2 = ItemModel()
        item2.videoUrl = videoUrl2
        item2.type = .clothing
        item2.desc = "Here is description of item2"
        item2.title = "Test item 2"
        item2.author = author
        item2.place = "New York"
        item2.price = "24"
        item2.placeCoodinate = CLLocationCoordinate2D(latitude: 40.6976701, longitude: -74.2598767)
        item2.thumbImage = UIImage(named: "table_sample")

        
        let item3 = ItemModel()
        item3.videoUrl = videoUrl
        item3.desc = "Here is description of item3"
        item3.title = "Test item 3"
        item3.author = author
        item3.place = "Barcelona"
        item3.price = "999"
        item3.placeCoodinate = CLLocationCoordinate2D(latitude: 41.3949627, longitude: 2.0086812)
        item3.thumbImage = UIImage(named: "table_sample")

        
        let item4 = ItemModel()
        item4.videoUrl = videoUrl2
        item4.desc = "Here is description of item4"
        item4.title = "Test item 4"
        item4.author = author
        item4.price = "11"
        item4.place = "San Francisco"
        item4.placeCoodinate = CLLocationCoordinate2D(latitude: 37.757815, longitude: -122.5076407)
        item4.thumbImage = UIImage(named: "table_sample")

        ItemManager.sharedInstance.items.append(contentsOf: [item1, item2, item3, item4])
    }
}

