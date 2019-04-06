//
//  EditProfileViewController.swift
//  Pitchit
//  
//  Created by Alex on 10/15/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    fileprivate var editProfileTableViewDatasource: EditProfileTableViewDatasource?
    fileprivate var editProfileTableViewDelegate: EditProfileTableViewDelegate?
    let imagePicker = UIImagePickerController()
    var profile: UserProfile?
    
    lazy var service: UserViewClient = UserViewManager()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        self.title = "Edit Profile".uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]
        self.editProfileTableViewDelegate = EditProfileTableViewDelegate(self)
        self.editProfileTableViewDatasource = EditProfileTableViewDatasource(tableView: tableView, delegate: self.editProfileTableViewDelegate!, delegateVC: self)
        let itemButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = itemButton
    }
    
    @IBAction func closeAction(_ sender: Any) {
        if let user = self.profile {
            service.userUpdateProfile(user: user) { (succes, message) in
                if succes {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.alert(message: message)
                }
            }
        }
    }
}

extension EditProfileViewController: EditProfileTableItemDelegate {
    
    func selectPhoto() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func addPurchaseMethod() {
        RouterItem.sharedInstance.openAddCard(target: self)
    }
    
    func removePurchaseMethod() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Remove Card", style: .destructive , handler:{ (UIAlertAction)in
            print("User click Approve button")
        }))
        
        alert.addAction(UIAlertAction(title: "Make Default", style: .default , handler:{ (UIAlertAction)in
            print("User click Edit button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}


// MARK: - UIImagePickerControllerDelegate Methods
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if let user = self.profile {
                let data = UIImagePNGRepresentation(pickedImage)
                user.editedImage = data
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
