//
//  Emoji.swift
//  emoji-data-ios
//
//  Created by Maxime Bertheau on 4/12/17.
//  Copyright © 2017 Maxime Bertheau. All rights reserved.
//

import Foundation

public class Emoji {
  public var name: String = ""
  public var shortName: String
  var unified: String
  var skinVariations: [SkinVariation] = []
  var category: EmojiCategory?
  public var isObsoleted: Bool = false
  var sortOrder: Int = 0
  
  public var emoji: String {
    return getEmojiFor(unified: self.unified)
  }
  
  init(shortName: String, unified: String) {
    self.shortName = shortName
    self.unified = unified
  }
  
  convenience init(
    name: String,
    shortName: String,
    unified: String,
    skinVariations: [SkinVariation],
    category: EmojiCategory?,
    isObsoleted: Bool,
    sortOrder: Int
    ) {
    self.init(shortName: shortName, unified: unified)
    self.skinVariations = skinVariations
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

  func getEmojiWithSkinVariation(_ skinVariationType: SkinVariationTypes) -> String {
    getEmojiWithSkinVariations([skinVariationType])
  }
  
  func getEmojiWithSkinVariations(_ skinVariationTypes: [SkinVariationTypes]) -> String {
    if (skinVariationTypes.isEmpty) { return emoji }

    guard let skinVariation = self.skinVariations.first(where: { $0.skinVariationTypes == skinVariationTypes }) else { return emoji }
    
    let unifiedVariation = skinVariation.unified

    return getEmojiFor(unified: unifiedVariation)
  }
  
  func clone() -> Emoji {
    Emoji(
      name: self.name,
      shortName: self.shortName,
      unified: self.unified,
      skinVariations: self.skinVariations,
      category: self.category,
      isObsoleted: self.isObsoleted,
      sortOrder: self.sortOrder
    )
  }
}

class SkinVariation {
  var unified: String
  var skinVariationTypes: [SkinVariationTypes]
  
  init(unified: String, skinVariations: [SkinVariationTypes]) {
    self.unified = unified
    self.skinVariationTypes = skinVariations
  }
}

