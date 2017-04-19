//
//  EmojiManager.swift
//  Pods
//
//  Created by Maxime Bertheau on 4/12/17.
//
//

import Foundation

class EmojiManager {
  
  let emojiTreeRoot: Node = Node(byte: 0)
  var shortNameForUnified: [String:Emoji] = [:]
  
  init() {

    let startTime = Date()
    guard let emojisListFilePath = Bundle(for: EmojiManager.self).path(forResource: "emojilist", ofType: "json") else {
      print("emojilist.json was not found")
      exit(1)
    }
    
    let emojisListData = FileManager.default.contents(atPath: emojisListFilePath)
    
    do {
      let loadStartTime = Date()
      if let jsonArray = try JSONSerialization.jsonObject(with: emojisListData!, options: .allowFragments) as? [[String: Any]] {
        let loadEndime = Date()
        print("EmojiManager: File parsing time: \(loadEndime.timeIntervalSince1970 - loadStartTime.timeIntervalSince1970) sec.")
        
        jsonArray.forEach { (emoji: [String:Any]) in
          
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
                
                let emojiObject = Emoji(shortName: shortName, unified: unified, supportsSkinVariation: emojiHasSkinVariation)
                
                addEmoji(emojiObject)
              }
            }
          }
        }
      }
    }
    catch {
      print("Could not load emoji list")
    }
    
    let endTime = Date()
    print("EmojiManager: Initialization time: \(endTime.timeIntervalSince1970 - startTime.timeIntervalSince1970) sec.")
    
  }
  
  func addEmoji(_ emoji: Emoji) {
    shortNameForUnified[emoji.shortName] = emoji
    getLeafForBytes(bytes: [UInt8](emoji.emoji.utf8), withCreation: true)?.emojis.append(emoji)
    
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
