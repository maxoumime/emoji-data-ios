//
//  EmojiManager.swift
//  Pods
//
//  Created by Maxime Bertheau on 4/12/17.
//
//

import Foundation

class EmojiManager {
  
  var emojis: [Emoji] = []
  var shortNameForUnified: [String:[Emoji]] = [:]
  var emojisForCategory: [EmojiCategory:[Emoji]] = [:]
  var emojiForUnified: [String:[Emoji]] = [:]
  var emojiForUnicode: [String: Emoji] = [:]

  init() {

    guard let emojisListFilePath = Bundle(for: EmojiManager.self).path(forResource: "emojilist", ofType: "json") else {
      print("emojilist.json was not found")
      return
    }
    
    let emojisListData = FileManager.default.contents(atPath: emojisListFilePath)
    
    do {
      
      if let jsonArray = try JSONSerialization.jsonObject(with: emojisListData!, options: .allowFragments) as? [[String: Any]] {
        
        jsonArray.forEach { (emoji: [String:Any]) in
          
          let name = emoji["name"] as? String
          let isObsoleted = emoji["obsoleted_by"] != nil
          let sortOrder: Int = emoji["sort_order"] as? Int ?? 0
          
          var category: EmojiCategory? = nil
          if let categoryName = emoji["category"] as? String {
            category = EmojiCategory(rawValue: categoryName)
          }
          
          var unifieds: [String] = []
          
          if let unifiedJson = emoji["unified"] as? String {
            unifieds.append(unifiedJson)
          }
          
          if let variations = emoji["variations"] as? [String] {
            variations.forEach { unifieds.append($0) }
          }
          
          unifieds.reverse()
          
          unifieds.forEach { unified in

            if let shortNames = emoji["short_names"] as? [String] {
              shortNames.forEach { shortName in
                
                let emojiSkinVariations = emoji["skin_variations"] as? [[String]]
                
                var skinVariations: [SkinVariation]
                
                if let emojiSkinVariations = emojiSkinVariations {
                  skinVariations = emojiSkinVariations.compactMap {
                    guard let skinVariationTypes = SkinVariationTypes.getFromUnified($0[0]) else {
                      return nil
                      
                    }
                    return SkinVariation(unified: $0[1], skinVariations: skinVariationTypes)
                  }
                  
                } else {
                  skinVariations = []
                }
                
                let emojiObject = Emoji(
                  name: name ?? "",
                  shortName: shortName,
                  unified: unified,
                  skinVariations: skinVariations,
                  category: category,
                  isObsoleted: isObsoleted,
                  sortOrder: sortOrder
                )
                
                emojis.append(emojiObject)
              }
            }
          }
        }
      }
      
      var namesInsertedInCategories: Set<String> = []
      emojis
        .sorted { $0.isObsoleted && $1.isObsoleted }
        .forEach { emoji in
          emojiForUnicode[emoji.emoji] = emoji

          var emojiListFromDictionary = shortNameForUnified[emoji.shortName] ?? []
          emojiListFromDictionary.append(emoji)
          shortNameForUnified[emoji.shortName] = emojiListFromDictionary
          
          
          var emojisForUnified  = emojiForUnified[emoji.unified] ?? []
          emojisForUnified.append(emoji)
          emojiForUnified[emoji.unified] = emojisForUnified
          
          emoji.skinVariations.forEach { variation in
            var emojisVariationForUnified  = emojiForUnified[variation.unified] ?? []
            
            let emojiVariation = emoji.clone()
            emojiVariation.shortName = emoji.shortName + ":" + variation.skinVariationTypes.map { ":\($0.getAliasValue())" }.joined(separator: ":")
            
            emojisVariationForUnified.append(emojiVariation)
            emojiForUnified[variation.unified] = emojisVariationForUnified
          }
          
          if let category = emoji.category {
            
            if namesInsertedInCategories.contains(emoji.name) { return }
            
            var emojisInCategory = emojisForCategory[category] ?? []
            emojisInCategory.append(emoji)
            emojisInCategory.sort(by: { $0.sortOrder < $1.sortOrder })
            
            if !emoji.name.isEmpty {
              namesInsertedInCategories.insert(emoji.name)
            }
            
            emojisForCategory[category] = emojisInCategory
          }
          
      }
      
    }
    catch {
      print("Could not load emoji list \(error)")
    }
  }
  
  func getEmojisForCategory(_ category: EmojiCategory) -> [Emoji]? {
    return emojisForCategory[category]
  }
}
