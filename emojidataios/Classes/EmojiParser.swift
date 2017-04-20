//
//  EmojiParser.swift
//  Pods
//
//  Created by Maxime Bertheau on 4/12/17.
//
//

import Foundation

open class EmojiParser {
  
  fileprivate static let emojiManager = EmojiManager()
  
  fileprivate static var aliasMatchingRegex: NSRegularExpression?
  fileprivate static var aliasMatchingRegexColonsOptional: NSRegularExpression?

  open static func getAliasesFromUnicode(_ unicode: String) -> [String] {
    
    guard let leaf = emojiManager.getLeafForBytes(bytes: [UInt8](unicode.utf8)) else { return [] }
    
    return leaf.emojis.map { $0.shortName }
  }
  
  open static func getUnicodeFromAlias(_ alias: String) -> String? {
    
    if aliasMatchingRegex == nil {
      do {
          aliasMatchingRegex = try NSRegularExpression(pattern: ":?([\\w_+-]+)(?:(?:\\||::)(type_[\\w_]*))?:?", options: .caseInsensitive)
      } catch {
        return nil
      }
    }
    
    guard let aliasMatchingRegex = aliasMatchingRegex else { return nil }
    
    let input = alias as NSString
      
    let matches = aliasMatchingRegex.matches(in: alias, options: .withoutAnchoringBounds, range: NSRange(location: 0, length: alias.characters.count))
    
    if(matches.count == 0) {
      return input as String!
    }
    
    let match = matches[0]
    
    let alias = input.substring(with: match.rangeAt(1))
    
    var skinVariationString: String?
    let skinVariationLocation = match.rangeAt(2)
    
    if skinVariationLocation.location + skinVariationLocation.length < input.length  {
      
      let skinVariationExtracted = input.substring(with: match.rangeAt(2))
      
      if skinVariationExtracted.characters.count > 0 {
        skinVariationString = skinVariationExtracted
      }
    }
    
    guard let emojiObject = getEmojiFromAlias(alias) else { return nil }
    
    let emoji: String
    if let skinVariationStringUnWrapped = skinVariationString, let skinVariation = SkinVariations(rawValue: skinVariationStringUnWrapped.uppercased()){
      emoji = emojiObject.getEmojiWithSkinVariation(skinVariation)
    } else {
      emoji = emojiObject.emoji
    }
    return emoji
   
  }
  
  open static func getEmojiFromUnified(_ unified: String) -> String {
    
    return Emoji(shortName: "", unified: unified).emoji
  }
  
  static func getEmojiFromAlias(_ alias: String) -> Emoji? {
    
    guard let emoji = emojiManager.shortNameForUnified[alias] else { return nil }
    
    return emoji
  }
  
  open static func parseUnicode(_ input: String) -> String {
    
    var resultData: [UInt8] = []

    var matchedEmoji: Emoji?
    
    let data = input.data(using: .utf8, allowLossyConversion: false)
    
    var lastNode: Node?
    var indexOfFirstUnknown: Int? = nil
    
    data?.forEach { byte in
      
      let leaf: Node?
      if let lastNode = lastNode {
        leaf = EmojiManager.getLeafForBytes(root: lastNode, bytes: [byte])
      } else {
          leaf = emojiManager.getLeafForBytes(bytes: [byte])
      }
      
      if let leaf = leaf {
        matchedEmoji = leaf.emojis.first
        lastNode = leaf
        
        if let indexOfDataToTest = indexOfFirstUnknown {
          let dataToTest = resultData[indexOfDataToTest..<resultData.count]
          
          if String(bytes: dataToTest, encoding: .utf8) == nil {
            resultData.removeSubrange(indexOfDataToTest..<resultData.count)
            indexOfFirstUnknown = nil
          }
        }
        
      } else {
        lastNode = nil
        
        if let emoji = matchedEmoji {
          resultData.append(contentsOf: [UInt8](":\(emoji.shortName):".utf8))
          matchedEmoji = nil
          indexOfFirstUnknown = nil
        }
        
        if let backupLeaf = emojiManager.getLeafForBytes(bytes: [byte]) {
          matchedEmoji = backupLeaf.emojis.first
          lastNode = backupLeaf
          
          
          if let indexOfDataToTest = indexOfFirstUnknown {
            let dataToTest = resultData[indexOfDataToTest..<resultData.count]
            
            if String(bytes: dataToTest, encoding: .utf8) == nil {
              resultData.removeSubrange(indexOfDataToTest..<resultData.count)
              indexOfFirstUnknown = nil
            }
          }
          
        } else {
          
          if indexOfFirstUnknown == nil {
            indexOfFirstUnknown = resultData.count
          }
          
          resultData.append(byte)
        }
      }
    }
    
    if let emoji = matchedEmoji {
      resultData.append(contentsOf: [UInt8](":\(emoji.shortName):".utf8))
      matchedEmoji = nil
    }
    
    if let indexOfDataToTest = indexOfFirstUnknown {
      let dataToTest = resultData[indexOfDataToTest..<resultData.count]
      
      if String(bytes: dataToTest, encoding: .utf8) == nil {
        resultData.removeSubrange(indexOfDataToTest..<resultData.count)
      }
    }
    
    return String(bytes: resultData, encoding: .utf8) ?? ""

  }
  
  open static func parseAliases(_ input: String) -> String {
    
    if aliasMatchingRegexColonsOptional == nil {
      do {
        aliasMatchingRegexColonsOptional = try NSRegularExpression(pattern: ":?([\\w_+-]+)(?:(?:\\||::)(type_[\\w_]*))?:?", options: .caseInsensitive)
      } catch {
        return input
      }
    }
    
    guard let aliasMatchingRegexColonsOptional = aliasMatchingRegexColonsOptional else { return input }
    
    var result = input
    
    let matches = aliasMatchingRegexColonsOptional.matches(in: input, options: .withoutAnchoringBounds, range: NSRange(location: 0, length: input.characters.count))
    
    if(matches.count == 0) {
      return input
    }
    
    let nsInput = input as NSString

    var uniqueMatches: [String:String?] = [:]
    
    matches.forEach {
    
      let fullAlias = nsInput.substring(with: $0.rangeAt(0))
      
      if uniqueMatches.index(forKey: fullAlias) == nil {
        
        uniqueMatches[fullAlias] = getUnicodeFromAlias(fullAlias)
      }
      
    }
    
    uniqueMatches
      .sorted(by: { $0.0.key.characters.count > $0.1.key.characters.count }) // Execute the longer first so emojis with skin variations are executed before the ones without
      .forEach { alias, emoji in
        
        if let emoji = emoji {
          result = result.replacingOccurrences(of: alias, with: emoji)
        }
    }
    
    return result
  }
  
}
