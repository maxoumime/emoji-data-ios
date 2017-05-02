// https://github.com/Quick/Quick

import Quick
import Nimble
import emojidataios

class TableOfContentsSpec: QuickSpec {
  
  override func spec() {
    
    guard let frontEmojisFilePath = Bundle.main.path(forResource: "emojis-modifiers", ofType: "txt") else {
      print("emojis-modifiers.json was not found")
      exit(1)
    }
    let frontEmojisContentData = FileManager.default.contents(atPath: frontEmojisFilePath)
    let frontEmojis = String(data: frontEmojisContentData!, encoding: .utf8)!
    
    describe("Check a bunch of Emojis") {
      
//      var dictionaryTotalTime = 0.0
//      var treeTotalTime = 0.0
//      var entries = 0.0
      
      frontEmojis
        .components(separatedBy: " ")
        .filter { $0.characters.count > 2 && $0.characters.first == ":" && $0.characters.last == ":" }
        .forEach { alias in
          
//          entries = entries + 1.0

          let aliasDecomposition = alias.characters.split(separator: ":", omittingEmptySubsequences: true).map { String($0) }

//          let dictionaryStartTime = Date()
          let emoji = EmojiParser.getUnicodeFromAlias(aliasDecomposition[0])
//          dictionaryTotalTime = dictionaryTotalTime + ( Date().timeIntervalSince1970 - dictionaryStartTime.timeIntervalSince1970 )
          
          assert( emoji != nil )

//          let treeStartTime = Date()
          let emojiFromUnicode = EmojiParser.getAliasesFromUnicode(emoji!)
//          treeTotalTime = treeTotalTime + ( Date().timeIntervalSince1970 - treeStartTime.timeIntervalSince1970 )
          assert( emojiFromUnicode.contains(aliasDecomposition[0]) )
          
//          print("\(emojiFromUnicode) -> \(emoji!)")
      }
      
//      print("Dictionary average matching speed: \(dictionaryTotalTime / entries) sec.")
//      print("Tree average matching speed: \(treeTotalTime / entries) sec.")
//      
//      print("Dictionary matching speed for \(entries) items: \(dictionaryTotalTime) sec.")
//      print("Tree matching speed for \(entries) items: \(treeTotalTime) sec.")
    }
    
    describe("Parse all the aliases (with modifiers) -> unicode -> aliases -> unicode -> and compare 1st unicode <-> 2nd unicode") {
      
//      var startDate = Date()
      
      let parsedToUnicode = EmojiParser.parseAliases(frontEmojis)
      
//      print("\(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970) sec.")
//      print(parsedToUnicode)
//      startDate = Date()
      
      let parsedToAliases = EmojiParser.parseUnicode(parsedToUnicode)
      
//      print("\(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970) sec.")
//      print(parsedToAliases)
//      startDate = Date()
      
      let reparsedToUnicode = EmojiParser.parseAliases(parsedToAliases)
      
//      print("\(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970) sec.")
//      print(reparsedToUnicode)
      
      assert(reparsedToUnicode == parsedToUnicode)

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
    
    describe("Issue with matching leaf with no emojis") {
      
      var input = "1:2"
      
      assert(EmojiParser.parseUnicode(input) == input)
      
      input = "01:23"
      
      assert(EmojiParser.parseUnicode(input) == input)
      
      input = "01987321987:3498234982374497::::2323"
      
      assert(EmojiParser.parseUnicode(input) == input)
    }
  }
}
