//
//  PostItemDescViewController.swift
//  Pitchit
//
//  Created by Alex on 8/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import NYTPhotoViewer

extension PostItemDescViewController: ItemDescTableItemDelegate {
    func uploadItem() {
        if let item = self.item {
            item.author = UserShared.sharedInstance.user
            item.dateOfPost = Date().toString()
            ItemManager.sharedInstance.items.append(item)
        }
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

class PostItemDescViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    fileprivate var addItemViewDatasource: ItemDescTableViewDatasource?
    fileprivate var addItemViewDelegate: ItemDescTableViewDelegate?
    weak var item: ItemModel?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet var closeItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.title = "Post an Item".uppercased()
        if let item = self.item {
            self.addItemViewDelegate = ItemDescTableViewDelegate(self)
            self.addItemViewDatasource = ItemDescTableViewDatasource(tableView: tableView, delegate: self.addItemViewDelegate!, delegateVC: self, item: item)
        }
        closeItem.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.mainFonSFUItMedium(ofSize: 17),
            NSAttributedStringKey.foregroundColor : UIColor.navBarColorItem,
            ], for: .normal)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.alertYesNo(title: "Close?", message: "Are you sure?") { (yes) in
            if yes {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

}

extension PostItemDescViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.item?.additionImage.append(pickedImage)
            self.tableView.reloadData()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)

    }
}
