//
//  ChatViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    @IBOutlet var chatSegment: UISegmentedControl!
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat".uppercased()
        setup(segment: chatSegment)
    }
    
    @IBAction func switchAction(_ sender: Any) {
        chatSegment.changeUnderlinePosition()
    }
   
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension ChatViewController {
    func setup(segment: UISegmentedControl) {
        let widthSegment = kScreenWidth / 3
        segment.setWidth(widthSegment, forSegmentAt: 0)
        segment.setWidth(widthSegment, forSegmentAt: 1)
        segment.setWidth(widthSegment, forSegmentAt: 2)

        segment.addUnderlineForSelectedSegment()
        segment.tintColor = UIColor.switchBlue
        
        let titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        segment.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        let titleTextAttributesUnselected = [NSAttributedStringKey.foregroundColor: UIColor.lightGray]
        segment.setTitleTextAttributes(titleTextAttributesUnselected, for: .normal)
    }
}
