//
//  Emoji.swift
//  emoji-data-ios
//
//  Created by Maxime Bertheau on 4/12/17.
//  Copyright © 2017 Maxime Bertheau. All rights reserved.
//

import Foundation

class Emoji {
  var name: String = ""
  var shortName: String
  var unified: String
  var supportsSkinVariation: Bool = false
  var category: EmojiCategory?
  var isObsoleted: Bool = false
  var sortOrder: Int = 0
  
  var emoji: String {
    return getEmojiFor(unified: self.unified)
  }
  
  init(shortName: String, unified: String) {
    self.shortName = shortName
    self.unified = unified
  }
  
  convenience init(name: String, shortName: String, unified: String, supportsSkinVariation: Bool, category: EmojiCategory?, isObsoleted: Bool, sortOrder: Int) {
    self.init(shortName: shortName, unified: unified)
    self.supportsSkinVariation = supportsSkinVariation
    self.name = name
    self.category = category
    self.isObsoleted = isObsoleted
    self.sortOrder = sortOrder
  }

  func getEmojiFor(unified: String) -> String {
    let unifieds: [String] = unified.components(separatedBy: "-")
    var emoji = ""
    unifieds.forEach { unified in
      if let intValue = Int(unified, radix: 16), let unicode = UnicodeScalar(intValue) {
        emoji += String(unicode)
      }
    }
    return emoji
  }
  
  func getEmojiWithSkinVariation(_ skinVariation: SkinVariations) -> String {
    
    guard supportsSkinVariation else { return emoji }
    
    let unifiedVariation = "\(unified)-\(skinVariation.getUnifiedValue())"
    
    return getEmojiFor(unified: unifiedVariation)
  }
}

