// This scripts transforms the emoji list from https://github.com/iamcal/emoji-data/ to the data desired by emoji-data-ios

let emojis = require("./emoji_pretty.json")

let cleanedEmojis = emojis.map ( emoji => {

    var newEmoji = {
        "unified": emoji.unified,
        "variations": emoji.variations,
        "short_names": emoji.short_names,
        "name": emoji.name,
        "category": emoji.category,
        "obsoleted_by": emoji.obsoleted_by,
        "sort_order": emoji.sort_order,
        "skin_variations": []
    }

    if (emoji.skin_variations === undefined) {
        return newEmoji
    }

    newEmoji.skin_variations = Object.keys(emoji.skin_variations)
        .map ( key => [key, emoji.skin_variations[key].unified])

    return newEmoji
})

console.log(JSON.stringify(cleanedEmojis))
