// https://github.com/Quick/Quick

import Quick
import Nimble
import emojidataios

class TableOfContentsSpec: QuickSpec {
  
  override func spec() {
    
    guard let allEmojisFilePath = Bundle(for: type(of: self)).path(forResource: "emojis-modifiers", ofType: "txt") else {
      print("emojis-modifiers.txt was not found")
      exit(1)
    }
    let allEmojisContentData = FileManager.default.contents(atPath: allEmojisFilePath)
    let allEmojis = String(data: allEmojisContentData!, encoding: .utf8)!
    
    it("Check a bunch of Emojis") {
    
      allEmojis
        .components(separatedBy: " ")
        .filter { $0.count > 2 && $0.first == ":" && $0.last == ":" }
        .forEach { alias in

          let aliasDecomposition = alias.split(separator: ":", omittingEmptySubsequences: true).map { String($0) }
          let emoji = EmojiParser.getUnicodeFromAlias(aliasDecomposition[0])
          
          assert( emoji != nil )

          let emojiFromUnicode = EmojiParser.getAliasesFromUnicode(emoji!)
          assert( emojiFromUnicode.contains(aliasDecomposition[0]) )
      }
    }
    
    it("Check the Cow emoji") {
      assert( EmojiParser.getUnicodeFromAlias("cow") == "🐮" )
      assert( EmojiParser.getAliasesFromUnicode("🐮").contains("cow") )
      
    }

    it("Unicode to aliases") {
    
      let family = "I love 🐮🐮🐮 and 🐺🐺🐺"
      
      let familyAliases = EmojiParser.parseUnicode(family)
      
      assert(familyAliases == "I love :cow::cow::cow: and :wolf::wolf::wolf:")
    }
    
    it("Aliases to Unicode to Aliases to Unicode + Skin tones") {
      let thumbsAliasesPlusOneColonsSkinTone = ":+1::+1::skin-tone-2::+1::skin-tone-3::+1::skin-tone-4::+1::skin-tone-5::+1::skin-tone-6:"
      let thumbsAliasesMixed = ":thumbsup::thumbsup::type_1_2::thumbsup|type_3::thumbsup::type_4::thumbsup|type_5::thumbsup::type_6:"
      let thumbsUnicode = "👍👍🏻👍🏼👍🏽👍🏾👍🏿"
      
      let thumbsAsUnicode = EmojiParser.parseAliases(thumbsAliasesMixed)
      assert(thumbsAsUnicode.count == thumbsUnicode.count)

      let thumbsAsAliases = EmojiParser.parseUnicode(thumbsUnicode)
      assert(thumbsAsAliases == thumbsAliasesPlusOneColonsSkinTone)

      let thumbsAsUnicodeAgain = EmojiParser.parseAliases(thumbsAsAliases)
      assert(thumbsAsUnicodeAgain == thumbsUnicode)
    }
    
    it("Issue with matching leaf with no emojis") {
      
      var input = "1:2"
      
      assert(EmojiParser.parseUnicode(input) == input)
      
      input = "01:23"
      
      assert(EmojiParser.parseUnicode(input) == input)
      
      input = "01987321987:3498234982374497::::2323"
      
      assert(EmojiParser.parseUnicode(input) == input)
    }
    
    it("Testing emoji v9") {
      
      assert(EmojiParser.parseAliases(":man_dancing:") == "🕺")
      assert(EmojiParser.parseAliases(":man_dancing::skin-tone-2:") == "🕺🏻")
      assert(EmojiParser.parseAliases(":drooling_face:") == "🤤")
      assert(EmojiParser.parseAliases(":female-detective:") == "🕵️‍♀️")
      assert(EmojiParser.parseAliases(":female-detective::skin-tone-6:") == "🕵🏿‍♀️")
      
      assert(EmojiParser.parseUnicode("🕺") == ":man_dancing:")
      assert(EmojiParser.parseUnicode( "🕺🏻") == ":man_dancing::skin-tone-2:")
      assert(EmojiParser.parseUnicode("🤤") == ":drooling_face:")
      assert(EmojiParser.parseUnicode("🕵️‍♀️") == ":female-detective:")
      assert(EmojiParser.parseUnicode("🕵🏿‍♀️") == ":female-detective::skin-tone-6:")
      
    }
    
    it("Testing categories") {
      
      let symbolsEmojis = EmojiParser.getEmojisForCategory(.SYMBOLS)
      let objectsEmojis = EmojiParser.getEmojisForCategory(.OBJECTS)
      let natureEmojis = EmojiParser.getEmojisForCategory(.NATURE)
      let peopleEmojis = EmojiParser.getEmojisForCategory(.PEOPLE)
      let foodsEmojis = EmojiParser.getEmojisForCategory(.FOODS)
      let placesEmojis = EmojiParser.getEmojisForCategory(.PLACES)
      let activityEmojis = EmojiParser.getEmojisForCategory(.ACTIVITY)
      let flagsEmojis = EmojiParser.getEmojisForCategory(.FLAGS)
      let smileysEmojis = EmojiParser.getEmojisForCategory(.SMILEYS)

      assert(!symbolsEmojis.isEmpty)
      assert(symbolsEmojis.contains( EmojiParser.parseAliases(":no_entry_sign:") ))
      
      assert(!objectsEmojis.isEmpty)
      assert(objectsEmojis.contains( EmojiParser.parseAliases(":computer:") ))
      
      assert(!natureEmojis.isEmpty)
      assert(natureEmojis.contains( EmojiParser.parseAliases(":cactus:") ))
      
      assert(!peopleEmojis.isEmpty)
      assert(peopleEmojis.contains( EmojiParser.parseAliases(":santa:") ))
      
      assert(!foodsEmojis.isEmpty)
      assert(foodsEmojis.contains( EmojiParser.parseAliases(":lemon:") ))
      
      assert(!placesEmojis.isEmpty)
      assert(placesEmojis.contains( EmojiParser.parseAliases(":mountain:") ))
      
      assert(!activityEmojis.isEmpty)
      assert(activityEmojis.contains( EmojiParser.parseAliases(":baseball:") ))
      
      assert(!flagsEmojis.isEmpty)
      assert(flagsEmojis.contains( EmojiParser.parseAliases(":flag-fr:") ))

      assert(!smileysEmojis.isEmpty)
      assert(smileysEmojis.contains( EmojiParser.parseAliases(":scream:") ))
      
    }
    
    it("Testing regular sentences") {
      assert("\"Hello" == EmojiParser.parseUnicode("\"Hello"))
      assert("You owe me €5" == EmojiParser.parseUnicode("You owe me €5"))
      assert("Lorem Ipsum" == EmojiParser.parseUnicode("Lorem Ipsum"))
    }
  }
}
