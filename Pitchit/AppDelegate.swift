//
//  AppDelegate.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import GooglePlaces
import IQKeyboardManager
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let googleSignIn = "499607014353-tqd4bs3d0bvsq5647jst2b6chunkipsp.apps.googleusercontent.com"
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSPlacesClient.provideAPIKey("AIzaSyCY7_Tb4b_K82hGknYP3xwyhsuNJ85FbKU")
        IQKeyboardManager.shared().isEnabled = true
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        GIDSignIn.sharedInstance().clientID = googleSignIn

//        createItems()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application,
                                                         open: url,
                                                         sourceApplication: sourceApplication,
                                                         annotation: annotation)
    }
    /*
    func createItems() {
        let videoUrl = "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4"
        let videoUrl2 = "http://techslides.com/demos/sample-videos/small.mp4"
        let author = RegisterModel()
        author.firstName = "Jordan"
        author.lastName = "Belflower"
        author.fullName = "Jordan Belflower"
        author.imageUrl = "https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/03/29/16/danielle-bregoli.jpg?w968h681"

        let item1 = ItemModel()
        item1.videoUrl = videoUrl
        item1.type = .art
        item1.desc = "Mid century lounge chair cool and long description"
        item1.title = "Mid century lounge chair"
        item1.author = author
        item1.place = "Chisinau"
        item1.price = "64"
        item1.dateOfPost = "Posted 9 minutes ago"
        item1.placeCoodinate = CLLocationCoordinate2D(latitude: 47.0194189, longitude: 28.8282381)
        item1.thumbImage = UIImage(named: "table_sample")
        item1.additionImage = [UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women")] as! [UIImage]
        
        let item2 = ItemModel()
        item2.videoUrl = videoUrl2
        item2.type = .clothing
        item2.desc = "Mid century lounge chair cool and long description"
        item2.title = "Mid century lounge chair"
        item2.author = author
        item2.place = "New York"
        item2.price = "24"
        item2.dateOfPost = "Posted 9 minutes ago"
        item2.placeCoodinate = CLLocationCoordinate2D(latitude: 40.6976701, longitude: -74.2598767)
        item2.thumbImage = UIImage(named: "table_sample")
        item2.additionImage = [UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women")] as! [UIImage]

        let item3 = ItemModel()
        item3.videoUrl = videoUrl
        item3.desc = "Mid century lounge chair cool and long description"
        item3.title = "Mid century lounge chair"
        item3.author = author
        item3.place = "Barcelona"
        item3.price = "999"
        item3.dateOfPost = "Posted 9 minutes ago"
        item3.placeCoodinate = CLLocationCoordinate2D(latitude: 41.3949627, longitude: 2.0086812)
        item3.thumbImage = UIImage(named: "table_sample")
        item3.additionImage = [UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women")] as! [UIImage]

        let item4 = ItemModel()
        item4.videoUrl = videoUrl2
        item4.desc = "Mid century lounge chair cool and long description"
        item4.title = "Mid century lounge chair"
        item4.author = author
        item4.price = "11"
        item4.dateOfPost = "Posted 9 minutes ago"
        item4.place = "San Francisco"
        item4.placeCoodinate = CLLocationCoordinate2D(latitude: 37.757815, longitude: -122.5076407)
        item4.thumbImage = UIImage(named: "table_sample")
        item4.additionImage = [UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women"), UIImage(named: "women")] as! [UIImage]

        ItemManager.sharedInstance.items.append(contentsOf: [item1, item2, item3, item4, item1, item2, item3, item4, item1, item2, item3, item4, item1, item2, item3, item4, item1, item2, item3, item4, item1, item2, item3, item4])
    }
 */
}

