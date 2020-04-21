// This scripts generates the emoji table for README.md
const emojis = require('./emoji_pretty.json')

const allCategories = emojis
    .map(it => it.category)

const categories = Array.from(new Set(allCategories));

console.log(JSON.stringify(categories));