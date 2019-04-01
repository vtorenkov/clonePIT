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
        self.view.endEditing(true)
        item.dateOfPost = Date().toString()
        presenter.saveItem(item: item)
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

class PostItemController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var item = ItemModel()
    @IBOutlet var closeItem: UIBarButtonItem!
    
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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]

        self.addItemViewDelegate = PostItemTableViewDelegate(self)
        self.addItemViewDatasource = PostItemTableViewDatasource(tableView: tableView, delegate: self.addItemViewDelegate!, delegateVC: self, item: item, delegateVCDesc: self)
        self.title = "POST AN ITEM".uppercased()
        imagePicker.delegate = self
        
        closeItem.setTitleTextAttributes([
            NSAttributedStringKey.font : UIFont.mainFonSFUItMedium(ofSize: 17),
            NSAttributedStringKey.foregroundColor : UIColor.navBarColorItem,
            ], for: .normal)
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

// MARK: - UIImagePickerControllerDelegate Methods
extension PostItemController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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


//from start where was 2 separate screns for add item. now is one screen. using only ItemDescTableItemDelegate.
extension PostItemController: PostItemTableItemDelegate {
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
