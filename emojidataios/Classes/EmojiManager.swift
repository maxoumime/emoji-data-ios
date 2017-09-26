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
  let emojiTreeRoot: Node = Node(byte: 0)
  var shortNameForUnified: [String:[Emoji]] = [:]
  var emojisForCategory: [EmojiCategory:[Emoji]] = [:]
  
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
            category = EmojiCategory(rawValue: categoryName.uppercased())
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
                
                let emojiHasSkinVariation = emoji.index(forKey: "skin_variations") != nil
                
                let emojiObject = Emoji(name: name ?? "", shortName: shortName, unified: unified, supportsSkinVariation: emojiHasSkinVariation, category: category, isObsoleted: isObsoleted, sortOrder: sortOrder)
                
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
          
          var emojiListFromDictionary = shortNameForUnified[emoji.shortName] ?? []
          emojiListFromDictionary.append(emoji)
//          emojiListFromDictionary.sort(by: { $1.unified.characters.count > $0.unified.characters.count })
          
          shortNameForUnified[emoji.shortName] = emojiListFromDictionary
          getLeafForBytes(bytes: [UInt8](emoji.emoji.utf8), withCreation: true)?.emojis.append(emoji)
          
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
      print("Could not load emoji list")
    }
  }
  
  func getEmojisForCategory(_ category: EmojiCategory) -> [Emoji]? {
    return emojisForCategory[category]
  }
  
  func getLeafForBytes(bytes originalBytes: [UInt8], withCreation: Bool = false) -> Node? {
    return EmojiManager.getLeafForBytes(root: emojiTreeRoot, bytes: originalBytes, withCreation: withCreation)
  }
  
  static func getLeafForBytes(root: Node, bytes originalBytes: [UInt8], withCreation: Bool = false) -> Node? {
    
    var bytes = originalBytes
    
    var node: Node
    let byte = bytes.removeFirst()
    
    let matchingChildren = root.children.filter { $0.byte == byte }
    
    if matchingChildren.count == 0 {
      
      guard withCreation else { return nil }

      node = Node(byte: byte)
      node.parent = root
      root.children.append(node)

    } else {
      node = matchingChildren[0]
    }
    
    return bytes.isEmpty ? node : getLeafForBytes(root: node, bytes: bytes, withCreation: withCreation)
  }
  
}
