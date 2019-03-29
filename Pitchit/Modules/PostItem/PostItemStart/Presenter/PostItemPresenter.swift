//
//  PostItemPresenter.swift
//  Pitchit
//
//  Created by Alex on 8/22/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import MobileCoreServices

class PostItemPresenter:NSObject, Presenter {
    var videoPickedBlock: ((NSURL) -> Void)?
    weak var currentVC: UIViewController?
    weak var item: ItemModel?
    
    typealias PresenterView = PostItemController
    
    weak var view: PresenterView!
    let service:CreatePostViewClient
    
    func saveItem(item: ItemModel) {
        service.createPost(offer: item) { (success) in
            
        }
    }
    
    required init(view: PresenterView, item: ItemModel, service: CreatePostViewClient = CreatePostViewManager()) {
        self.view = view
        self.item = item
        self.service = service
    }
    
    func addVideoCapture(currentVC: UIViewController) {
        RouterItem.sharedInstance.openRecordVideo(target: currentVC, item: item)
        /*
         if UIImagePickerController.isSourceTypeAvailable(.camera){
         self.currentVC = currentVC
         let myPickerController = UIImagePickerController()
         myPickerController.delegate = self
         myPickerController.sourceType = .photoLibrary
         myPickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeVideo as String]
         currentVC.present(myPickerController, animated: true, completion: nil)
         }
         */
    }
}

extension PostItemPresenter: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //        // To handle image
        //        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        //            self.imagePickedBlock?(image)
        //        } else{
        //            print("Something went wrong in  image")
        //        }
        // To handle video
        
        if let videoUrl = info[UIImagePickerControllerMediaURL] as? NSURL{
            print("videourl: ", videoUrl)
            //trying compression of video
            let data = NSData(contentsOf: videoUrl as URL)!
            print("File size before compression: \(Double(data.length / 1048576)) mb")
            compressWithSessionStatusFunc(videoUrl)
        }
        else{
            print("Something went wrong in  video")
        }
        self.currentVC?.dismiss(animated: true, completion: nil)
    }
    
    
    func compressVideo(inputURL: URL, outputURL: URL, handler:@escaping (_ exportSession: AVAssetExportSession?)-> Void) {
        let urlAsset = AVURLAsset(url: inputURL, options: nil)
        guard let exportSession = AVAssetExportSession(asset: urlAsset, presetName: AVAssetExportPreset1280x720) else {
            handler(nil)
            return
        }
        
        exportSession.outputURL = outputURL
        exportSession.outputFileType = AVFileType.mov
        exportSession.shouldOptimizeForNetworkUse = true
        exportSession.exportAsynchronously { () -> Void in
            handler(exportSession)
        }
    }
    
    fileprivate func compressWithSessionStatusFunc(_ videoUrl: NSURL) {
        let compressedURL = NSURL.fileURL(withPath: NSTemporaryDirectory() + NSUUID().uuidString + ".MOV")
        compressVideo(inputURL: videoUrl as URL, outputURL: compressedURL) { (exportSession) in
            guard let session = exportSession else {
                return
            }
            
            switch session.status {
            case .completed:
                guard let compressedData = NSData(contentsOf: compressedURL) else {
                    return
                }
                print("File size after compression: \(Double(compressedData.length / 1048576)) mb")
                
                DispatchQueue.main.async {
                    self.item?.videoUrl = compressedURL.absoluteString
                }
            default: break
            }
        }
    }
    
}
