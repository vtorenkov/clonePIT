//
//  RecordVideoViewController.swift
//  Pitchit
//
//  Created by Alex on 8/23/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import CameraManager

class RecordVideoViewController: UIViewController {
    weak var item: ItemModel?
    @IBOutlet var cameraButton: UIButton!
    let cameraManager = CameraManager()

    @IBOutlet var addButtonOutlet: UIButton!
    @IBOutlet var cameraView: UIView!
    
    var urlString = "" {
        didSet {
            if let item = self.item {
                DispatchQueue.main.async { [unowned self] in
                    if self.urlString.isEmpty {
                        self.addButtonOutlet.isEnabled = false
                    } else {
                        self.addButtonOutlet.isEnabled = true
                    }
                    item.videoUrl = self.urlString
                }
            }
        }
    }
    
//    deinit {
//        print("deinit RecordVideoViewController")
//        cameraManager.stopAndRemoveCaptureSession()
//        cameraManager.stopCaptureSession()
//
//    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraManager.resumeCaptureSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.black;

        cameraManager.shouldFlipFrontCameraImage = false
        cameraManager.showAccessPermissionPopupAutomatically = false
        self.cameraButton.setTitleColor(UIColor.white, for: .selected)
        self.cameraButton.setTitleColor(UIColor.white, for: .normal)
        
        self.cameraButton.setTitle("Stop", for: UIControlState.selected)
        self.cameraButton.setTitle("Record", for: UIControlState.normal)
        
        self.cameraButton.tintColor = UIColor.clear
        self.cameraButton.roundCorners()
        self.cameraButton.isEnabled = false
        
        let currentCameraState = cameraManager.currentCameraStatus()
        
        if currentCameraState == .notDetermined {
            self.cameraManager.askUserForCameraPermission({ permissionGranted in
                if permissionGranted {
                    self.addCameraToView()
                    self.cameraManager.resumeCaptureSession()
                } else {
                    self.alert(message: "Please enable this option from global settings of your phone")
                }
            })
        } else if currentCameraState == .ready {
            self.addCameraToView()
        }
        
       
        self.urlString = ""
    }
    
    // MARK: - ViewController
    fileprivate func addCameraToView()
    {
        cameraManager.addLayerPreviewToView(cameraView, newCameraOutputMode: CameraOutputMode.videoWithMic) {
            DispatchQueue.main.async { [unowned self] in
                self.cameraButton.isEnabled = true
            }
        }
        cameraManager.showErrorBlock = { [weak self] (erTitle: String, erMessage: String) -> Void in
            
            let alertController = UIAlertController(title: erTitle, message: erMessage, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (alertAction) -> Void in  }))
            
            self?.present(alertController, animated: true, completion: nil)
        }
    }

    
    @IBAction func recordButton(_ sender: UIButton) {
        cameraButton.isSelected = !cameraButton.isSelected
        
        if sender.isSelected {
            self.urlString = ""
            cameraManager.startRecordingVideo()
        } else {
            cameraManager.stopCaptureSession()
            cameraManager.stopVideoRecording({ (videoURL, error) -> Void in
                DispatchQueue.main.async { [unowned self] in
                    self.cameraManager.stopCaptureSession()
                    if error != nil {
                        self.cameraManager.showErrorBlock("Error occurred", "Cannot save video.")
                    } else {
                        if let urlString = videoURL?.absoluteString {
                            self.urlString = urlString
                        }
                    }
                }
            })
        }
    }
    
    @IBAction func addVideoToItem(_ sender: Any) {
        cameraManager.stopAndRemoveCaptureSession()
        self.navigationController?.popViewController(animated: true)
    }
    
}
