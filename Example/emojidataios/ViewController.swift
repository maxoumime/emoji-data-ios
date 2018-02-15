//
//  ViewController.swift
//  emojidataios
//
//  Created by Maxime Bertheau on 04/12/2017.
//  Copyright (c) 2017 Maxime Bertheau. All rights reserved.
//

import UIKit
import emojidataios

class ViewController: UIViewController {

  @IBOutlet weak var emojisTextView: UITextView!
  @IBOutlet weak var aliasesTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    EmojiParser.prepare()
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(self.keyboardWillShowForResizing),
                                           name: Notification.Name.UIKeyboardWillShow,
                                           object: nil)
    
    emojisTextView.becomeFirstResponder()
    
    emojisTextView.delegate = self
    aliasesTextView.delegate = self
    
    textViewDidChange(emojisTextView)
    
    emojisTextView.layer.borderColor = UIColor.black.cgColor
    emojisTextView.layer.borderWidth = 1
    
    aliasesTextView.layer.borderColor = UIColor.black.cgColor
    aliasesTextView.layer.borderWidth = 1
  }
  
  func keyboardWillShowForResizing(notification: Notification) {
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
      let window = self.view.window?.frame {
      // We're not just minusing the kb height from the view height because
      // the view could already have been resized for the keyboard before
      self.view.frame = CGRect(x: self.view.frame.origin.x,
                               y: self.view.frame.origin.y,
                               width: self.view.frame.width,
                               height: window.origin.y + window.height - keyboardSize.height)
    } else {
      debugPrint("We're showing the keyboard and either the keyboard size or window is nil: panic widely.")
    }
  }
}

extension ViewController: UITextViewDelegate {
  
  func textViewDidChange(_ textView: UITextView) {
    
    if !textView.isFirstResponder {
      return
    }
    
    guard let content = textView.text else { return }
    
    if textView == emojisTextView {
     
      let aliases = EmojiParser.parseUnicode(content)
      
      guard aliasesTextView.text != aliases else { return }
      
      aliasesTextView.text = aliases
      
    } else {
      
      let emojis = EmojiParser.parseAliases(content)
      
      guard emojisTextView.text != emojis else { return }
      
      emojisTextView.text = emojis
      
    }
  }
}
