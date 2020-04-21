// This scripts generates the emoji table for README.md
const fs = require('fs');

const emojis = require('../emojidataios/Assets/emojilist.json')

const emojisNoModifiers = emojis
    .flatMap(emoji => emoji.short_names)
    .filter(it => it)
    .map(it => `:${it}:`)
    .join(' ');

const emojisWithModifiers = emojis
    .flatMap(emoji => {
        const names = emoji.short_names.filter(it => it)

        return names.map(it => { return {name: it, emoji: emoji} })
    })
    .flatMap(namedEmoji => {
        const {name, emoji} = namedEmoji
        const skinVariations = emoji.skin_variations.map(it => it[0])

        return skinVariations.map(it => { return {name: name, variation: it} })
    })
    .map(namedVariation => {
        const {name, variation} = namedVariation

        const variations = variation.split('-')
            .map(it => {
                let variationName = "skin-tone-"

                switch(it) {
                    case "1F3FB": variationName += "2"; break
                    case "1F3FC": variationName += "3"; break
                    case "1F3FD": variationName += "4"; break
                    case "1F3FE": variationName += "5"; break
                    case "1F3FF": variationName += "6"; break
                }

                return `:${variationName}:`
            })
            .join('')

        return `:${name}:${variations}`
    })
    .join(' ');


console.log(emojisNoModifiers)
fs.writeFile('../Example/Tests/emojis-no-modifiers.txt', emojisNoModifiers, (err) => {
    if (err) console.error(err);
});

console.log(emojisWithModifiers)
fs.writeFile('../Example/Tests/emojis-modifiers.txt', emojisWithModifiers, (err) => {
    if (err) console.error(err);
});