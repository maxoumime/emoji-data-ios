// https://github.com/Quick/Quick

import Quick
import Nimble
import emojidataios

class TableOfContentsSpec: QuickSpec {
  
  override func spec() {
      
    describe("Check a bunch of Emojis") {
      let frontEmojisFilePath = Bundle.main.path(forResource: "emojis-modifiers", ofType: "txt")
      let frontEmojisContentData = FileManager.default.contents(atPath: frontEmojisFilePath!)
      let frontEmojis = String(data: frontEmojisContentData!, encoding: .utf8)!
      
      var dictionaryTotalTime = 0.0
      var treeTotalTime = 0.0
      var entries = 0.0
      
      frontEmojis
        .components(separatedBy: " ")
        .filter { $0.characters.count > 2 && $0.characters.first == ":" && $0.characters.last == ":" }
        .forEach { alias in
          
          entries = entries + 1.0
          
          var cleanedAlias = alias
          
          if let firstChar = cleanedAlias.characters.first, String(firstChar) == ":" {
            cleanedAlias.characters.removeFirst()
          }
          
          if let lastChar = cleanedAlias.characters.last, String(lastChar) == ":" {
            cleanedAlias.characters.removeLast()
          }
          
          let aliasDecomposition = alias.characters.split(separator: ":", omittingEmptySubsequences: true).map { String($0) }

          let dictionaryStartTime = Date()
          let emoji = EmojiParser.getUnicodeFromAlias(cleanedAlias)
          dictionaryTotalTime = dictionaryTotalTime + ( Date().timeIntervalSince1970 - dictionaryStartTime.timeIntervalSince1970 )
          
          assert( emoji != nil )

          let treeStartTime = Date()
          let emojiFromUnicode = EmojiParser.getAliasesFromUnicode(emoji!)
          treeTotalTime = treeTotalTime + ( Date().timeIntervalSince1970 - treeStartTime.timeIntervalSince1970 )
          assert( emojiFromUnicode.contains(aliasDecomposition[0]) )
          
//          print("\(emojiFromUnicode) -> \(emoji!)")
      }
      
//      print("Dictionary average matching speed: \(dictionaryTotalTime / entries) sec.")
//      print("Tree average matching speed: \(treeTotalTime / entries) sec.")
//      
//      print("Dictionary matching speed for \(entries) items: \(dictionaryTotalTime) sec.")
//      print("Tree matching speed for \(entries) items: \(treeTotalTime) sec.")
    }
    
    describe("Check the Cow emoji") {
      assert( EmojiParser.getUnicodeFromAlias("cow") == "🐮" )
      assert( EmojiParser.getAliasesFromUnicode("🐮").contains("cow") )
      
    }
    
    describe("Check the Familly emoji") {
      
      assert( EmojiParser.getUnicodeFromAlias("family") == "👪" )
      assert( EmojiParser.getUnicodeFromAlias("man-woman-boy") == "👪" )
      
      assert( EmojiParser.getAliasesFromUnicode("👪").contains("family") )
     
      let emoji = EmojiParser.getEmojiFromUnified("1F468-200D-1F469-200D-1F466")
      assert( emoji == "👨‍👩‍👦" ) // Different kind of family emoji than above -> More bytes /!\
      assert (EmojiParser.getAliasesFromUnicode(emoji).contains("family"))
      
    }
    
    describe("Unicode to aliases") {
    
      let family = "I love 🐮🐮🐮, they are like my 👪"
      
      let familyAliases = EmojiParser.parseUnicode(family)
      
      assert(familyAliases == "I love :cow::cow::cow:, they are like my :family:")
    }
    
    describe("Aliases to Unicode to Aliases to Unicode + Skin tones") {
      let thumbsAliasesPlusOneColonsSkinTone = ":+1::+1::skin-tone-2::+1::skin-tone-3::+1::skin-tone-4::+1::skin-tone-5::+1::skin-tone-6:"
      let thumbsAliasesMixed = ":thumbsup::thumbsup::type_1_2::thumbsup|type_3::thumbsup::type_4::thumbsup|type_5::thumbsup::type_6:"
      let thumbsUnicode = "👍👍🏻👍🏼👍🏽👍🏾👍🏿"
      
      let thumbsAsUnicode = EmojiParser.parseAliases(thumbsAliasesMixed)
      assert(thumbsAsUnicode == thumbsUnicode)

      let thumbsAsAliases = EmojiParser.parseUnicode(thumbsUnicode)
      assert(thumbsAsAliases == thumbsAliasesPlusOneColonsSkinTone)

      let thubsAsUnicodeAgain = EmojiParser.parseAliases(thumbsAsAliases)
      assert(thubsAsUnicodeAgain == thumbsUnicode)
    }
    
    describe("Test an unknown emoji") {
      
      assert(EmojiParser.parseUnicode("🤤") == "")
      
      assert(EmojiParser.getAliasesFromUnicode("🤤") == [])
    }
  }
}
