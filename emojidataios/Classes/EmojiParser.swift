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
  
  fileprivate static var _aliasMatchingRegex: NSRegularExpression?
  fileprivate static var aliasMatchingRegex: NSRegularExpression {
    if _aliasMatchingRegex == nil {
      do {
        _aliasMatchingRegex = try NSRegularExpression(pattern: ":([\\w_+-]+)(?:(?:\\||::)((type_|skin-tone-)[\\w_]*))?:", options: .caseInsensitive)
      } catch {
        
      }
    }
    return _aliasMatchingRegex!
  }

  fileprivate static var _aliasMatchingRegexOptionalColon: NSRegularExpression?
  fileprivate static var aliasMatchingRegexOptionalColon: NSRegularExpression {
    if _aliasMatchingRegexOptionalColon == nil {
      do {
        _aliasMatchingRegexOptionalColon = try NSRegularExpression(pattern: ":?([\\w_+-]+)(?:(?:\\||::)((type_|skin-tone-)[\\w_]*))?:?", options: .caseInsensitive)
      } catch {
        
      }
    }
    return _aliasMatchingRegexOptionalColon!
  }

  
  open static func getAliasesFromUnicode(_ unicode: String) -> [String] {
    
    let escapedUnicode = unicode.unicodeScalars.map { $0.escaped(asASCII: true) }
      .map { (escaped: String) -> String? in
      
          if (!escaped.hasPrefix("\\u{")) {
            return escaped.unicodeScalars.map { (unicode: Unicode.Scalar) -> String in
              
              var hexValue = String(unicode.value, radix: 16).uppercased()
              
              while(hexValue.count < 4) {
                hexValue = "0" + hexValue
              }
              
              return hexValue
              }.reduce("", +)
          }
        
          // Cleaning
        
          // format \u{XXXXX}
          var cleaned = escaped.dropFirst(3).dropLast()
          // removing unecessary 0s
          while (cleaned.hasPrefix("0") && cleaned.count > 4) {
            cleaned = cleaned.dropFirst()
          }
        
          return String(cleaned)
        
      }
    
    if escapedUnicode.contains(where: { $0 == nil }) {
      return []
    }
    
    let unified = (escapedUnicode as! [String]).joined(separator: "-")
    
    return emojiManager.emojiForUnified[unified]?.map { $0.shortName } ?? []
  }
  
  open static func getUnicodeFromAlias(_ alias: String) -> String? {
    
    let input = alias as NSString
    
    let matches = aliasMatchingRegexOptionalColon.matches(in: alias, options: .withoutAnchoringBounds, range: NSRange(location: 0, length: alias.count))
    
    if(matches.count == 0) {
      return nil
    }
    
    let match = matches[0]
    
    let alias = input.substring(with: match.rangeAt(1))
    
    var skinVariationString: String?
    let skinVariationLocation = match.rangeAt(2)
    
    if skinVariationLocation.location + skinVariationLocation.length < input.length  {
      
      let skinVariationExtracted = input.substring(with: match.rangeAt(2))
      
      if skinVariationExtracted.count > 0 {
        skinVariationString = skinVariationExtracted
      }
    }
    
    guard let emojiObject = getEmojiFromAlias(alias) else { return nil }
    
    let emoji: String
    if let skinVariationStringUnWrapped = skinVariationString,
      let skinVariation = SkinVariations(rawValue: skinVariationStringUnWrapped.uppercased()) ?? SkinVariations.getFromAlias(skinVariationStringUnWrapped.lowercased()) {
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
    
    return emoji.first
  }
  
  open static func parseUnicode(_ input: String) -> String {
    
    return input
      .map {
        ($0, $0.unicodeScalars.map { $0.escaped(asASCII: true) })
      }
      .reduce("") { result, mapped in
        
        let fallback = mapped.0
        let unicode = mapped.1
        
        let maybeEmojiAlias = unicode.map { (escaped: String) -> String in
          
          if (!escaped.hasPrefix("\\u{")) {
            return escaped
          }
          
          // Cleaning
          
          // format \u{XXXXX}
          var cleaned = escaped.dropFirst(3).dropLast()
          // removing unecessary 0s
          while (cleaned.hasPrefix("0")) {
            cleaned = cleaned.dropFirst()
          }
          
          return String(cleaned)
          
        }.joined(separator: "-")
        
        let toDisplay: String
        
        if let emoji = emojiManager.emojiForUnified[maybeEmojiAlias]?.first {
          toDisplay = ":\(emoji.shortName):"
        } else {
          toDisplay = String(fallback)
        }
        
        return "\(result)\(toDisplay)"
    }
  }
  
  open static func parseAliases(_ input: String) -> String {
  
    var result = input
    
    getUnicodesForAliases(input).forEach { alias, emoji in
      if let emoji = emoji {
        result = result.replacingOccurrences(of: alias, with: emoji)
      }
    }
    
    return result
  }
  
  open static func getUnicodesForAliases(_ input: String) -> [(key: String, value: String?)] {
    
    let matches = aliasMatchingRegex.matches(in: input, options: .withoutAnchoringBounds, range: NSRange(location: 0, length: input.count))
    
    if(matches.count == 0) {
      return []
    }
    
    let nsInput = input as NSString
    
    var uniqueMatches: [String:String?] = [:]
    
    matches.forEach {
      let fullAlias = nsInput.substring(with: $0.rangeAt(0))
      
      if uniqueMatches.index(forKey: fullAlias) == nil {
        
        uniqueMatches[fullAlias] = getUnicodeFromAlias(fullAlias)
      }
      
    }
    
    return uniqueMatches.sorted(by: { $0.0.key.count > $0.1.key.count }) // Execute the longer first so emojis with skin variations are executed before the ones without
  }
  
  open static func getEmojisForCategory(_ category: EmojiCategory) -> [String] {
    let emojis = emojiManager.getEmojisForCategory(category) ?? []
    
    return emojis.map { $0.emoji }
    
  }
}
