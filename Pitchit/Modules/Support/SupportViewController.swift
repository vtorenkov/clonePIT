//
//  SupportViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var typeYourMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeYourMessage.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0)
        submitButton.roundCornersSmall()
        self.title = "Support".uppercased()
        typeYourMessage.textColor = UIColor.placeholderColorInTextView
        typeYourMessage.font = UIFont.mainFonSFUItLight(ofSize: 18)
        typeYourMessage.returnKeyType = .done
        typeYourMessage.delegate = self
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Type your message" {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Type your message"
            textView.textColor = UIColor.placeholderColorInTextView
        }
    }
}
