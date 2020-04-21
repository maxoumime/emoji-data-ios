// This script generates the emoji table for README.md
const emojis = require('../emojidataios/Assets/emojilist.json')
    .map(emoji => {
        const aliases = [emoji.name].concat(emoji.short_names).filter(it => it)

        const skinVariations = [emoji.unified]
            .concat(emoji.skin_variations.map(it => it[1]))

        return {
                aliases: aliases,
                variations: skinVariations
            };
    });

let collumn1 = [];
let collumn2 = [];
emojis.map(emoji => {

    const names = emoji.aliases.join(', ')

    const emojisUnicode = emoji.variations.map(variation => {
        const hexes = variation.split('-').map(it => `0x${it}`);
        return String.fromCodePoint(...hexes);
    }).join(' ')

    return `${emojisUnicode} | ${names}`
}).forEach((it, index) => {
    if (index % 2 === 0) {
        collumn1 = collumn1.concat(it)
    } else {
        collumn2 = collumn2.concat(it)
    }
});

let markdown = `
| Emoji | Aliases | Emoji | Aliases |
| :---: | ------- | :---: | ------- |
`;

for(let i = 0; i < collumn1.length; i++) {
    markdown += '| ' + collumn1[i] + ' | ' + (collumn2[i] ? collumn2[i] : '') + ' |' + '\r\n';
}

console.log(markdown)