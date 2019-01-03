//
//  PostItemController.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import NYTPhotoViewer

extension PostItemController: ItemDescTableItemDelegate {
    func uploadItem() {
        item.author = UserShared.sharedInstance.user
        item.dateOfPost = Date().toString()
        ItemManager.sharedInstance.items.append(item)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func selectImageFullSize(image: UIImage?) {
        let dataSource = DataSource(image: image)
        let photoController = NYTPhotosViewController(dataSource: dataSource)
        self.present(photoController, animated: true, completion: nil)
    }
    
    func addPhoto() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension PostItemController: PostItemTableItemDelegate{
    func nextPostItemScreen() {
        self.view.endEditing(true)
        if self.validateItem() {
            RouterItem.sharedInstance.openPostItemDesc(target: self, item: self.item)
        }
    }
    
    func addVideoToItem() {
        self.view.endEditing(true)
        self.presenter.addVideoCapture(currentVC: self)
    }
}

class PostItemController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var item = ItemModel()
    lazy var presenter: PostItemPresenter = PostItemPresenter(view: self, item: item)
    let imagePicker = UIImagePickerController()

    @IBAction func closeAction(_ sender: Any) {
        self.alertYesNo(title: "Close?", message: "Are you sure?") { (yes) in
            if yes {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    fileprivate var addItemViewDatasource: PostItemTableViewDatasource?
    fileprivate var addItemViewDelegate: PostItemTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addItemViewDelegate = PostItemTableViewDelegate(self)
        self.addItemViewDatasource = PostItemTableViewDatasource(tableView: tableView, delegate: self.addItemViewDelegate!, delegateVC: self, item: item, delegateVCDesc: self)
        self.title = "Add Item"
        imagePicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    func validateItem() -> Bool {
        if self.item.title.isEmpty || self.item.place.isEmpty || self.item.price.isEmpty  {
            self.alert(message: "Please feal all fields")
            return false
        }
        if self.item.videoUrl.isEmpty {
            self.alert(message: "Please record a video")
            return false
        }
        return true
    }
}


extension PostItemController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.item.additionImage.append(pickedImage)
            self.tableView.reloadData()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        
    }
}
