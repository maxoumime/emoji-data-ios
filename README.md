# emoji-data-ios

[![CI Status](http://img.shields.io/travis/maxoumime/emoji-data-ios.svg?style=flat)](https://travis-ci.org/maxoumime/emoji-data-ios)
[![Version](https://img.shields.io/cocoapods/v/emojidataios.svg?style=flat)](http://cocoapods.org/pods/emojidataios)
[![License](https://img.shields.io/cocoapods/l/emojidataios.svg?style=flat)](http://cocoapods.org/pods/emojidataios)
[![Platform](https://img.shields.io/cocoapods/p/emojidataios.svg?style=flat)](http://cocoapods.org/pods/emojidataios)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Xcode 10 and Swift 4.2

## Installation

emojidataios is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "emojidataios"
```

## How to use it?

For now the functions from this library are quite simple. You can mostly only convert from aliases to unicode, and _vice versa_
You can also get Emojis depending on their Category

### EmojiParser

Since it takes some time to load the Emoji list, you might want to consider calling `EmojiParser.prepare()` when starting the app. It will load the Emoji list in a background thread, so it is ready when you need it.

#### Categories

There is 8 different categories, they are available through a enum named `EmojiCategory`

- Symbols
- Objects
- Nature
- People
- Foods
- Places
- Activity
- Flags

To get a list of Emojis depending on a category, use `EmojiParser#getEmojisForCategory(EmojiCategory)`

#### To unicode

To replace all the aliases found in a string by their unicode, use `EmojiParser#parseAliases(String)`.

For example:

```swift
let str = "An :grinning:awesome :smiley:string :heart:with a few :wink:emojis!"
let result = EmojiParser.parseAliases(str)
print(result)
// Prints:
// "An 😀awesome 😃string ❤️with a few 😉emojis!"
```

#### To aliases

To replace all the emoji's unicodes found in a string by their aliases, use `EmojiParser#parseUnicode(String)`.

For example:

```swift
let str = "An 😀awesome 😃string ❤️with a few 😉emojis!"
let result = EmojiParser.parseUnicode(str)
print(result)
// Prints:
// "An :grinning:awesome :smiley:string :heart:with a few :wink:emojis!"
```

By default, the aliases will parse and include any Skin variation that would be provided. Examples:

```swift
let str = "Here is a boy: :boy::skin-tone-6:!"
print(EmojiParser.parseAliases(str))
let str = "Here is a boy: :boy|type_6:!"
print(EmojiParser.parseAliases(str))
// Prints twice:
// "Here is a boy: 👦🏿!"
```

## Credits

**emoji-data** provides the emojis for the library to work [iamcal/emoji-data](https://github.com/iamcal/emoji-data).

## Author

Maxime Bertheau, maxime.bertheau@gmail.com

## License

emojidataios is available under the MIT license. See the LICENSE file for more info.


## Available Emojis

Here is a table of the available emojis and their aliases.


| Emoji | Aliases | Emoji | Aliases |
| :---: | ------- | :---: | ------- |
| #️⃣ | HASH KEY, hash | *️⃣ | keycap_star |
| 0️⃣ | KEYCAP 0, zero | 1️⃣ | KEYCAP 1, one |
| 2️⃣ | KEYCAP 2, two | 3️⃣ | KEYCAP 3, three |
| 4️⃣ | KEYCAP 4, four | 5️⃣ | KEYCAP 5, five |
| 6️⃣ | KEYCAP 6, six | 7️⃣ | KEYCAP 7, seven |
| 8️⃣ | KEYCAP 8, eight | 9️⃣ | KEYCAP 9, nine |
| ©️ | COPYRIGHT SIGN, copyright | ®️ | REGISTERED SIGN, registered |
| 🀄 | MAHJONG TILE RED DRAGON, mahjong | 🃏 | PLAYING CARD BLACK JOKER, black_joker |
| 🅰️ | NEGATIVE SQUARED LATIN CAPITAL LETTER A, a | 🅱️ | NEGATIVE SQUARED LATIN CAPITAL LETTER B, b |
| 🅾️ | NEGATIVE SQUARED LATIN CAPITAL LETTER O, o2 | 🅿️ | NEGATIVE SQUARED LATIN CAPITAL LETTER P, parking |
| 🆎 | NEGATIVE SQUARED AB, ab | 🆑 | SQUARED CL, cl |
| 🆒 | SQUARED COOL, cool | 🆓 | SQUARED FREE, free |
| 🆔 | SQUARED ID, id | 🆕 | SQUARED NEW, new |
| 🆖 | SQUARED NG, ng | 🆗 | SQUARED OK, ok |
| 🆘 | SQUARED SOS, sos | 🆙 | SQUARED UP WITH EXCLAMATION MARK, up |
| 🆚 | SQUARED VS, vs | 🇦🇨 | Ascension Island Flag, flag-ac |
| 🇦🇩 | Andorra Flag, flag-ad | 🇦🇪 | United Arab Emirates Flag, flag-ae |
| 🇦🇫 | Afghanistan Flag, flag-af | 🇦🇬 | Antigua & Barbuda Flag, flag-ag |
| 🇦🇮 | Anguilla Flag, flag-ai | 🇦🇱 | Albania Flag, flag-al |
| 🇦🇲 | Armenia Flag, flag-am | 🇦🇴 | Angola Flag, flag-ao |
| 🇦🇶 | Antarctica Flag, flag-aq | 🇦🇷 | Argentina Flag, flag-ar |
| 🇦🇸 | American Samoa Flag, flag-as | 🇦🇹 | Austria Flag, flag-at |
| 🇦🇺 | Australia Flag, flag-au | 🇦🇼 | Aruba Flag, flag-aw |
| 🇦🇽 | Åland Islands Flag, flag-ax | 🇦🇿 | Azerbaijan Flag, flag-az |
| 🇧🇦 | Bosnia & Herzegovina Flag, flag-ba | 🇧🇧 | Barbados Flag, flag-bb |
| 🇧🇩 | Bangladesh Flag, flag-bd | 🇧🇪 | Belgium Flag, flag-be |
| 🇧🇫 | Burkina Faso Flag, flag-bf | 🇧🇬 | Bulgaria Flag, flag-bg |
| 🇧🇭 | Bahrain Flag, flag-bh | 🇧🇮 | Burundi Flag, flag-bi |
| 🇧🇯 | Benin Flag, flag-bj | 🇧🇱 | St. Barthélemy Flag, flag-bl |
| 🇧🇲 | Bermuda Flag, flag-bm | 🇧🇳 | Brunei Flag, flag-bn |
| 🇧🇴 | Bolivia Flag, flag-bo | 🇧🇶 | Caribbean Netherlands Flag, flag-bq |
| 🇧🇷 | Brazil Flag, flag-br | 🇧🇸 | Bahamas Flag, flag-bs |
| 🇧🇹 | Bhutan Flag, flag-bt | 🇧🇻 | Bouvet Island Flag, flag-bv |
| 🇧🇼 | Botswana Flag, flag-bw | 🇧🇾 | Belarus Flag, flag-by |
| 🇧🇿 | Belize Flag, flag-bz | 🇨🇦 | Canada Flag, flag-ca |
| 🇨🇨 | Cocos (Keeling) Islands Flag, flag-cc | 🇨🇩 | Congo - Kinshasa Flag, flag-cd |
| 🇨🇫 | Central African Republic Flag, flag-cf | 🇨🇬 | Congo - Brazzaville Flag, flag-cg |
| 🇨🇭 | Switzerland Flag, flag-ch | 🇨🇮 | Côte d’Ivoire Flag, flag-ci |
| 🇨🇰 | Cook Islands Flag, flag-ck | 🇨🇱 | Chile Flag, flag-cl |
| 🇨🇲 | Cameroon Flag, flag-cm | 🇨🇳 | China Flag, cn, flag-cn |
| 🇨🇴 | Colombia Flag, flag-co | 🇨🇵 | Clipperton Island Flag, flag-cp |
| 🇨🇷 | Costa Rica Flag, flag-cr | 🇨🇺 | Cuba Flag, flag-cu |
| 🇨🇻 | Cape Verde Flag, flag-cv | 🇨🇼 | Curaçao Flag, flag-cw |
| 🇨🇽 | Christmas Island Flag, flag-cx | 🇨🇾 | Cyprus Flag, flag-cy |
| 🇨🇿 | Czechia Flag, flag-cz | 🇩🇪 | Germany Flag, de, flag-de |
| 🇩🇬 | Diego Garcia Flag, flag-dg | 🇩🇯 | Djibouti Flag, flag-dj |
| 🇩🇰 | Denmark Flag, flag-dk | 🇩🇲 | Dominica Flag, flag-dm |
| 🇩🇴 | Dominican Republic Flag, flag-do | 🇩🇿 | Algeria Flag, flag-dz |
| 🇪🇦 | Ceuta & Melilla Flag, flag-ea | 🇪🇨 | Ecuador Flag, flag-ec |
| 🇪🇪 | Estonia Flag, flag-ee | 🇪🇬 | Egypt Flag, flag-eg |
| 🇪🇭 | Western Sahara Flag, flag-eh | 🇪🇷 | Eritrea Flag, flag-er |
| 🇪🇸 | Spain Flag, es, flag-es | 🇪🇹 | Ethiopia Flag, flag-et |
| 🇪🇺 | European Union Flag, flag-eu | 🇫🇮 | Finland Flag, flag-fi |
| 🇫🇯 | Fiji Flag, flag-fj | 🇫🇰 | Falkland Islands Flag, flag-fk |
| 🇫🇲 | Micronesia Flag, flag-fm | 🇫🇴 | Faroe Islands Flag, flag-fo |
| 🇫🇷 | France Flag, fr, flag-fr | 🇬🇦 | Gabon Flag, flag-ga |
| 🇬🇧 | United Kingdom Flag, gb, uk, flag-gb | 🇬🇩 | Grenada Flag, flag-gd |
| 🇬🇪 | Georgia Flag, flag-ge | 🇬🇫 | French Guiana Flag, flag-gf |
| 🇬🇬 | Guernsey Flag, flag-gg | 🇬🇭 | Ghana Flag, flag-gh |
| 🇬🇮 | Gibraltar Flag, flag-gi | 🇬🇱 | Greenland Flag, flag-gl |
| 🇬🇲 | Gambia Flag, flag-gm | 🇬🇳 | Guinea Flag, flag-gn |
| 🇬🇵 | Guadeloupe Flag, flag-gp | 🇬🇶 | Equatorial Guinea Flag, flag-gq |
| 🇬🇷 | Greece Flag, flag-gr | 🇬🇸 | South Georgia & South Sandwich Islands Flag, flag-gs |
| 🇬🇹 | Guatemala Flag, flag-gt | 🇬🇺 | Guam Flag, flag-gu |
| 🇬🇼 | Guinea-Bissau Flag, flag-gw | 🇬🇾 | Guyana Flag, flag-gy |
| 🇭🇰 | Hong Kong SAR China Flag, flag-hk | 🇭🇲 | Heard & McDonald Islands Flag, flag-hm |
| 🇭🇳 | Honduras Flag, flag-hn | 🇭🇷 | Croatia Flag, flag-hr |
| 🇭🇹 | Haiti Flag, flag-ht | 🇭🇺 | Hungary Flag, flag-hu |
| 🇮🇨 | Canary Islands Flag, flag-ic | 🇮🇩 | Indonesia Flag, flag-id |
| 🇮🇪 | Ireland Flag, flag-ie | 🇮🇱 | Israel Flag, flag-il |
| 🇮🇲 | Isle of Man Flag, flag-im | 🇮🇳 | India Flag, flag-in |
| 🇮🇴 | British Indian Ocean Territory Flag, flag-io | 🇮🇶 | Iraq Flag, flag-iq |
| 🇮🇷 | Iran Flag, flag-ir | 🇮🇸 | Iceland Flag, flag-is |
| 🇮🇹 | Italy Flag, it, flag-it | 🇯🇪 | Jersey Flag, flag-je |
| 🇯🇲 | Jamaica Flag, flag-jm | 🇯🇴 | Jordan Flag, flag-jo |
| 🇯🇵 | Japan Flag, jp, flag-jp | 🇰🇪 | Kenya Flag, flag-ke |
| 🇰🇬 | Kyrgyzstan Flag, flag-kg | 🇰🇭 | Cambodia Flag, flag-kh |
| 🇰🇮 | Kiribati Flag, flag-ki | 🇰🇲 | Comoros Flag, flag-km |
| 🇰🇳 | St. Kitts & Nevis Flag, flag-kn | 🇰🇵 | North Korea Flag, flag-kp |
| 🇰🇷 | South Korea Flag, kr, flag-kr | 🇰🇼 | Kuwait Flag, flag-kw |
| 🇰🇾 | Cayman Islands Flag, flag-ky | 🇰🇿 | Kazakhstan Flag, flag-kz |
| 🇱🇦 | Laos Flag, flag-la | 🇱🇧 | Lebanon Flag, flag-lb |
| 🇱🇨 | St. Lucia Flag, flag-lc | 🇱🇮 | Liechtenstein Flag, flag-li |
| 🇱🇰 | Sri Lanka Flag, flag-lk | 🇱🇷 | Liberia Flag, flag-lr |
| 🇱🇸 | Lesotho Flag, flag-ls | 🇱🇹 | Lithuania Flag, flag-lt |
| 🇱🇺 | Luxembourg Flag, flag-lu | 🇱🇻 | Latvia Flag, flag-lv |
| 🇱🇾 | Libya Flag, flag-ly | 🇲🇦 | Morocco Flag, flag-ma |
| 🇲🇨 | Monaco Flag, flag-mc | 🇲🇩 | Moldova Flag, flag-md |
| 🇲🇪 | Montenegro Flag, flag-me | 🇲🇫 | St. Martin Flag, flag-mf |
| 🇲🇬 | Madagascar Flag, flag-mg | 🇲🇭 | Marshall Islands Flag, flag-mh |
| 🇲🇰 | North Macedonia Flag, flag-mk | 🇲🇱 | Mali Flag, flag-ml |
| 🇲🇲 | Myanmar (Burma) Flag, flag-mm | 🇲🇳 | Mongolia Flag, flag-mn |
| 🇲🇴 | Macao SAR China Flag, flag-mo | 🇲🇵 | Northern Mariana Islands Flag, flag-mp |
| 🇲🇶 | Martinique Flag, flag-mq | 🇲🇷 | Mauritania Flag, flag-mr |
| 🇲🇸 | Montserrat Flag, flag-ms | 🇲🇹 | Malta Flag, flag-mt |
| 🇲🇺 | Mauritius Flag, flag-mu | 🇲🇻 | Maldives Flag, flag-mv |
| 🇲🇼 | Malawi Flag, flag-mw | 🇲🇽 | Mexico Flag, flag-mx |
| 🇲🇾 | Malaysia Flag, flag-my | 🇲🇿 | Mozambique Flag, flag-mz |
| 🇳🇦 | Namibia Flag, flag-na | 🇳🇨 | New Caledonia Flag, flag-nc |
| 🇳🇪 | Niger Flag, flag-ne | 🇳🇫 | Norfolk Island Flag, flag-nf |
| 🇳🇬 | Nigeria Flag, flag-ng | 🇳🇮 | Nicaragua Flag, flag-ni |
| 🇳🇱 | Netherlands Flag, flag-nl | 🇳🇴 | Norway Flag, flag-no |
| 🇳🇵 | Nepal Flag, flag-np | 🇳🇷 | Nauru Flag, flag-nr |
| 🇳🇺 | Niue Flag, flag-nu | 🇳🇿 | New Zealand Flag, flag-nz |
| 🇴🇲 | Oman Flag, flag-om | 🇵🇦 | Panama Flag, flag-pa |
| 🇵🇪 | Peru Flag, flag-pe | 🇵🇫 | French Polynesia Flag, flag-pf |
| 🇵🇬 | Papua New Guinea Flag, flag-pg | 🇵🇭 | Philippines Flag, flag-ph |
| 🇵🇰 | Pakistan Flag, flag-pk | 🇵🇱 | Poland Flag, flag-pl |
| 🇵🇲 | St. Pierre & Miquelon Flag, flag-pm | 🇵🇳 | Pitcairn Islands Flag, flag-pn |
| 🇵🇷 | Puerto Rico Flag, flag-pr | 🇵🇸 | Palestinian Territories Flag, flag-ps |
| 🇵🇹 | Portugal Flag, flag-pt | 🇵🇼 | Palau Flag, flag-pw |
| 🇵🇾 | Paraguay Flag, flag-py | 🇶🇦 | Qatar Flag, flag-qa |
| 🇷🇪 | Réunion Flag, flag-re | 🇷🇴 | Romania Flag, flag-ro |
| 🇷🇸 | Serbia Flag, flag-rs | 🇷🇺 | Russia Flag, ru, flag-ru |
| 🇷🇼 | Rwanda Flag, flag-rw | 🇸🇦 | Saudi Arabia Flag, flag-sa |
| 🇸🇧 | Solomon Islands Flag, flag-sb | 🇸🇨 | Seychelles Flag, flag-sc |
| 🇸🇩 | Sudan Flag, flag-sd | 🇸🇪 | Sweden Flag, flag-se |
| 🇸🇬 | Singapore Flag, flag-sg | 🇸🇭 | St. Helena Flag, flag-sh |
| 🇸🇮 | Slovenia Flag, flag-si | 🇸🇯 | Svalbard & Jan Mayen Flag, flag-sj |
| 🇸🇰 | Slovakia Flag, flag-sk | 🇸🇱 | Sierra Leone Flag, flag-sl |
| 🇸🇲 | San Marino Flag, flag-sm | 🇸🇳 | Senegal Flag, flag-sn |
| 🇸🇴 | Somalia Flag, flag-so | 🇸🇷 | Suriname Flag, flag-sr |
| 🇸🇸 | South Sudan Flag, flag-ss | 🇸🇹 | São Tomé & Príncipe Flag, flag-st |
| 🇸🇻 | El Salvador Flag, flag-sv | 🇸🇽 | Sint Maarten Flag, flag-sx |
| 🇸🇾 | Syria Flag, flag-sy | 🇸🇿 | Eswatini Flag, flag-sz |
| 🇹🇦 | Tristan da Cunha Flag, flag-ta | 🇹🇨 | Turks & Caicos Islands Flag, flag-tc |
| 🇹🇩 | Chad Flag, flag-td | 🇹🇫 | French Southern Territories Flag, flag-tf |
| 🇹🇬 | Togo Flag, flag-tg | 🇹🇭 | Thailand Flag, flag-th |
| 🇹🇯 | Tajikistan Flag, flag-tj | 🇹🇰 | Tokelau Flag, flag-tk |
| 🇹🇱 | Timor-Leste Flag, flag-tl | 🇹🇲 | Turkmenistan Flag, flag-tm |
| 🇹🇳 | Tunisia Flag, flag-tn | 🇹🇴 | Tonga Flag, flag-to |
| 🇹🇷 | Turkey Flag, flag-tr | 🇹🇹 | Trinidad & Tobago Flag, flag-tt |
| 🇹🇻 | Tuvalu Flag, flag-tv | 🇹🇼 | Taiwan Flag, flag-tw |
| 🇹🇿 | Tanzania Flag, flag-tz | 🇺🇦 | Ukraine Flag, flag-ua |
| 🇺🇬 | Uganda Flag, flag-ug | 🇺🇲 | U.S. Outlying Islands Flag, flag-um |
| 🇺🇳 | United Nations Flag, flag-un | 🇺🇸 | United States Flag, us, flag-us |
| 🇺🇾 | Uruguay Flag, flag-uy | 🇺🇿 | Uzbekistan Flag, flag-uz |
| 🇻🇦 | Vatican City Flag, flag-va | 🇻🇨 | St. Vincent & Grenadines Flag, flag-vc |
| 🇻🇪 | Venezuela Flag, flag-ve | 🇻🇬 | British Virgin Islands Flag, flag-vg |
| 🇻🇮 | U.S. Virgin Islands Flag, flag-vi | 🇻🇳 | Vietnam Flag, flag-vn |
| 🇻🇺 | Vanuatu Flag, flag-vu | 🇼🇫 | Wallis & Futuna Flag, flag-wf |
| 🇼🇸 | Samoa Flag, flag-ws | 🇽🇰 | Kosovo Flag, flag-xk |
| 🇾🇪 | Yemen Flag, flag-ye | 🇾🇹 | Mayotte Flag, flag-yt |
| 🇿🇦 | South Africa Flag, flag-za | 🇿🇲 | Zambia Flag, flag-zm |
| 🇿🇼 | Zimbabwe Flag, flag-zw | 🈁 | SQUARED KATAKANA KOKO, koko |
| 🈂️ | SQUARED KATAKANA SA, sa | 🈚 | SQUARED CJK UNIFIED IDEOGRAPH-7121, u7121 |
| 🈯 | SQUARED CJK UNIFIED IDEOGRAPH-6307, u6307 | 🈲 | SQUARED CJK UNIFIED IDEOGRAPH-7981, u7981 |
| 🈳 | SQUARED CJK UNIFIED IDEOGRAPH-7A7A, u7a7a | 🈴 | SQUARED CJK UNIFIED IDEOGRAPH-5408, u5408 |
| 🈵 | SQUARED CJK UNIFIED IDEOGRAPH-6E80, u6e80 | 🈶 | SQUARED CJK UNIFIED IDEOGRAPH-6709, u6709 |
| 🈷️ | SQUARED CJK UNIFIED IDEOGRAPH-6708, u6708 | 🈸 | SQUARED CJK UNIFIED IDEOGRAPH-7533, u7533 |
| 🈹 | SQUARED CJK UNIFIED IDEOGRAPH-5272, u5272 | 🈺 | SQUARED CJK UNIFIED IDEOGRAPH-55B6, u55b6 |
| 🉐 | CIRCLED IDEOGRAPH ADVANTAGE, ideograph_advantage | 🉑 | CIRCLED IDEOGRAPH ACCEPT, accept |
| 🌀 | CYCLONE, cyclone | 🌁 | FOGGY, foggy |
| 🌂 | CLOSED UMBRELLA, closed_umbrella | 🌃 | NIGHT WITH STARS, night_with_stars |
| 🌄 | SUNRISE OVER MOUNTAINS, sunrise_over_mountains | 🌅 | SUNRISE, sunrise |
| 🌆 | CITYSCAPE AT DUSK, city_sunset | 🌇 | SUNSET OVER BUILDINGS, city_sunrise |
| 🌈 | RAINBOW, rainbow | 🌉 | BRIDGE AT NIGHT, bridge_at_night |
| 🌊 | WATER WAVE, ocean | 🌋 | VOLCANO, volcano |
| 🌌 | MILKY WAY, milky_way | 🌍 | EARTH GLOBE EUROPE-AFRICA, earth_africa |
| 🌎 | EARTH GLOBE AMERICAS, earth_americas | 🌏 | EARTH GLOBE ASIA-AUSTRALIA, earth_asia |
| 🌐 | GLOBE WITH MERIDIANS, globe_with_meridians | 🌑 | NEW MOON SYMBOL, new_moon |
| 🌒 | WAXING CRESCENT MOON SYMBOL, waxing_crescent_moon | 🌓 | FIRST QUARTER MOON SYMBOL, first_quarter_moon |
| 🌔 | WAXING GIBBOUS MOON SYMBOL, moon, waxing_gibbous_moon | 🌕 | FULL MOON SYMBOL, full_moon |
| 🌖 | WANING GIBBOUS MOON SYMBOL, waning_gibbous_moon | 🌗 | LAST QUARTER MOON SYMBOL, last_quarter_moon |
| 🌘 | WANING CRESCENT MOON SYMBOL, waning_crescent_moon | 🌙 | CRESCENT MOON, crescent_moon |
| 🌚 | NEW MOON WITH FACE, new_moon_with_face | 🌛 | FIRST QUARTER MOON WITH FACE, first_quarter_moon_with_face |
| 🌜 | LAST QUARTER MOON WITH FACE, last_quarter_moon_with_face | 🌝 | FULL MOON WITH FACE, full_moon_with_face |
| 🌞 | SUN WITH FACE, sun_with_face | 🌟 | GLOWING STAR, star2 |
| 🌠 | SHOOTING STAR, stars | 🌡️ | thermometer |
| 🌤️ | mostly_sunny, sun_small_cloud | 🌥️ | barely_sunny, sun_behind_cloud |
| 🌦️ | partly_sunny_rain, sun_behind_rain_cloud | 🌧️ | rain_cloud |
| 🌨️ | snow_cloud | 🌩️ | lightning, lightning_cloud |
| 🌪️ | tornado, tornado_cloud | 🌫️ | fog |
| 🌬️ | wind_blowing_face | 🌭 | HOT DOG, hotdog |
| 🌮 | TACO, taco | 🌯 | BURRITO, burrito |
| 🌰 | CHESTNUT, chestnut | 🌱 | SEEDLING, seedling |
| 🌲 | EVERGREEN TREE, evergreen_tree | 🌳 | DECIDUOUS TREE, deciduous_tree |
| 🌴 | PALM TREE, palm_tree | 🌵 | CACTUS, cactus |
| 🌶️ | hot_pepper | 🌷 | TULIP, tulip |
| 🌸 | CHERRY BLOSSOM, cherry_blossom | 🌹 | ROSE, rose |
| 🌺 | HIBISCUS, hibiscus | 🌻 | SUNFLOWER, sunflower |
| 🌼 | BLOSSOM, blossom | 🌽 | EAR OF MAIZE, corn |
| 🌾 | EAR OF RICE, ear_of_rice | 🌿 | HERB, herb |
| 🍀 | FOUR LEAF CLOVER, four_leaf_clover | 🍁 | MAPLE LEAF, maple_leaf |
| 🍂 | FALLEN LEAF, fallen_leaf | 🍃 | LEAF FLUTTERING IN WIND, leaves |
| 🍄 | MUSHROOM, mushroom | 🍅 | TOMATO, tomato |
| 🍆 | AUBERGINE, eggplant | 🍇 | GRAPES, grapes |
| 🍈 | MELON, melon | 🍉 | WATERMELON, watermelon |
| 🍊 | TANGERINE, tangerine | 🍋 | LEMON, lemon |
| 🍌 | BANANA, banana | 🍍 | PINEAPPLE, pineapple |
| 🍎 | RED APPLE, apple | 🍏 | GREEN APPLE, green_apple |
| 🍐 | PEAR, pear | 🍑 | PEACH, peach |
| 🍒 | CHERRIES, cherries | 🍓 | STRAWBERRY, strawberry |
| 🍔 | HAMBURGER, hamburger | 🍕 | SLICE OF PIZZA, pizza |
| 🍖 | MEAT ON BONE, meat_on_bone | 🍗 | POULTRY LEG, poultry_leg |
| 🍘 | RICE CRACKER, rice_cracker | 🍙 | RICE BALL, rice_ball |
| 🍚 | COOKED RICE, rice | 🍛 | CURRY AND RICE, curry |
| 🍜 | STEAMING BOWL, ramen | 🍝 | SPAGHETTI, spaghetti |
| 🍞 | BREAD, bread | 🍟 | FRENCH FRIES, fries |
| 🍠 | ROASTED SWEET POTATO, sweet_potato | 🍡 | DANGO, dango |
| 🍢 | ODEN, oden | 🍣 | SUSHI, sushi |
| 🍤 | FRIED SHRIMP, fried_shrimp | 🍥 | FISH CAKE WITH SWIRL DESIGN, fish_cake |
| 🍦 | SOFT ICE CREAM, icecream | 🍧 | SHAVED ICE, shaved_ice |
| 🍨 | ICE CREAM, ice_cream | 🍩 | DOUGHNUT, doughnut |
| 🍪 | COOKIE, cookie | 🍫 | CHOCOLATE BAR, chocolate_bar |
| 🍬 | CANDY, candy | 🍭 | LOLLIPOP, lollipop |
| 🍮 | CUSTARD, custard | 🍯 | HONEY POT, honey_pot |
| 🍰 | SHORTCAKE, cake | 🍱 | BENTO BOX, bento |
| 🍲 | POT OF FOOD, stew | 🍳 | COOKING, fried_egg, cooking |
| 🍴 | FORK AND KNIFE, fork_and_knife | 🍵 | TEACUP WITHOUT HANDLE, tea |
| 🍶 | SAKE BOTTLE AND CUP, sake | 🍷 | WINE GLASS, wine_glass |
| 🍸 | COCKTAIL GLASS, cocktail | 🍹 | TROPICAL DRINK, tropical_drink |
| 🍺 | BEER MUG, beer | 🍻 | CLINKING BEER MUGS, beers |
| 🍼 | BABY BOTTLE, baby_bottle | 🍽️ | knife_fork_plate |
| 🍾 | BOTTLE WITH POPPING CORK, champagne | 🍿 | POPCORN, popcorn |
| 🎀 | RIBBON, ribbon | 🎁 | WRAPPED PRESENT, gift |
| 🎂 | BIRTHDAY CAKE, birthday | 🎃 | JACK-O-LANTERN, jack_o_lantern |
| 🎄 | CHRISTMAS TREE, christmas_tree | 🎅 🎅🏻 🎅🏼 🎅🏽 🎅🏾 🎅🏿 | FATHER CHRISTMAS, santa |
| 🎆 | FIREWORKS, fireworks | 🎇 | FIREWORK SPARKLER, sparkler |
| 🎈 | BALLOON, balloon | 🎉 | PARTY POPPER, tada |
| 🎊 | CONFETTI BALL, confetti_ball | 🎋 | TANABATA TREE, tanabata_tree |
| 🎌 | CROSSED FLAGS, crossed_flags | 🎍 | PINE DECORATION, bamboo |
| 🎎 | JAPANESE DOLLS, dolls | 🎏 | CARP STREAMER, flags |
| 🎐 | WIND CHIME, wind_chime | 🎑 | MOON VIEWING CEREMONY, rice_scene |
| 🎒 | SCHOOL SATCHEL, school_satchel | 🎓 | GRADUATION CAP, mortar_board |
| 🎖️ | medal | 🎗️ | reminder_ribbon |
| 🎙️ | studio_microphone | 🎚️ | level_slider |
| 🎛️ | control_knobs | 🎞️ | film_frames |
| 🎟️ | admission_tickets | 🎠 | CAROUSEL HORSE, carousel_horse |
| 🎡 | FERRIS WHEEL, ferris_wheel | 🎢 | ROLLER COASTER, roller_coaster |
| 🎣 | FISHING POLE AND FISH, fishing_pole_and_fish | 🎤 | MICROPHONE, microphone |
| 🎥 | MOVIE CAMERA, movie_camera | 🎦 | CINEMA, cinema |
| 🎧 | HEADPHONE, headphones | 🎨 | ARTIST PALETTE, art |
| 🎩 | TOP HAT, tophat | 🎪 | CIRCUS TENT, circus_tent |
| 🎫 | TICKET, ticket | 🎬 | CLAPPER BOARD, clapper |
| 🎭 | PERFORMING ARTS, performing_arts | 🎮 | VIDEO GAME, video_game |
| 🎯 | DIRECT HIT, dart | 🎰 | SLOT MACHINE, slot_machine |
| 🎱 | BILLIARDS, 8ball | 🎲 | GAME DIE, game_die |
| 🎳 | BOWLING, bowling | 🎴 | FLOWER PLAYING CARDS, flower_playing_cards |
| 🎵 | MUSICAL NOTE, musical_note | 🎶 | MULTIPLE MUSICAL NOTES, notes |
| 🎷 | SAXOPHONE, saxophone | 🎸 | GUITAR, guitar |
| 🎹 | MUSICAL KEYBOARD, musical_keyboard | 🎺 | TRUMPET, trumpet |
| 🎻 | VIOLIN, violin | 🎼 | MUSICAL SCORE, musical_score |
| 🎽 | RUNNING SHIRT WITH SASH, running_shirt_with_sash | 🎾 | TENNIS RACQUET AND BALL, tennis |
| 🎿 | SKI AND SKI BOOT, ski | 🏀 | BASKETBALL AND HOOP, basketball |
| 🏁 | CHEQUERED FLAG, checkered_flag | 🏂 🏂🏻 🏂🏼 🏂🏽 🏂🏾 🏂🏿 | SNOWBOARDER, snowboarder |
| 🏃‍♀️ 🏃🏻‍♀️ 🏃🏼‍♀️ 🏃🏽‍♀️ 🏃🏾‍♀️ 🏃🏿‍♀️ | woman-running | 🏃‍♂️ 🏃🏻‍♂️ 🏃🏼‍♂️ 🏃🏽‍♂️ 🏃🏾‍♂️ 🏃🏿‍♂️ | man-running |
| 🏃 🏃🏻 🏃🏼 🏃🏽 🏃🏾 🏃🏿 | RUNNER, runner, running | 🏄‍♀️ 🏄🏻‍♀️ 🏄🏼‍♀️ 🏄🏽‍♀️ 🏄🏾‍♀️ 🏄🏿‍♀️ | woman-surfing |
| 🏄‍♂️ 🏄🏻‍♂️ 🏄🏼‍♂️ 🏄🏽‍♂️ 🏄🏾‍♂️ 🏄🏿‍♂️ | man-surfing | 🏄 🏄🏻 🏄🏼 🏄🏽 🏄🏾 🏄🏿 | SURFER, surfer |
| 🏅 | SPORTS MEDAL, sports_medal | 🏆 | TROPHY, trophy |
| 🏇 🏇🏻 🏇🏼 🏇🏽 🏇🏾 🏇🏿 | HORSE RACING, horse_racing | 🏈 | AMERICAN FOOTBALL, football |
| 🏉 | RUGBY FOOTBALL, rugby_football | 🏊‍♀️ 🏊🏻‍♀️ 🏊🏼‍♀️ 🏊🏽‍♀️ 🏊🏾‍♀️ 🏊🏿‍♀️ | woman-swimming |
| 🏊‍♂️ 🏊🏻‍♂️ 🏊🏼‍♂️ 🏊🏽‍♂️ 🏊🏾‍♂️ 🏊🏿‍♂️ | man-swimming | 🏊 🏊🏻 🏊🏼 🏊🏽 🏊🏾 🏊🏿 | SWIMMER, swimmer |
| 🏋️‍♀️ 🏋🏻‍♀️ 🏋🏼‍♀️ 🏋🏽‍♀️ 🏋🏾‍♀️ 🏋🏿‍♀️ | woman-lifting-weights | 🏋️‍♂️ 🏋🏻‍♂️ 🏋🏼‍♂️ 🏋🏽‍♂️ 🏋🏾‍♂️ 🏋🏿‍♂️ | man-lifting-weights |
| 🏋️ 🏋🏻 🏋🏼 🏋🏽 🏋🏾 🏋🏿 | weight_lifter | 🏌️‍♀️ 🏌🏻‍♀️ 🏌🏼‍♀️ 🏌🏽‍♀️ 🏌🏾‍♀️ 🏌🏿‍♀️ | woman-golfing |
| 🏌️‍♂️ 🏌🏻‍♂️ 🏌🏼‍♂️ 🏌🏽‍♂️ 🏌🏾‍♂️ 🏌🏿‍♂️ | man-golfing | 🏌️ 🏌🏻 🏌🏼 🏌🏽 🏌🏾 🏌🏿 | golfer |
| 🏍️ | racing_motorcycle | 🏎️ | racing_car |
| 🏏 | CRICKET BAT AND BALL, cricket_bat_and_ball | 🏐 | VOLLEYBALL, volleyball |
| 🏑 | FIELD HOCKEY STICK AND BALL, field_hockey_stick_and_ball | 🏒 | ICE HOCKEY STICK AND PUCK, ice_hockey_stick_and_puck |
| 🏓 | TABLE TENNIS PADDLE AND BALL, table_tennis_paddle_and_ball | 🏔️ | snow_capped_mountain |
| 🏕️ | camping | 🏖️ | beach_with_umbrella |
| 🏗️ | building_construction | 🏘️ | house_buildings |
| 🏙️ | cityscape | 🏚️ | derelict_house_building |
| 🏛️ | classical_building | 🏜️ | desert |
| 🏝️ | desert_island | 🏞️ | national_park |
| 🏟️ | stadium | 🏠 | HOUSE BUILDING, house |
| 🏡 | HOUSE WITH GARDEN, house_with_garden | 🏢 | OFFICE BUILDING, office |
| 🏣 | JAPANESE POST OFFICE, post_office | 🏤 | EUROPEAN POST OFFICE, european_post_office |
| 🏥 | HOSPITAL, hospital | 🏦 | BANK, bank |
| 🏧 | AUTOMATED TELLER MACHINE, atm | 🏨 | HOTEL, hotel |
| 🏩 | LOVE HOTEL, love_hotel | 🏪 | CONVENIENCE STORE, convenience_store |
| 🏫 | SCHOOL, school | 🏬 | DEPARTMENT STORE, department_store |
| 🏭 | FACTORY, factory | 🏮 | IZAKAYA LANTERN, izakaya_lantern, lantern |
| 🏯 | JAPANESE CASTLE, japanese_castle | 🏰 | EUROPEAN CASTLE, european_castle |
| 🏳️‍🌈 | rainbow-flag | 🏳️ | waving_white_flag |
| 🏴‍☠️ | pirate_flag | 🏴󠁧󠁢󠁥󠁮󠁧󠁿 | England Flag, flag-england |
| 🏴󠁧󠁢󠁳󠁣󠁴󠁿 | Scotland Flag, flag-scotland | 🏴󠁧󠁢󠁷󠁬󠁳󠁿 | Wales Flag, flag-wales |
| 🏴 | WAVING BLACK FLAG, waving_black_flag | 🏵️ | rosette |
| 🏷️ | label | 🏸 | BADMINTON RACQUET AND SHUTTLECOCK, badminton_racquet_and_shuttlecock |
| 🏹 | BOW AND ARROW, bow_and_arrow | 🏺 | AMPHORA, amphora |
| 🏻 | EMOJI MODIFIER FITZPATRICK TYPE-1-2, skin-tone-2 | 🏼 | EMOJI MODIFIER FITZPATRICK TYPE-3, skin-tone-3 |
| 🏽 | EMOJI MODIFIER FITZPATRICK TYPE-4, skin-tone-4 | 🏾 | EMOJI MODIFIER FITZPATRICK TYPE-5, skin-tone-5 |
| 🏿 | EMOJI MODIFIER FITZPATRICK TYPE-6, skin-tone-6 | 🐀 | RAT, rat |
| 🐁 | MOUSE, mouse2 | 🐂 | OX, ox |
| 🐃 | WATER BUFFALO, water_buffalo | 🐄 | COW, cow2 |
| 🐅 | TIGER, tiger2 | 🐆 | LEOPARD, leopard |
| 🐇 | RABBIT, rabbit2 | 🐈 | CAT, cat2 |
| 🐉 | DRAGON, dragon | 🐊 | CROCODILE, crocodile |
| 🐋 | WHALE, whale2 | 🐌 | SNAIL, snail |
| 🐍 | SNAKE, snake | 🐎 | HORSE, racehorse |
| 🐏 | RAM, ram | 🐐 | GOAT, goat |
| 🐑 | SHEEP, sheep | 🐒 | MONKEY, monkey |
| 🐓 | ROOSTER, rooster | 🐔 | CHICKEN, chicken |
| 🐕‍🦺 | service_dog | 🐕 | DOG, dog2 |
| 🐖 | PIG, pig2 | 🐗 | BOAR, boar |
| 🐘 | ELEPHANT, elephant | 🐙 | OCTOPUS, octopus |
| 🐚 | SPIRAL SHELL, shell | 🐛 | BUG, bug |
| 🐜 | ANT, ant | 🐝 | HONEYBEE, bee, honeybee |
| 🐞 | LADY BEETLE, beetle | 🐟 | FISH, fish |
| 🐠 | TROPICAL FISH, tropical_fish | 🐡 | BLOWFISH, blowfish |
| 🐢 | TURTLE, turtle | 🐣 | HATCHING CHICK, hatching_chick |
| 🐤 | BABY CHICK, baby_chick | 🐥 | FRONT-FACING BABY CHICK, hatched_chick |
| 🐦 | BIRD, bird | 🐧 | PENGUIN, penguin |
| 🐨 | KOALA, koala | 🐩 | POODLE, poodle |
| 🐪 | DROMEDARY CAMEL, dromedary_camel | 🐫 | BACTRIAN CAMEL, camel |
| 🐬 | DOLPHIN, dolphin, flipper | 🐭 | MOUSE FACE, mouse |
| 🐮 | COW FACE, cow | 🐯 | TIGER FACE, tiger |
| 🐰 | RABBIT FACE, rabbit | 🐱 | CAT FACE, cat |
| 🐲 | DRAGON FACE, dragon_face | 🐳 | SPOUTING WHALE, whale |
| 🐴 | HORSE FACE, horse | 🐵 | MONKEY FACE, monkey_face |
| 🐶 | DOG FACE, dog | 🐷 | PIG FACE, pig |
| 🐸 | FROG FACE, frog | 🐹 | HAMSTER FACE, hamster |
| 🐺 | WOLF FACE, wolf | 🐻 | BEAR FACE, bear |
| 🐼 | PANDA FACE, panda_face | 🐽 | PIG NOSE, pig_nose |
| 🐾 | PAW PRINTS, feet, paw_prints | 🐿️ | chipmunk |
| 👀 | EYES, eyes | 👁️‍🗨️ | eye-in-speech-bubble |
| 👁️ | eye | 👂 👂🏻 👂🏼 👂🏽 👂🏾 👂🏿 | EAR, ear |
| 👃 👃🏻 👃🏼 👃🏽 👃🏾 👃🏿 | NOSE, nose | 👄 | MOUTH, lips |
| 👅 | TONGUE, tongue | 👆 👆🏻 👆🏼 👆🏽 👆🏾 👆🏿 | WHITE UP POINTING BACKHAND INDEX, point_up_2 |
| 👇 👇🏻 👇🏼 👇🏽 👇🏾 👇🏿 | WHITE DOWN POINTING BACKHAND INDEX, point_down | 👈 👈🏻 👈🏼 👈🏽 👈🏾 👈🏿 | WHITE LEFT POINTING BACKHAND INDEX, point_left |
| 👉 👉🏻 👉🏼 👉🏽 👉🏾 👉🏿 | WHITE RIGHT POINTING BACKHAND INDEX, point_right | 👊 👊🏻 👊🏼 👊🏽 👊🏾 👊🏿 | FISTED HAND SIGN, facepunch, punch |
| 👋 👋🏻 👋🏼 👋🏽 👋🏾 👋🏿 | WAVING HAND SIGN, wave | 👌 👌🏻 👌🏼 👌🏽 👌🏾 👌🏿 | OK HAND SIGN, ok_hand |
| 👍 👍🏻 👍🏼 👍🏽 👍🏾 👍🏿 | THUMBS UP SIGN, +1, thumbsup | 👎 👎🏻 👎🏼 👎🏽 👎🏾 👎🏿 | THUMBS DOWN SIGN, -1, thumbsdown |
| 👏 👏🏻 👏🏼 👏🏽 👏🏾 👏🏿 | CLAPPING HANDS SIGN, clap | 👐 👐🏻 👐🏼 👐🏽 👐🏾 👐🏿 | OPEN HANDS SIGN, open_hands |
| 👑 | CROWN, crown | 👒 | WOMANS HAT, womans_hat |
| 👓 | EYEGLASSES, eyeglasses | 👔 | NECKTIE, necktie |
| 👕 | T-SHIRT, shirt, tshirt | 👖 | JEANS, jeans |
| 👗 | DRESS, dress | 👘 | KIMONO, kimono |
| 👙 | BIKINI, bikini | 👚 | WOMANS CLOTHES, womans_clothes |
| 👛 | PURSE, purse | 👜 | HANDBAG, handbag |
| 👝 | POUCH, pouch | 👞 | MANS SHOE, mans_shoe, shoe |
| 👟 | ATHLETIC SHOE, athletic_shoe | 👠 | HIGH-HEELED SHOE, high_heel |
| 👡 | WOMANS SANDAL, sandal | 👢 | WOMANS BOOTS, boot |
| 👣 | FOOTPRINTS, footprints | 👤 | BUST IN SILHOUETTE, bust_in_silhouette |
| 👥 | BUSTS IN SILHOUETTE, busts_in_silhouette | 👦 👦🏻 👦🏼 👦🏽 👦🏾 👦🏿 | BOY, boy |
| 👧 👧🏻 👧🏼 👧🏽 👧🏾 👧🏿 | GIRL, girl | 👨‍🌾 👨🏻‍🌾 👨🏼‍🌾 👨🏽‍🌾 👨🏾‍🌾 👨🏿‍🌾 | male-farmer |
| 👨‍🍳 👨🏻‍🍳 👨🏼‍🍳 👨🏽‍🍳 👨🏾‍🍳 👨🏿‍🍳 | male-cook | 👨‍🎓 👨🏻‍🎓 👨🏼‍🎓 👨🏽‍🎓 👨🏾‍🎓 👨🏿‍🎓 | male-student |
| 👨‍🎤 👨🏻‍🎤 👨🏼‍🎤 👨🏽‍🎤 👨🏾‍🎤 👨🏿‍🎤 | male-singer | 👨‍🎨 👨🏻‍🎨 👨🏼‍🎨 👨🏽‍🎨 👨🏾‍🎨 👨🏿‍🎨 | male-artist |
| 👨‍🏫 👨🏻‍🏫 👨🏼‍🏫 👨🏽‍🏫 👨🏾‍🏫 👨🏿‍🏫 | male-teacher | 👨‍🏭 👨🏻‍🏭 👨🏼‍🏭 👨🏽‍🏭 👨🏾‍🏭 👨🏿‍🏭 | male-factory-worker |
| 👨‍👦‍👦 | man-boy-boy | 👨‍👦 | man-boy |
| 👨‍👧‍👦 | man-girl-boy | 👨‍👧‍👧 | man-girl-girl |
| 👨‍👧 | man-girl | 👨‍👨‍👦 | man-man-boy |
| 👨‍👨‍👦‍👦 | man-man-boy-boy | 👨‍👨‍👧 | man-man-girl |
| 👨‍👨‍👧‍👦 | man-man-girl-boy | 👨‍👨‍👧‍👧 | man-man-girl-girl |
| 👨‍👩‍👦 | man-woman-boy, family | 👨‍👩‍👦‍👦 | man-woman-boy-boy |
| 👨‍👩‍👧 | man-woman-girl | 👨‍👩‍👧‍👦 | man-woman-girl-boy |
| 👨‍👩‍👧‍👧 | man-woman-girl-girl | 👨‍💻 👨🏻‍💻 👨🏼‍💻 👨🏽‍💻 👨🏾‍💻 👨🏿‍💻 | male-technologist |
| 👨‍💼 👨🏻‍💼 👨🏼‍💼 👨🏽‍💼 👨🏾‍💼 👨🏿‍💼 | male-office-worker | 👨‍🔧 👨🏻‍🔧 👨🏼‍🔧 👨🏽‍🔧 👨🏾‍🔧 👨🏿‍🔧 | male-mechanic |
| 👨‍🔬 👨🏻‍🔬 👨🏼‍🔬 👨🏽‍🔬 👨🏾‍🔬 👨🏿‍🔬 | male-scientist | 👨‍🚀 👨🏻‍🚀 👨🏼‍🚀 👨🏽‍🚀 👨🏾‍🚀 👨🏿‍🚀 | male-astronaut |
| 👨‍🚒 👨🏻‍🚒 👨🏼‍🚒 👨🏽‍🚒 👨🏾‍🚒 👨🏿‍🚒 | male-firefighter | 👨‍🦯 👨🏻‍🦯 👨🏼‍🦯 👨🏽‍🦯 👨🏾‍🦯 👨🏿‍🦯 | man_with_probing_cane |
| 👨‍🦰 👨🏻‍🦰 👨🏼‍🦰 👨🏽‍🦰 👨🏾‍🦰 👨🏿‍🦰 | red_haired_man | 👨‍🦱 👨🏻‍🦱 👨🏼‍🦱 👨🏽‍🦱 👨🏾‍🦱 👨🏿‍🦱 | curly_haired_man |
| 👨‍🦲 👨🏻‍🦲 👨🏼‍🦲 👨🏽‍🦲 👨🏾‍🦲 👨🏿‍🦲 | bald_man | 👨‍🦳 👨🏻‍🦳 👨🏼‍🦳 👨🏽‍🦳 👨🏾‍🦳 👨🏿‍🦳 | white_haired_man |
| 👨‍🦼 👨🏻‍🦼 👨🏼‍🦼 👨🏽‍🦼 👨🏾‍🦼 👨🏿‍🦼 | man_in_motorized_wheelchair | 👨‍🦽 👨🏻‍🦽 👨🏼‍🦽 👨🏽‍🦽 👨🏾‍🦽 👨🏿‍🦽 | man_in_manual_wheelchair |
| 👨‍⚕️ 👨🏻‍⚕️ 👨🏼‍⚕️ 👨🏽‍⚕️ 👨🏾‍⚕️ 👨🏿‍⚕️ | male-doctor | 👨‍⚖️ 👨🏻‍⚖️ 👨🏼‍⚖️ 👨🏽‍⚖️ 👨🏾‍⚖️ 👨🏿‍⚖️ | male-judge |
| 👨‍✈️ 👨🏻‍✈️ 👨🏼‍✈️ 👨🏽‍✈️ 👨🏾‍✈️ 👨🏿‍✈️ | male-pilot | 👨‍❤️‍👨 | man-heart-man |
| 👨‍❤️‍💋‍👨 | man-kiss-man | 👨 👨🏻 👨🏼 👨🏽 👨🏾 👨🏿 | MAN, man |
| 👩‍🌾 👩🏻‍🌾 👩🏼‍🌾 👩🏽‍🌾 👩🏾‍🌾 👩🏿‍🌾 | female-farmer | 👩‍🍳 👩🏻‍🍳 👩🏼‍🍳 👩🏽‍🍳 👩🏾‍🍳 👩🏿‍🍳 | female-cook |
| 👩‍🎓 👩🏻‍🎓 👩🏼‍🎓 👩🏽‍🎓 👩🏾‍🎓 👩🏿‍🎓 | female-student | 👩‍🎤 👩🏻‍🎤 👩🏼‍🎤 👩🏽‍🎤 👩🏾‍🎤 👩🏿‍🎤 | female-singer |
| 👩‍🎨 👩🏻‍🎨 👩🏼‍🎨 👩🏽‍🎨 👩🏾‍🎨 👩🏿‍🎨 | female-artist | 👩‍🏫 👩🏻‍🏫 👩🏼‍🏫 👩🏽‍🏫 👩🏾‍🏫 👩🏿‍🏫 | female-teacher |
| 👩‍🏭 👩🏻‍🏭 👩🏼‍🏭 👩🏽‍🏭 👩🏾‍🏭 👩🏿‍🏭 | female-factory-worker | 👩‍👦‍👦 | woman-boy-boy |
| 👩‍👦 | woman-boy | 👩‍👧‍👦 | woman-girl-boy |
| 👩‍👧‍👧 | woman-girl-girl | 👩‍👧 | woman-girl |
| 👩‍👩‍👦 | woman-woman-boy | 👩‍👩‍👦‍👦 | woman-woman-boy-boy |
| 👩‍👩‍👧 | woman-woman-girl | 👩‍👩‍👧‍👦 | woman-woman-girl-boy |
| 👩‍👩‍👧‍👧 | woman-woman-girl-girl | 👩‍💻 👩🏻‍💻 👩🏼‍💻 👩🏽‍💻 👩🏾‍💻 👩🏿‍💻 | female-technologist |
| 👩‍💼 👩🏻‍💼 👩🏼‍💼 👩🏽‍💼 👩🏾‍💼 👩🏿‍💼 | female-office-worker | 👩‍🔧 👩🏻‍🔧 👩🏼‍🔧 👩🏽‍🔧 👩🏾‍🔧 👩🏿‍🔧 | female-mechanic |
| 👩‍🔬 👩🏻‍🔬 👩🏼‍🔬 👩🏽‍🔬 👩🏾‍🔬 👩🏿‍🔬 | female-scientist | 👩‍🚀 👩🏻‍🚀 👩🏼‍🚀 👩🏽‍🚀 👩🏾‍🚀 👩🏿‍🚀 | female-astronaut |
| 👩‍🚒 👩🏻‍🚒 👩🏼‍🚒 👩🏽‍🚒 👩🏾‍🚒 👩🏿‍🚒 | female-firefighter | 👩‍🦯 👩🏻‍🦯 👩🏼‍🦯 👩🏽‍🦯 👩🏾‍🦯 👩🏿‍🦯 | woman_with_probing_cane |
| 👩‍🦰 👩🏻‍🦰 👩🏼‍🦰 👩🏽‍🦰 👩🏾‍🦰 👩🏿‍🦰 | red_haired_woman | 👩‍🦱 👩🏻‍🦱 👩🏼‍🦱 👩🏽‍🦱 👩🏾‍🦱 👩🏿‍🦱 | curly_haired_woman |
| 👩‍🦲 👩🏻‍🦲 👩🏼‍🦲 👩🏽‍🦲 👩🏾‍🦲 👩🏿‍🦲 | bald_woman | 👩‍🦳 👩🏻‍🦳 👩🏼‍🦳 👩🏽‍🦳 👩🏾‍🦳 👩🏿‍🦳 | white_haired_woman |
| 👩‍🦼 👩🏻‍🦼 👩🏼‍🦼 👩🏽‍🦼 👩🏾‍🦼 👩🏿‍🦼 | woman_in_motorized_wheelchair | 👩‍🦽 👩🏻‍🦽 👩🏼‍🦽 👩🏽‍🦽 👩🏾‍🦽 👩🏿‍🦽 | woman_in_manual_wheelchair |
| 👩‍⚕️ 👩🏻‍⚕️ 👩🏼‍⚕️ 👩🏽‍⚕️ 👩🏾‍⚕️ 👩🏿‍⚕️ | female-doctor | 👩‍⚖️ 👩🏻‍⚖️ 👩🏼‍⚖️ 👩🏽‍⚖️ 👩🏾‍⚖️ 👩🏿‍⚖️ | female-judge |
| 👩‍✈️ 👩🏻‍✈️ 👩🏼‍✈️ 👩🏽‍✈️ 👩🏾‍✈️ 👩🏿‍✈️ | female-pilot | 👩‍❤️‍👨 | woman-heart-man |
| 👩‍❤️‍👩 | woman-heart-woman | 👩‍❤️‍💋‍👨 | woman-kiss-man |
| 👩‍❤️‍💋‍👩 | woman-kiss-woman | 👩 👩🏻 👩🏼 👩🏽 👩🏾 👩🏿 | WOMAN, woman |
| 👪 | FAMILY, family, man-woman-boy | 👫 👫🏻 👫🏼 👫🏽 👫🏾 👫🏿 👩🏻‍🤝‍👨🏼 👩🏻‍🤝‍👨🏽 👩🏻‍🤝‍👨🏾 👩🏻‍🤝‍👨🏿 👩🏼‍🤝‍👨🏻 👩🏼‍🤝‍👨🏽 👩🏼‍🤝‍👨🏾 👩🏼‍🤝‍👨🏿 👩🏽‍🤝‍👨🏻 👩🏽‍🤝‍👨🏼 👩🏽‍🤝‍👨🏾 👩🏽‍🤝‍👨🏿 👩🏾‍🤝‍👨🏻 👩🏾‍🤝‍👨🏼 👩🏾‍🤝‍👨🏽 👩🏾‍🤝‍👨🏿 👩🏿‍🤝‍👨🏻 👩🏿‍🤝‍👨🏼 👩🏿‍🤝‍👨🏽 👩🏿‍🤝‍👨🏾 | MAN AND WOMAN HOLDING HANDS, couple, man_and_woman_holding_hands, woman_and_man_holding_hands |
| 👬 👬🏻 👬🏼 👬🏽 👬🏾 👬🏿 👨🏻‍🤝‍👨🏼 👨🏻‍🤝‍👨🏽 👨🏻‍🤝‍👨🏾 👨🏻‍🤝‍👨🏿 👨🏼‍🤝‍👨🏻 👨🏼‍🤝‍👨🏽 👨🏼‍🤝‍👨🏾 👨🏼‍🤝‍👨🏿 👨🏽‍🤝‍👨🏻 👨🏽‍🤝‍👨🏼 👨🏽‍🤝‍👨🏾 👨🏽‍🤝‍👨🏿 👨🏾‍🤝‍👨🏻 👨🏾‍🤝‍👨🏼 👨🏾‍🤝‍👨🏽 👨🏾‍🤝‍👨🏿 👨🏿‍🤝‍👨🏻 👨🏿‍🤝‍👨🏼 👨🏿‍🤝‍👨🏽 👨🏿‍🤝‍👨🏾 | TWO MEN HOLDING HANDS, two_men_holding_hands, men_holding_hands | 👭 👭🏻 👭🏼 👭🏽 👭🏾 👭🏿 👩🏻‍🤝‍👩🏼 👩🏻‍🤝‍👩🏽 👩🏻‍🤝‍👩🏾 👩🏻‍🤝‍👩🏿 👩🏼‍🤝‍👩🏻 👩🏼‍🤝‍👩🏽 👩🏼‍🤝‍👩🏾 👩🏼‍🤝‍👩🏿 👩🏽‍🤝‍👩🏻 👩🏽‍🤝‍👩🏼 👩🏽‍🤝‍👩🏾 👩🏽‍🤝‍👩🏿 👩🏾‍🤝‍👩🏻 👩🏾‍🤝‍👩🏼 👩🏾‍🤝‍👩🏽 👩🏾‍🤝‍👩🏿 👩🏿‍🤝‍👩🏻 👩🏿‍🤝‍👩🏼 👩🏿‍🤝‍👩🏽 👩🏿‍🤝‍👩🏾 | TWO WOMEN HOLDING HANDS, two_women_holding_hands, women_holding_hands |
| 👮‍♀️ 👮🏻‍♀️ 👮🏼‍♀️ 👮🏽‍♀️ 👮🏾‍♀️ 👮🏿‍♀️ | female-police-officer | 👮‍♂️ 👮🏻‍♂️ 👮🏼‍♂️ 👮🏽‍♂️ 👮🏾‍♂️ 👮🏿‍♂️ | male-police-officer |
| 👮 👮🏻 👮🏼 👮🏽 👮🏾 👮🏿 | POLICE OFFICER, cop | 👯‍♀️ | woman-with-bunny-ears-partying |
| 👯‍♂️ | man-with-bunny-ears-partying | 👯 | WOMAN WITH BUNNY EARS, dancers |
| 👰 👰🏻 👰🏼 👰🏽 👰🏾 👰🏿 | BRIDE WITH VEIL, bride_with_veil | 👱‍♀️ 👱🏻‍♀️ 👱🏼‍♀️ 👱🏽‍♀️ 👱🏾‍♀️ 👱🏿‍♀️ | blond-haired-woman |
| 👱‍♂️ 👱🏻‍♂️ 👱🏼‍♂️ 👱🏽‍♂️ 👱🏾‍♂️ 👱🏿‍♂️ | blond-haired-man | 👱 👱🏻 👱🏼 👱🏽 👱🏾 👱🏿 | PERSON WITH BLOND HAIR, person_with_blond_hair |
| 👲 👲🏻 👲🏼 👲🏽 👲🏾 👲🏿 | MAN WITH GUA PI MAO, man_with_gua_pi_mao | 👳‍♀️ 👳🏻‍♀️ 👳🏼‍♀️ 👳🏽‍♀️ 👳🏾‍♀️ 👳🏿‍♀️ | woman-wearing-turban |
| 👳‍♂️ 👳🏻‍♂️ 👳🏼‍♂️ 👳🏽‍♂️ 👳🏾‍♂️ 👳🏿‍♂️ | man-wearing-turban | 👳 👳🏻 👳🏼 👳🏽 👳🏾 👳🏿 | MAN WITH TURBAN, man_with_turban |
| 👴 👴🏻 👴🏼 👴🏽 👴🏾 👴🏿 | OLDER MAN, older_man | 👵 👵🏻 👵🏼 👵🏽 👵🏾 👵🏿 | OLDER WOMAN, older_woman |
| 👶 👶🏻 👶🏼 👶🏽 👶🏾 👶🏿 | BABY, baby | 👷‍♀️ 👷🏻‍♀️ 👷🏼‍♀️ 👷🏽‍♀️ 👷🏾‍♀️ 👷🏿‍♀️ | female-construction-worker |
| 👷‍♂️ 👷🏻‍♂️ 👷🏼‍♂️ 👷🏽‍♂️ 👷🏾‍♂️ 👷🏿‍♂️ | male-construction-worker | 👷 👷🏻 👷🏼 👷🏽 👷🏾 👷🏿 | CONSTRUCTION WORKER, construction_worker |
| 👸 👸🏻 👸🏼 👸🏽 👸🏾 👸🏿 | PRINCESS, princess | 👹 | JAPANESE OGRE, japanese_ogre |
| 👺 | JAPANESE GOBLIN, japanese_goblin | 👻 | GHOST, ghost |
| 👼 👼🏻 👼🏼 👼🏽 👼🏾 👼🏿 | BABY ANGEL, angel | 👽 | EXTRATERRESTRIAL ALIEN, alien |
| 👾 | ALIEN MONSTER, space_invader | 👿 | IMP, imp |
| 💀 | SKULL, skull | 💁‍♀️ 💁🏻‍♀️ 💁🏼‍♀️ 💁🏽‍♀️ 💁🏾‍♀️ 💁🏿‍♀️ | woman-tipping-hand |
| 💁‍♂️ 💁🏻‍♂️ 💁🏼‍♂️ 💁🏽‍♂️ 💁🏾‍♂️ 💁🏿‍♂️ | man-tipping-hand | 💁 💁🏻 💁🏼 💁🏽 💁🏾 💁🏿 | INFORMATION DESK PERSON, information_desk_person |
| 💂‍♀️ 💂🏻‍♀️ 💂🏼‍♀️ 💂🏽‍♀️ 💂🏾‍♀️ 💂🏿‍♀️ | female-guard | 💂‍♂️ 💂🏻‍♂️ 💂🏼‍♂️ 💂🏽‍♂️ 💂🏾‍♂️ 💂🏿‍♂️ | male-guard |
| 💂 💂🏻 💂🏼 💂🏽 💂🏾 💂🏿 | GUARDSMAN, guardsman | 💃 💃🏻 💃🏼 💃🏽 💃🏾 💃🏿 | DANCER, dancer |
| 💄 | LIPSTICK, lipstick | 💅 💅🏻 💅🏼 💅🏽 💅🏾 💅🏿 | NAIL POLISH, nail_care |
| 💆‍♀️ 💆🏻‍♀️ 💆🏼‍♀️ 💆🏽‍♀️ 💆🏾‍♀️ 💆🏿‍♀️ | woman-getting-massage | 💆‍♂️ 💆🏻‍♂️ 💆🏼‍♂️ 💆🏽‍♂️ 💆🏾‍♂️ 💆🏿‍♂️ | man-getting-massage |
| 💆 💆🏻 💆🏼 💆🏽 💆🏾 💆🏿 | FACE MASSAGE, massage | 💇‍♀️ 💇🏻‍♀️ 💇🏼‍♀️ 💇🏽‍♀️ 💇🏾‍♀️ 💇🏿‍♀️ | woman-getting-haircut |
| 💇‍♂️ 💇🏻‍♂️ 💇🏼‍♂️ 💇🏽‍♂️ 💇🏾‍♂️ 💇🏿‍♂️ | man-getting-haircut | 💇 💇🏻 💇🏼 💇🏽 💇🏾 💇🏿 | HAIRCUT, haircut |
| 💈 | BARBER POLE, barber | 💉 | SYRINGE, syringe |
| 💊 | PILL, pill | 💋 | KISS MARK, kiss |
| 💌 | LOVE LETTER, love_letter | 💍 | RING, ring |
| 💎 | GEM STONE, gem | 💏 | KISS, couplekiss |
| 💐 | BOUQUET, bouquet | 💑 | COUPLE WITH HEART, couple_with_heart |
| 💒 | WEDDING, wedding | 💓 | BEATING HEART, heartbeat |
| 💔 | BROKEN HEART, broken_heart | 💕 | TWO HEARTS, two_hearts |
| 💖 | SPARKLING HEART, sparkling_heart | 💗 | GROWING HEART, heartpulse |
| 💘 | HEART WITH ARROW, cupid | 💙 | BLUE HEART, blue_heart |
| 💚 | GREEN HEART, green_heart | 💛 | YELLOW HEART, yellow_heart |
| 💜 | PURPLE HEART, purple_heart | 💝 | HEART WITH RIBBON, gift_heart |
| 💞 | REVOLVING HEARTS, revolving_hearts | 💟 | HEART DECORATION, heart_decoration |
| 💠 | DIAMOND SHAPE WITH A DOT INSIDE, diamond_shape_with_a_dot_inside | 💡 | ELECTRIC LIGHT BULB, bulb |
| 💢 | ANGER SYMBOL, anger | 💣 | BOMB, bomb |
| 💤 | SLEEPING SYMBOL, zzz | 💥 | COLLISION SYMBOL, boom, collision |
| 💦 | SPLASHING SWEAT SYMBOL, sweat_drops | 💧 | DROPLET, droplet |
| 💨 | DASH SYMBOL, dash | 💩 | PILE OF POO, hankey, poop, shit |
| 💪 💪🏻 💪🏼 💪🏽 💪🏾 💪🏿 | FLEXED BICEPS, muscle | 💫 | DIZZY SYMBOL, dizzy |
| 💬 | SPEECH BALLOON, speech_balloon | 💭 | THOUGHT BALLOON, thought_balloon |
| 💮 | WHITE FLOWER, white_flower | 💯 | HUNDRED POINTS SYMBOL, 100 |
| 💰 | MONEY BAG, moneybag | 💱 | CURRENCY EXCHANGE, currency_exchange |
| 💲 | HEAVY DOLLAR SIGN, heavy_dollar_sign | 💳 | CREDIT CARD, credit_card |
| 💴 | BANKNOTE WITH YEN SIGN, yen | 💵 | BANKNOTE WITH DOLLAR SIGN, dollar |
| 💶 | BANKNOTE WITH EURO SIGN, euro | 💷 | BANKNOTE WITH POUND SIGN, pound |
| 💸 | MONEY WITH WINGS, money_with_wings | 💹 | CHART WITH UPWARDS TREND AND YEN SIGN, chart |
| 💺 | SEAT, seat | 💻 | PERSONAL COMPUTER, computer |
| 💼 | BRIEFCASE, briefcase | 💽 | MINIDISC, minidisc |
| 💾 | FLOPPY DISK, floppy_disk | 💿 | OPTICAL DISC, cd |
| 📀 | DVD, dvd | 📁 | FILE FOLDER, file_folder |
| 📂 | OPEN FILE FOLDER, open_file_folder | 📃 | PAGE WITH CURL, page_with_curl |
| 📄 | PAGE FACING UP, page_facing_up | 📅 | CALENDAR, date |
| 📆 | TEAR-OFF CALENDAR, calendar | 📇 | CARD INDEX, card_index |
| 📈 | CHART WITH UPWARDS TREND, chart_with_upwards_trend | 📉 | CHART WITH DOWNWARDS TREND, chart_with_downwards_trend |
| 📊 | BAR CHART, bar_chart | 📋 | CLIPBOARD, clipboard |
| 📌 | PUSHPIN, pushpin | 📍 | ROUND PUSHPIN, round_pushpin |
| 📎 | PAPERCLIP, paperclip | 📏 | STRAIGHT RULER, straight_ruler |
| 📐 | TRIANGULAR RULER, triangular_ruler | 📑 | BOOKMARK TABS, bookmark_tabs |
| 📒 | LEDGER, ledger | 📓 | NOTEBOOK, notebook |
| 📔 | NOTEBOOK WITH DECORATIVE COVER, notebook_with_decorative_cover | 📕 | CLOSED BOOK, closed_book |
| 📖 | OPEN BOOK, book, open_book | 📗 | GREEN BOOK, green_book |
| 📘 | BLUE BOOK, blue_book | 📙 | ORANGE BOOK, orange_book |
| 📚 | BOOKS, books | 📛 | NAME BADGE, name_badge |
| 📜 | SCROLL, scroll | 📝 | MEMO, memo, pencil |
| 📞 | TELEPHONE RECEIVER, telephone_receiver | 📟 | PAGER, pager |
| 📠 | FAX MACHINE, fax | 📡 | SATELLITE ANTENNA, satellite_antenna |
| 📢 | PUBLIC ADDRESS LOUDSPEAKER, loudspeaker | 📣 | CHEERING MEGAPHONE, mega |
| 📤 | OUTBOX TRAY, outbox_tray | 📥 | INBOX TRAY, inbox_tray |
| 📦 | PACKAGE, package | 📧 | E-MAIL SYMBOL, e-mail |
| 📨 | INCOMING ENVELOPE, incoming_envelope | 📩 | ENVELOPE WITH DOWNWARDS ARROW ABOVE, envelope_with_arrow |
| 📪 | CLOSED MAILBOX WITH LOWERED FLAG, mailbox_closed | 📫 | CLOSED MAILBOX WITH RAISED FLAG, mailbox |
| 📬 | OPEN MAILBOX WITH RAISED FLAG, mailbox_with_mail | 📭 | OPEN MAILBOX WITH LOWERED FLAG, mailbox_with_no_mail |
| 📮 | POSTBOX, postbox | 📯 | POSTAL HORN, postal_horn |
| 📰 | NEWSPAPER, newspaper | 📱 | MOBILE PHONE, iphone |
| 📲 | MOBILE PHONE WITH RIGHTWARDS ARROW AT LEFT, calling | 📳 | VIBRATION MODE, vibration_mode |
| 📴 | MOBILE PHONE OFF, mobile_phone_off | 📵 | NO MOBILE PHONES, no_mobile_phones |
| 📶 | ANTENNA WITH BARS, signal_strength | 📷 | CAMERA, camera |
| 📸 | CAMERA WITH FLASH, camera_with_flash | 📹 | VIDEO CAMERA, video_camera |
| 📺 | TELEVISION, tv | 📻 | RADIO, radio |
| 📼 | VIDEOCASSETTE, vhs | 📽️ | film_projector |
| 📿 | PRAYER BEADS, prayer_beads | 🔀 | TWISTED RIGHTWARDS ARROWS, twisted_rightwards_arrows |
| 🔁 | CLOCKWISE RIGHTWARDS AND LEFTWARDS OPEN CIRCLE ARROWS, repeat | 🔂 | CLOCKWISE RIGHTWARDS AND LEFTWARDS OPEN CIRCLE ARROWS WITH CIRCLED ONE OVERLAY, repeat_one |
| 🔃 | CLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS, arrows_clockwise | 🔄 | ANTICLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS, arrows_counterclockwise |
| 🔅 | LOW BRIGHTNESS SYMBOL, low_brightness | 🔆 | HIGH BRIGHTNESS SYMBOL, high_brightness |
| 🔇 | SPEAKER WITH CANCELLATION STROKE, mute | 🔈 | SPEAKER, speaker |
| 🔉 | SPEAKER WITH ONE SOUND WAVE, sound | 🔊 | SPEAKER WITH THREE SOUND WAVES, loud_sound |
| 🔋 | BATTERY, battery | 🔌 | ELECTRIC PLUG, electric_plug |
| 🔍 | LEFT-POINTING MAGNIFYING GLASS, mag | 🔎 | RIGHT-POINTING MAGNIFYING GLASS, mag_right |
| 🔏 | LOCK WITH INK PEN, lock_with_ink_pen | 🔐 | CLOSED LOCK WITH KEY, closed_lock_with_key |
| 🔑 | KEY, key | 🔒 | LOCK, lock |
| 🔓 | OPEN LOCK, unlock | 🔔 | BELL, bell |
| 🔕 | BELL WITH CANCELLATION STROKE, no_bell | 🔖 | BOOKMARK, bookmark |
| 🔗 | LINK SYMBOL, link | 🔘 | RADIO BUTTON, radio_button |
| 🔙 | BACK WITH LEFTWARDS ARROW ABOVE, back | 🔚 | END WITH LEFTWARDS ARROW ABOVE, end |
| 🔛 | ON WITH EXCLAMATION MARK WITH LEFT RIGHT ARROW ABOVE, on | 🔜 | SOON WITH RIGHTWARDS ARROW ABOVE, soon |
| 🔝 | TOP WITH UPWARDS ARROW ABOVE, top | 🔞 | NO ONE UNDER EIGHTEEN SYMBOL, underage |
| 🔟 | KEYCAP TEN, keycap_ten | 🔠 | INPUT SYMBOL FOR LATIN CAPITAL LETTERS, capital_abcd |
| 🔡 | INPUT SYMBOL FOR LATIN SMALL LETTERS, abcd | 🔢 | INPUT SYMBOL FOR NUMBERS, 1234 |
| 🔣 | INPUT SYMBOL FOR SYMBOLS, symbols | 🔤 | INPUT SYMBOL FOR LATIN LETTERS, abc |
| 🔥 | FIRE, fire | 🔦 | ELECTRIC TORCH, flashlight |
| 🔧 | WRENCH, wrench | 🔨 | HAMMER, hammer |
| 🔩 | NUT AND BOLT, nut_and_bolt | 🔪 | HOCHO, hocho, knife |
| 🔫 | PISTOL, gun | 🔬 | MICROSCOPE, microscope |
| 🔭 | TELESCOPE, telescope | 🔮 | CRYSTAL BALL, crystal_ball |
| 🔯 | SIX POINTED STAR WITH MIDDLE DOT, six_pointed_star | 🔰 | JAPANESE SYMBOL FOR BEGINNER, beginner |
| 🔱 | TRIDENT EMBLEM, trident | 🔲 | BLACK SQUARE BUTTON, black_square_button |
| 🔳 | WHITE SQUARE BUTTON, white_square_button | 🔴 | LARGE RED CIRCLE, red_circle |
| 🔵 | LARGE BLUE CIRCLE, large_blue_circle | 🔶 | LARGE ORANGE DIAMOND, large_orange_diamond |
| 🔷 | LARGE BLUE DIAMOND, large_blue_diamond | 🔸 | SMALL ORANGE DIAMOND, small_orange_diamond |
| 🔹 | SMALL BLUE DIAMOND, small_blue_diamond | 🔺 | UP-POINTING RED TRIANGLE, small_red_triangle |
| 🔻 | DOWN-POINTING RED TRIANGLE, small_red_triangle_down | 🔼 | UP-POINTING SMALL RED TRIANGLE, arrow_up_small |
| 🔽 | DOWN-POINTING SMALL RED TRIANGLE, arrow_down_small | 🕉️ | om_symbol |
| 🕊️ | dove_of_peace | 🕋 | KAABA, kaaba |
| 🕌 | MOSQUE, mosque | 🕍 | SYNAGOGUE, synagogue |
| 🕎 | MENORAH WITH NINE BRANCHES, menorah_with_nine_branches | 🕐 | CLOCK FACE ONE OCLOCK, clock1 |
| 🕑 | CLOCK FACE TWO OCLOCK, clock2 | 🕒 | CLOCK FACE THREE OCLOCK, clock3 |
| 🕓 | CLOCK FACE FOUR OCLOCK, clock4 | 🕔 | CLOCK FACE FIVE OCLOCK, clock5 |
| 🕕 | CLOCK FACE SIX OCLOCK, clock6 | 🕖 | CLOCK FACE SEVEN OCLOCK, clock7 |
| 🕗 | CLOCK FACE EIGHT OCLOCK, clock8 | 🕘 | CLOCK FACE NINE OCLOCK, clock9 |
| 🕙 | CLOCK FACE TEN OCLOCK, clock10 | 🕚 | CLOCK FACE ELEVEN OCLOCK, clock11 |
| 🕛 | CLOCK FACE TWELVE OCLOCK, clock12 | 🕜 | CLOCK FACE ONE-THIRTY, clock130 |
| 🕝 | CLOCK FACE TWO-THIRTY, clock230 | 🕞 | CLOCK FACE THREE-THIRTY, clock330 |
| 🕟 | CLOCK FACE FOUR-THIRTY, clock430 | 🕠 | CLOCK FACE FIVE-THIRTY, clock530 |
| 🕡 | CLOCK FACE SIX-THIRTY, clock630 | 🕢 | CLOCK FACE SEVEN-THIRTY, clock730 |
| 🕣 | CLOCK FACE EIGHT-THIRTY, clock830 | 🕤 | CLOCK FACE NINE-THIRTY, clock930 |
| 🕥 | CLOCK FACE TEN-THIRTY, clock1030 | 🕦 | CLOCK FACE ELEVEN-THIRTY, clock1130 |
| 🕧 | CLOCK FACE TWELVE-THIRTY, clock1230 | 🕯️ | candle |
| 🕰️ | mantelpiece_clock | 🕳️ | hole |
| 🕴️ 🕴🏻 🕴🏼 🕴🏽 🕴🏾 🕴🏿 | man_in_business_suit_levitating | 🕵️‍♀️ 🕵🏻‍♀️ 🕵🏼‍♀️ 🕵🏽‍♀️ 🕵🏾‍♀️ 🕵🏿‍♀️ | female-detective |
| 🕵️‍♂️ 🕵🏻‍♂️ 🕵🏼‍♂️ 🕵🏽‍♂️ 🕵🏾‍♂️ 🕵🏿‍♂️ | male-detective | 🕵️ 🕵🏻 🕵🏼 🕵🏽 🕵🏾 🕵🏿 | sleuth_or_spy |
| 🕶️ | dark_sunglasses | 🕷️ | spider |
| 🕸️ | spider_web | 🕹️ | joystick |
| 🕺 🕺🏻 🕺🏼 🕺🏽 🕺🏾 🕺🏿 | MAN DANCING, man_dancing | 🖇️ | linked_paperclips |
| 🖊️ | lower_left_ballpoint_pen | 🖋️ | lower_left_fountain_pen |
| 🖌️ | lower_left_paintbrush | 🖍️ | lower_left_crayon |
| 🖐️ 🖐🏻 🖐🏼 🖐🏽 🖐🏾 🖐🏿 | raised_hand_with_fingers_splayed | 🖕 🖕🏻 🖕🏼 🖕🏽 🖕🏾 🖕🏿 | REVERSED HAND WITH MIDDLE FINGER EXTENDED, middle_finger, reversed_hand_with_middle_finger_extended |
| 🖖 🖖🏻 🖖🏼 🖖🏽 🖖🏾 🖖🏿 | RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS, spock-hand | 🖤 | BLACK HEART, black_heart |
| 🖥️ | desktop_computer | 🖨️ | printer |
| 🖱️ | three_button_mouse | 🖲️ | trackball |
| 🖼️ | frame_with_picture | 🗂️ | card_index_dividers |
| 🗃️ | card_file_box | 🗄️ | file_cabinet |
| 🗑️ | wastebasket | 🗒️ | spiral_note_pad |
| 🗓️ | spiral_calendar_pad | 🗜️ | compression |
| 🗝️ | old_key | 🗞️ | rolled_up_newspaper |
| 🗡️ | dagger_knife | 🗣️ | speaking_head_in_silhouette |
| 🗨️ | left_speech_bubble | 🗯️ | right_anger_bubble |
| 🗳️ | ballot_box_with_ballot | 🗺️ | world_map |
| 🗻 | MOUNT FUJI, mount_fuji | 🗼 | TOKYO TOWER, tokyo_tower |
| 🗽 | STATUE OF LIBERTY, statue_of_liberty | 🗾 | SILHOUETTE OF JAPAN, japan |
| 🗿 | MOYAI, moyai | 😀 | GRINNING FACE, grinning |
| 😁 | GRINNING FACE WITH SMILING EYES, grin | 😂 | FACE WITH TEARS OF JOY, joy |
| 😃 | SMILING FACE WITH OPEN MOUTH, smiley | 😄 | SMILING FACE WITH OPEN MOUTH AND SMILING EYES, smile |
| 😅 | SMILING FACE WITH OPEN MOUTH AND COLD SWEAT, sweat_smile | 😆 | SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES, laughing, satisfied |
| 😇 | SMILING FACE WITH HALO, innocent | 😈 | SMILING FACE WITH HORNS, smiling_imp |
| 😉 | WINKING FACE, wink | 😊 | SMILING FACE WITH SMILING EYES, blush |
| 😋 | FACE SAVOURING DELICIOUS FOOD, yum | 😌 | RELIEVED FACE, relieved |
| 😍 | SMILING FACE WITH HEART-SHAPED EYES, heart_eyes | 😎 | SMILING FACE WITH SUNGLASSES, sunglasses |
| 😏 | SMIRKING FACE, smirk | 😐 | NEUTRAL FACE, neutral_face |
| 😑 | EXPRESSIONLESS FACE, expressionless | 😒 | UNAMUSED FACE, unamused |
| 😓 | FACE WITH COLD SWEAT, sweat | 😔 | PENSIVE FACE, pensive |
| 😕 | CONFUSED FACE, confused | 😖 | CONFOUNDED FACE, confounded |
| 😗 | KISSING FACE, kissing | 😘 | FACE THROWING A KISS, kissing_heart |
| 😙 | KISSING FACE WITH SMILING EYES, kissing_smiling_eyes | 😚 | KISSING FACE WITH CLOSED EYES, kissing_closed_eyes |
| 😛 | FACE WITH STUCK-OUT TONGUE, stuck_out_tongue | 😜 | FACE WITH STUCK-OUT TONGUE AND WINKING EYE, stuck_out_tongue_winking_eye |
| 😝 | FACE WITH STUCK-OUT TONGUE AND TIGHTLY-CLOSED EYES, stuck_out_tongue_closed_eyes | 😞 | DISAPPOINTED FACE, disappointed |
| 😟 | WORRIED FACE, worried | 😠 | ANGRY FACE, angry |
| 😡 | POUTING FACE, rage | 😢 | CRYING FACE, cry |
| 😣 | PERSEVERING FACE, persevere | 😤 | FACE WITH LOOK OF TRIUMPH, triumph |
| 😥 | DISAPPOINTED BUT RELIEVED FACE, disappointed_relieved | 😦 | FROWNING FACE WITH OPEN MOUTH, frowning |
| 😧 | ANGUISHED FACE, anguished | 😨 | FEARFUL FACE, fearful |
| 😩 | WEARY FACE, weary | 😪 | SLEEPY FACE, sleepy |
| 😫 | TIRED FACE, tired_face | 😬 | GRIMACING FACE, grimacing |
| 😭 | LOUDLY CRYING FACE, sob | 😮 | FACE WITH OPEN MOUTH, open_mouth |
| 😯 | HUSHED FACE, hushed | 😰 | FACE WITH OPEN MOUTH AND COLD SWEAT, cold_sweat |
| 😱 | FACE SCREAMING IN FEAR, scream | 😲 | ASTONISHED FACE, astonished |
| 😳 | FLUSHED FACE, flushed | 😴 | SLEEPING FACE, sleeping |
| 😵 | DIZZY FACE, dizzy_face | 😶 | FACE WITHOUT MOUTH, no_mouth |
| 😷 | FACE WITH MEDICAL MASK, mask | 😸 | GRINNING CAT FACE WITH SMILING EYES, smile_cat |
| 😹 | CAT FACE WITH TEARS OF JOY, joy_cat | 😺 | SMILING CAT FACE WITH OPEN MOUTH, smiley_cat |
| 😻 | SMILING CAT FACE WITH HEART-SHAPED EYES, heart_eyes_cat | 😼 | CAT FACE WITH WRY SMILE, smirk_cat |
| 😽 | KISSING CAT FACE WITH CLOSED EYES, kissing_cat | 😾 | POUTING CAT FACE, pouting_cat |
| 😿 | CRYING CAT FACE, crying_cat_face | 🙀 | WEARY CAT FACE, scream_cat |
| 🙁 | SLIGHTLY FROWNING FACE, slightly_frowning_face | 🙂 | SLIGHTLY SMILING FACE, slightly_smiling_face |
| 🙃 | UPSIDE-DOWN FACE, upside_down_face | 🙄 | FACE WITH ROLLING EYES, face_with_rolling_eyes |
| 🙅‍♀️ 🙅🏻‍♀️ 🙅🏼‍♀️ 🙅🏽‍♀️ 🙅🏾‍♀️ 🙅🏿‍♀️ | woman-gesturing-no | 🙅‍♂️ 🙅🏻‍♂️ 🙅🏼‍♂️ 🙅🏽‍♂️ 🙅🏾‍♂️ 🙅🏿‍♂️ | man-gesturing-no |
| 🙅 🙅🏻 🙅🏼 🙅🏽 🙅🏾 🙅🏿 | FACE WITH NO GOOD GESTURE, no_good | 🙆‍♀️ 🙆🏻‍♀️ 🙆🏼‍♀️ 🙆🏽‍♀️ 🙆🏾‍♀️ 🙆🏿‍♀️ | woman-gesturing-ok |
| 🙆‍♂️ 🙆🏻‍♂️ 🙆🏼‍♂️ 🙆🏽‍♂️ 🙆🏾‍♂️ 🙆🏿‍♂️ | man-gesturing-ok | 🙆 🙆🏻 🙆🏼 🙆🏽 🙆🏾 🙆🏿 | FACE WITH OK GESTURE, ok_woman |
| 🙇‍♀️ 🙇🏻‍♀️ 🙇🏼‍♀️ 🙇🏽‍♀️ 🙇🏾‍♀️ 🙇🏿‍♀️ | woman-bowing | 🙇‍♂️ 🙇🏻‍♂️ 🙇🏼‍♂️ 🙇🏽‍♂️ 🙇🏾‍♂️ 🙇🏿‍♂️ | man-bowing |
| 🙇 🙇🏻 🙇🏼 🙇🏽 🙇🏾 🙇🏿 | PERSON BOWING DEEPLY, bow | 🙈 | SEE-NO-EVIL MONKEY, see_no_evil |
| 🙉 | HEAR-NO-EVIL MONKEY, hear_no_evil | 🙊 | SPEAK-NO-EVIL MONKEY, speak_no_evil |
| 🙋‍♀️ 🙋🏻‍♀️ 🙋🏼‍♀️ 🙋🏽‍♀️ 🙋🏾‍♀️ 🙋🏿‍♀️ | woman-raising-hand | 🙋‍♂️ 🙋🏻‍♂️ 🙋🏼‍♂️ 🙋🏽‍♂️ 🙋🏾‍♂️ 🙋🏿‍♂️ | man-raising-hand |
| 🙋 🙋🏻 🙋🏼 🙋🏽 🙋🏾 🙋🏿 | HAPPY PERSON RAISING ONE HAND, raising_hand | 🙌 🙌🏻 🙌🏼 🙌🏽 🙌🏾 🙌🏿 | PERSON RAISING BOTH HANDS IN CELEBRATION, raised_hands |
| 🙍‍♀️ 🙍🏻‍♀️ 🙍🏼‍♀️ 🙍🏽‍♀️ 🙍🏾‍♀️ 🙍🏿‍♀️ | woman-frowning | 🙍‍♂️ 🙍🏻‍♂️ 🙍🏼‍♂️ 🙍🏽‍♂️ 🙍🏾‍♂️ 🙍🏿‍♂️ | man-frowning |
| 🙍 🙍🏻 🙍🏼 🙍🏽 🙍🏾 🙍🏿 | PERSON FROWNING, person_frowning | 🙎‍♀️ 🙎🏻‍♀️ 🙎🏼‍♀️ 🙎🏽‍♀️ 🙎🏾‍♀️ 🙎🏿‍♀️ | woman-pouting |
| 🙎‍♂️ 🙎🏻‍♂️ 🙎🏼‍♂️ 🙎🏽‍♂️ 🙎🏾‍♂️ 🙎🏿‍♂️ | man-pouting | 🙎 🙎🏻 🙎🏼 🙎🏽 🙎🏾 🙎🏿 | PERSON WITH POUTING FACE, person_with_pouting_face |
| 🙏 🙏🏻 🙏🏼 🙏🏽 🙏🏾 🙏🏿 | PERSON WITH FOLDED HANDS, pray | 🚀 | ROCKET, rocket |
| 🚁 | HELICOPTER, helicopter | 🚂 | STEAM LOCOMOTIVE, steam_locomotive |
| 🚃 | RAILWAY CAR, railway_car | 🚄 | HIGH-SPEED TRAIN, bullettrain_side |
| 🚅 | HIGH-SPEED TRAIN WITH BULLET NOSE, bullettrain_front | 🚆 | TRAIN, train2 |
| 🚇 | METRO, metro | 🚈 | LIGHT RAIL, light_rail |
| 🚉 | STATION, station | 🚊 | TRAM, tram |
| 🚋 | TRAM CAR, train | 🚌 | BUS, bus |
| 🚍 | ONCOMING BUS, oncoming_bus | 🚎 | TROLLEYBUS, trolleybus |
| 🚏 | BUS STOP, busstop | 🚐 | MINIBUS, minibus |
| 🚑 | AMBULANCE, ambulance | 🚒 | FIRE ENGINE, fire_engine |
| 🚓 | POLICE CAR, police_car | 🚔 | ONCOMING POLICE CAR, oncoming_police_car |
| 🚕 | TAXI, taxi | 🚖 | ONCOMING TAXI, oncoming_taxi |
| 🚗 | AUTOMOBILE, car, red_car | 🚘 | ONCOMING AUTOMOBILE, oncoming_automobile |
| 🚙 | RECREATIONAL VEHICLE, blue_car | 🚚 | DELIVERY TRUCK, truck |
| 🚛 | ARTICULATED LORRY, articulated_lorry | 🚜 | TRACTOR, tractor |
| 🚝 | MONORAIL, monorail | 🚞 | MOUNTAIN RAILWAY, mountain_railway |
| 🚟 | SUSPENSION RAILWAY, suspension_railway | 🚠 | MOUNTAIN CABLEWAY, mountain_cableway |
| 🚡 | AERIAL TRAMWAY, aerial_tramway | 🚢 | SHIP, ship |
| 🚣‍♀️ 🚣🏻‍♀️ 🚣🏼‍♀️ 🚣🏽‍♀️ 🚣🏾‍♀️ 🚣🏿‍♀️ | woman-rowing-boat | 🚣‍♂️ 🚣🏻‍♂️ 🚣🏼‍♂️ 🚣🏽‍♂️ 🚣🏾‍♂️ 🚣🏿‍♂️ | man-rowing-boat |
| 🚣 🚣🏻 🚣🏼 🚣🏽 🚣🏾 🚣🏿 | ROWBOAT, rowboat | 🚤 | SPEEDBOAT, speedboat |
| 🚥 | HORIZONTAL TRAFFIC LIGHT, traffic_light | 🚦 | VERTICAL TRAFFIC LIGHT, vertical_traffic_light |
| 🚧 | CONSTRUCTION SIGN, construction | 🚨 | POLICE CARS REVOLVING LIGHT, rotating_light |
| 🚩 | TRIANGULAR FLAG ON POST, triangular_flag_on_post | 🚪 | DOOR, door |
| 🚫 | NO ENTRY SIGN, no_entry_sign | 🚬 | SMOKING SYMBOL, smoking |
| 🚭 | NO SMOKING SYMBOL, no_smoking | 🚮 | PUT LITTER IN ITS PLACE SYMBOL, put_litter_in_its_place |
| 🚯 | DO NOT LITTER SYMBOL, do_not_litter | 🚰 | POTABLE WATER SYMBOL, potable_water |
| 🚱 | NON-POTABLE WATER SYMBOL, non-potable_water | 🚲 | BICYCLE, bike |
| 🚳 | NO BICYCLES, no_bicycles | 🚴‍♀️ 🚴🏻‍♀️ 🚴🏼‍♀️ 🚴🏽‍♀️ 🚴🏾‍♀️ 🚴🏿‍♀️ | woman-biking |
| 🚴‍♂️ 🚴🏻‍♂️ 🚴🏼‍♂️ 🚴🏽‍♂️ 🚴🏾‍♂️ 🚴🏿‍♂️ | man-biking | 🚴 🚴🏻 🚴🏼 🚴🏽 🚴🏾 🚴🏿 | BICYCLIST, bicyclist |
| 🚵‍♀️ 🚵🏻‍♀️ 🚵🏼‍♀️ 🚵🏽‍♀️ 🚵🏾‍♀️ 🚵🏿‍♀️ | woman-mountain-biking | 🚵‍♂️ 🚵🏻‍♂️ 🚵🏼‍♂️ 🚵🏽‍♂️ 🚵🏾‍♂️ 🚵🏿‍♂️ | man-mountain-biking |
| 🚵 🚵🏻 🚵🏼 🚵🏽 🚵🏾 🚵🏿 | MOUNTAIN BICYCLIST, mountain_bicyclist | 🚶‍♀️ 🚶🏻‍♀️ 🚶🏼‍♀️ 🚶🏽‍♀️ 🚶🏾‍♀️ 🚶🏿‍♀️ | woman-walking |
| 🚶‍♂️ 🚶🏻‍♂️ 🚶🏼‍♂️ 🚶🏽‍♂️ 🚶🏾‍♂️ 🚶🏿‍♂️ | man-walking | 🚶 🚶🏻 🚶🏼 🚶🏽 🚶🏾 🚶🏿 | PEDESTRIAN, walking |
| 🚷 | NO PEDESTRIANS, no_pedestrians | 🚸 | CHILDREN CROSSING, children_crossing |
| 🚹 | MENS SYMBOL, mens | 🚺 | WOMENS SYMBOL, womens |
| 🚻 | RESTROOM, restroom | 🚼 | BABY SYMBOL, baby_symbol |
| 🚽 | TOILET, toilet | 🚾 | WATER CLOSET, wc |
| 🚿 | SHOWER, shower | 🛀 🛀🏻 🛀🏼 🛀🏽 🛀🏾 🛀🏿 | BATH, bath |
| 🛁 | BATHTUB, bathtub | 🛂 | PASSPORT CONTROL, passport_control |
| 🛃 | CUSTOMS, customs | 🛄 | BAGGAGE CLAIM, baggage_claim |
| 🛅 | LEFT LUGGAGE, left_luggage | 🛋️ | couch_and_lamp |
| 🛌 🛌🏻 🛌🏼 🛌🏽 🛌🏾 🛌🏿 | SLEEPING ACCOMMODATION, sleeping_accommodation | 🛍️ | shopping_bags |
| 🛎️ | bellhop_bell | 🛏️ | bed |
| 🛐 | PLACE OF WORSHIP, place_of_worship | 🛑 | OCTAGONAL SIGN, octagonal_sign |
| 🛒 | SHOPPING TROLLEY, shopping_trolley | 🛕 | HINDU TEMPLE, hindu_temple |
| 🛠️ | hammer_and_wrench | 🛡️ | shield |
| 🛢️ | oil_drum | 🛣️ | motorway |
| 🛤️ | railway_track | 🛥️ | motor_boat |
| 🛩️ | small_airplane | 🛫 | AIRPLANE DEPARTURE, airplane_departure |
| 🛬 | AIRPLANE ARRIVING, airplane_arriving | 🛰️ | satellite |
| 🛳️ | passenger_ship | 🛴 | SCOOTER, scooter |
| 🛵 | MOTOR SCOOTER, motor_scooter | 🛶 | CANOE, canoe |
| 🛷 | SLED, sled | 🛸 | FLYING SAUCER, flying_saucer |
| 🛹 | SKATEBOARD, skateboard | 🛺 | AUTO RICKSHAW, auto_rickshaw |
| 🟠 | LARGE ORANGE CIRCLE, large_orange_circle | 🟡 | LARGE YELLOW CIRCLE, large_yellow_circle |
| 🟢 | LARGE GREEN CIRCLE, large_green_circle | 🟣 | LARGE PURPLE CIRCLE, large_purple_circle |
| 🟤 | LARGE BROWN CIRCLE, large_brown_circle | 🟥 | LARGE RED SQUARE, large_red_square |
| 🟦 | LARGE BLUE SQUARE, large_blue_square | 🟧 | LARGE ORANGE SQUARE, large_orange_square |
| 🟨 | LARGE YELLOW SQUARE, large_yellow_square | 🟩 | LARGE GREEN SQUARE, large_green_square |
| 🟪 | LARGE PURPLE SQUARE, large_purple_square | 🟫 | LARGE BROWN SQUARE, large_brown_square |
| 🤍 | WHITE HEART, white_heart | 🤎 | BROWN HEART, brown_heart |
| 🤏 🤏🏻 🤏🏼 🤏🏽 🤏🏾 🤏🏿 | PINCHING HAND, pinching_hand | 🤐 | ZIPPER-MOUTH FACE, zipper_mouth_face |
| 🤑 | MONEY-MOUTH FACE, money_mouth_face | 🤒 | FACE WITH THERMOMETER, face_with_thermometer |
| 🤓 | NERD FACE, nerd_face | 🤔 | THINKING FACE, thinking_face |
| 🤕 | FACE WITH HEAD-BANDAGE, face_with_head_bandage | 🤖 | ROBOT FACE, robot_face |
| 🤗 | HUGGING FACE, hugging_face | 🤘 🤘🏻 🤘🏼 🤘🏽 🤘🏾 🤘🏿 | SIGN OF THE HORNS, the_horns, sign_of_the_horns |
| 🤙 🤙🏻 🤙🏼 🤙🏽 🤙🏾 🤙🏿 | CALL ME HAND, call_me_hand | 🤚 🤚🏻 🤚🏼 🤚🏽 🤚🏾 🤚🏿 | RAISED BACK OF HAND, raised_back_of_hand |
| 🤛 🤛🏻 🤛🏼 🤛🏽 🤛🏾 🤛🏿 | LEFT-FACING FIST, left-facing_fist | 🤜 🤜🏻 🤜🏼 🤜🏽 🤜🏾 🤜🏿 | RIGHT-FACING FIST, right-facing_fist |
| 🤝 | HANDSHAKE, handshake | 🤞 🤞🏻 🤞🏼 🤞🏽 🤞🏾 🤞🏿 | HAND WITH INDEX AND MIDDLE FINGERS CROSSED, crossed_fingers, hand_with_index_and_middle_fingers_crossed |
| 🤟 🤟🏻 🤟🏼 🤟🏽 🤟🏾 🤟🏿 | I LOVE YOU HAND SIGN, i_love_you_hand_sign | 🤠 | FACE WITH COWBOY HAT, face_with_cowboy_hat |
| 🤡 | CLOWN FACE, clown_face | 🤢 | NAUSEATED FACE, nauseated_face |
| 🤣 | ROLLING ON THE FLOOR LAUGHING, rolling_on_the_floor_laughing | 🤤 | DROOLING FACE, drooling_face |
| 🤥 | LYING FACE, lying_face | 🤦‍♀️ 🤦🏻‍♀️ 🤦🏼‍♀️ 🤦🏽‍♀️ 🤦🏾‍♀️ 🤦🏿‍♀️ | woman-facepalming |
| 🤦‍♂️ 🤦🏻‍♂️ 🤦🏼‍♂️ 🤦🏽‍♂️ 🤦🏾‍♂️ 🤦🏿‍♂️ | man-facepalming | 🤦 🤦🏻 🤦🏼 🤦🏽 🤦🏾 🤦🏿 | FACE PALM, face_palm |
| 🤧 | SNEEZING FACE, sneezing_face | 🤨 | FACE WITH ONE EYEBROW RAISED, face_with_raised_eyebrow, face_with_one_eyebrow_raised |
| 🤩 | GRINNING FACE WITH STAR EYES, star-struck, grinning_face_with_star_eyes | 🤪 | GRINNING FACE WITH ONE LARGE AND ONE SMALL EYE, zany_face, grinning_face_with_one_large_and_one_small_eye |
| 🤫 | FACE WITH FINGER COVERING CLOSED LIPS, shushing_face, face_with_finger_covering_closed_lips | 🤬 | SERIOUS FACE WITH SYMBOLS COVERING MOUTH, face_with_symbols_on_mouth, serious_face_with_symbols_covering_mouth |
| 🤭 | SMILING FACE WITH SMILING EYES AND HAND COVERING MOUTH, face_with_hand_over_mouth, smiling_face_with_smiling_eyes_and_hand_covering_mouth | 🤮 | FACE WITH OPEN MOUTH VOMITING, face_vomiting, face_with_open_mouth_vomiting |
| 🤯 | SHOCKED FACE WITH EXPLODING HEAD, exploding_head, shocked_face_with_exploding_head | 🤰 🤰🏻 🤰🏼 🤰🏽 🤰🏾 🤰🏿 | PREGNANT WOMAN, pregnant_woman |
| 🤱 🤱🏻 🤱🏼 🤱🏽 🤱🏾 🤱🏿 | BREAST-FEEDING, breast-feeding | 🤲 🤲🏻 🤲🏼 🤲🏽 🤲🏾 🤲🏿 | PALMS UP TOGETHER, palms_up_together |
| 🤳 🤳🏻 🤳🏼 🤳🏽 🤳🏾 🤳🏿 | SELFIE, selfie | 🤴 🤴🏻 🤴🏼 🤴🏽 🤴🏾 🤴🏿 | PRINCE, prince |
| 🤵 🤵🏻 🤵🏼 🤵🏽 🤵🏾 🤵🏿 | MAN IN TUXEDO, man_in_tuxedo | 🤶 🤶🏻 🤶🏼 🤶🏽 🤶🏾 🤶🏿 | MOTHER CHRISTMAS, mrs_claus, mother_christmas |
| 🤷‍♀️ 🤷🏻‍♀️ 🤷🏼‍♀️ 🤷🏽‍♀️ 🤷🏾‍♀️ 🤷🏿‍♀️ | woman-shrugging | 🤷‍♂️ 🤷🏻‍♂️ 🤷🏼‍♂️ 🤷🏽‍♂️ 🤷🏾‍♂️ 🤷🏿‍♂️ | man-shrugging |
| 🤷 🤷🏻 🤷🏼 🤷🏽 🤷🏾 🤷🏿 | SHRUG, shrug | 🤸‍♀️ 🤸🏻‍♀️ 🤸🏼‍♀️ 🤸🏽‍♀️ 🤸🏾‍♀️ 🤸🏿‍♀️ | woman-cartwheeling |
| 🤸‍♂️ 🤸🏻‍♂️ 🤸🏼‍♂️ 🤸🏽‍♂️ 🤸🏾‍♂️ 🤸🏿‍♂️ | man-cartwheeling | 🤸 🤸🏻 🤸🏼 🤸🏽 🤸🏾 🤸🏿 | PERSON DOING CARTWHEEL, person_doing_cartwheel |
| 🤹‍♀️ 🤹🏻‍♀️ 🤹🏼‍♀️ 🤹🏽‍♀️ 🤹🏾‍♀️ 🤹🏿‍♀️ | woman-juggling | 🤹‍♂️ 🤹🏻‍♂️ 🤹🏼‍♂️ 🤹🏽‍♂️ 🤹🏾‍♂️ 🤹🏿‍♂️ | man-juggling |
| 🤹 🤹🏻 🤹🏼 🤹🏽 🤹🏾 🤹🏿 | JUGGLING, juggling | 🤺 | FENCER, fencer |
| 🤼‍♀️ | woman-wrestling | 🤼‍♂️ | man-wrestling |
| 🤼 | WRESTLERS, wrestlers | 🤽‍♀️ 🤽🏻‍♀️ 🤽🏼‍♀️ 🤽🏽‍♀️ 🤽🏾‍♀️ 🤽🏿‍♀️ | woman-playing-water-polo |
| 🤽‍♂️ 🤽🏻‍♂️ 🤽🏼‍♂️ 🤽🏽‍♂️ 🤽🏾‍♂️ 🤽🏿‍♂️ | man-playing-water-polo | 🤽 🤽🏻 🤽🏼 🤽🏽 🤽🏾 🤽🏿 | WATER POLO, water_polo |
| 🤾‍♀️ 🤾🏻‍♀️ 🤾🏼‍♀️ 🤾🏽‍♀️ 🤾🏾‍♀️ 🤾🏿‍♀️ | woman-playing-handball | 🤾‍♂️ 🤾🏻‍♂️ 🤾🏼‍♂️ 🤾🏽‍♂️ 🤾🏾‍♂️ 🤾🏿‍♂️ | man-playing-handball |
| 🤾 🤾🏻 🤾🏼 🤾🏽 🤾🏾 🤾🏿 | HANDBALL, handball | 🤿 | DIVING MASK, diving_mask |
| 🥀 | WILTED FLOWER, wilted_flower | 🥁 | DRUM WITH DRUMSTICKS, drum_with_drumsticks |
| 🥂 | CLINKING GLASSES, clinking_glasses | 🥃 | TUMBLER GLASS, tumbler_glass |
| 🥄 | SPOON, spoon | 🥅 | GOAL NET, goal_net |
| 🥇 | FIRST PLACE MEDAL, first_place_medal | 🥈 | SECOND PLACE MEDAL, second_place_medal |
| 🥉 | THIRD PLACE MEDAL, third_place_medal | 🥊 | BOXING GLOVE, boxing_glove |
| 🥋 | MARTIAL ARTS UNIFORM, martial_arts_uniform | 🥌 | CURLING STONE, curling_stone |
| 🥍 | LACROSSE STICK AND BALL, lacrosse | 🥎 | SOFTBALL, softball |
| 🥏 | FLYING DISC, flying_disc | 🥐 | CROISSANT, croissant |
| 🥑 | AVOCADO, avocado | 🥒 | CUCUMBER, cucumber |
| 🥓 | BACON, bacon | 🥔 | POTATO, potato |
| 🥕 | CARROT, carrot | 🥖 | BAGUETTE BREAD, baguette_bread |
| 🥗 | GREEN SALAD, green_salad | 🥘 | SHALLOW PAN OF FOOD, shallow_pan_of_food |
| 🥙 | STUFFED FLATBREAD, stuffed_flatbread | 🥚 | EGG, egg |
| 🥛 | GLASS OF MILK, glass_of_milk | 🥜 | PEANUTS, peanuts |
| 🥝 | KIWIFRUIT, kiwifruit | 🥞 | PANCAKES, pancakes |
| 🥟 | DUMPLING, dumpling | 🥠 | FORTUNE COOKIE, fortune_cookie |
| 🥡 | TAKEOUT BOX, takeout_box | 🥢 | CHOPSTICKS, chopsticks |
| 🥣 | BOWL WITH SPOON, bowl_with_spoon | 🥤 | CUP WITH STRAW, cup_with_straw |
| 🥥 | COCONUT, coconut | 🥦 | BROCCOLI, broccoli |
| 🥧 | PIE, pie | 🥨 | PRETZEL, pretzel |
| 🥩 | CUT OF MEAT, cut_of_meat | 🥪 | SANDWICH, sandwich |
| 🥫 | CANNED FOOD, canned_food | 🥬 | LEAFY GREEN, leafy_green |
| 🥭 | MANGO, mango | 🥮 | MOON CAKE, moon_cake |
| 🥯 | BAGEL, bagel | 🥰 | SMILING FACE WITH SMILING EYES AND THREE HEARTS, smiling_face_with_3_hearts |
| 🥱 | YAWNING FACE, yawning_face | 🥳 | FACE WITH PARTY HORN AND PARTY HAT, partying_face |
| 🥴 | FACE WITH UNEVEN EYES AND WAVY MOUTH, woozy_face | 🥵 | OVERHEATED FACE, hot_face |
| 🥶 | FREEZING FACE, cold_face | 🥺 | FACE WITH PLEADING EYES, pleading_face |
| 🥻 | SARI, sari | 🥼 | LAB COAT, lab_coat |
| 🥽 | GOGGLES, goggles | 🥾 | HIKING BOOT, hiking_boot |
| 🥿 | FLAT SHOE, womans_flat_shoe | 🦀 | CRAB, crab |
| 🦁 | LION FACE, lion_face | 🦂 | SCORPION, scorpion |
| 🦃 | TURKEY, turkey | 🦄 | UNICORN FACE, unicorn_face |
| 🦅 | EAGLE, eagle | 🦆 | DUCK, duck |
| 🦇 | BAT, bat | 🦈 | SHARK, shark |
| 🦉 | OWL, owl | 🦊 | FOX FACE, fox_face |
| 🦋 | BUTTERFLY, butterfly | 🦌 | DEER, deer |
| 🦍 | GORILLA, gorilla | 🦎 | LIZARD, lizard |
| 🦏 | RHINOCEROS, rhinoceros | 🦐 | SHRIMP, shrimp |
| 🦑 | SQUID, squid | 🦒 | GIRAFFE FACE, giraffe_face |
| 🦓 | ZEBRA FACE, zebra_face | 🦔 | HEDGEHOG, hedgehog |
| 🦕 | SAUROPOD, sauropod | 🦖 | T-REX, t-rex |
| 🦗 | CRICKET, cricket | 🦘 | KANGAROO, kangaroo |
| 🦙 | LLAMA, llama | 🦚 | PEACOCK, peacock |
| 🦛 | HIPPOPOTAMUS, hippopotamus | 🦜 | PARROT, parrot |
| 🦝 | RACCOON, raccoon | 🦞 | LOBSTER, lobster |
| 🦟 | MOSQUITO, mosquito | 🦠 | MICROBE, microbe |
| 🦡 | BADGER, badger | 🦢 | SWAN, swan |
| 🦥 | SLOTH, sloth | 🦦 | OTTER, otter |
| 🦧 | ORANGUTAN, orangutan | 🦨 | SKUNK, skunk |
| 🦩 | FLAMINGO, flamingo | 🦪 | OYSTER, oyster |
| 🦮 | GUIDE DOG, guide_dog | 🦯 | PROBING CANE, probing_cane |
| 🦴 | BONE, bone | 🦵 🦵🏻 🦵🏼 🦵🏽 🦵🏾 🦵🏿 | LEG, leg |
| 🦶 🦶🏻 🦶🏼 🦶🏽 🦶🏾 🦶🏿 | FOOT, foot | 🦷 | TOOTH, tooth |
| 🦸‍♀️ 🦸🏻‍♀️ 🦸🏼‍♀️ 🦸🏽‍♀️ 🦸🏾‍♀️ 🦸🏿‍♀️ | female_superhero | 🦸‍♂️ 🦸🏻‍♂️ 🦸🏼‍♂️ 🦸🏽‍♂️ 🦸🏾‍♂️ 🦸🏿‍♂️ | male_superhero |
| 🦸 🦸🏻 🦸🏼 🦸🏽 🦸🏾 🦸🏿 | SUPERHERO, superhero | 🦹‍♀️ 🦹🏻‍♀️ 🦹🏼‍♀️ 🦹🏽‍♀️ 🦹🏾‍♀️ 🦹🏿‍♀️ | female_supervillain |
| 🦹‍♂️ 🦹🏻‍♂️ 🦹🏼‍♂️ 🦹🏽‍♂️ 🦹🏾‍♂️ 🦹🏿‍♂️ | male_supervillain | 🦹 🦹🏻 🦹🏼 🦹🏽 🦹🏾 🦹🏿 | SUPERVILLAIN, supervillain |
| 🦺 | SAFETY VEST, safety_vest | 🦻 🦻🏻 🦻🏼 🦻🏽 🦻🏾 🦻🏿 | EAR WITH HEARING AID, ear_with_hearing_aid |
| 🦼 | MOTORIZED WHEELCHAIR, motorized_wheelchair | 🦽 | MANUAL WHEELCHAIR, manual_wheelchair |
| 🦾 | MECHANICAL ARM, mechanical_arm | 🦿 | MECHANICAL LEG, mechanical_leg |
| 🧀 | CHEESE WEDGE, cheese_wedge | 🧁 | CUPCAKE, cupcake |
| 🧂 | SALT SHAKER, salt | 🧃 | BEVERAGE BOX, beverage_box |
| 🧄 | GARLIC, garlic | 🧅 | ONION, onion |
| 🧆 | FALAFEL, falafel | 🧇 | WAFFLE, waffle |
| 🧈 | BUTTER, butter | 🧉 | MATE DRINK, mate_drink |
| 🧊 | ICE CUBE, ice_cube | 🧍‍♀️ 🧍🏻‍♀️ 🧍🏼‍♀️ 🧍🏽‍♀️ 🧍🏾‍♀️ 🧍🏿‍♀️ | woman_standing |
| 🧍‍♂️ 🧍🏻‍♂️ 🧍🏼‍♂️ 🧍🏽‍♂️ 🧍🏾‍♂️ 🧍🏿‍♂️ | man_standing | 🧍 🧍🏻 🧍🏼 🧍🏽 🧍🏾 🧍🏿 | STANDING PERSON, standing_person |
| 🧎‍♀️ 🧎🏻‍♀️ 🧎🏼‍♀️ 🧎🏽‍♀️ 🧎🏾‍♀️ 🧎🏿‍♀️ | woman_kneeling | 🧎‍♂️ 🧎🏻‍♂️ 🧎🏼‍♂️ 🧎🏽‍♂️ 🧎🏾‍♂️ 🧎🏿‍♂️ | man_kneeling |
| 🧎 🧎🏻 🧎🏼 🧎🏽 🧎🏾 🧎🏿 | KNEELING PERSON, kneeling_person | 🧏‍♀️ 🧏🏻‍♀️ 🧏🏼‍♀️ 🧏🏽‍♀️ 🧏🏾‍♀️ 🧏🏿‍♀️ | deaf_woman |
| 🧏‍♂️ 🧏🏻‍♂️ 🧏🏼‍♂️ 🧏🏽‍♂️ 🧏🏾‍♂️ 🧏🏿‍♂️ | deaf_man | 🧏 🧏🏻 🧏🏼 🧏🏽 🧏🏾 🧏🏿 | DEAF PERSON, deaf_person |
| 🧐 | FACE WITH MONOCLE, face_with_monocle | 🧑‍🌾 🧑🏻‍🌾 🧑🏼‍🌾 🧑🏽‍🌾 🧑🏾‍🌾 🧑🏿‍🌾 | farmer |
| 🧑‍🍳 🧑🏻‍🍳 🧑🏼‍🍳 🧑🏽‍🍳 🧑🏾‍🍳 🧑🏿‍🍳 | cook | 🧑‍🎓 🧑🏻‍🎓 🧑🏼‍🎓 🧑🏽‍🎓 🧑🏾‍🎓 🧑🏿‍🎓 | student |
| 🧑‍🎤 🧑🏻‍🎤 🧑🏼‍🎤 🧑🏽‍🎤 🧑🏾‍🎤 🧑🏿‍🎤 | singer | 🧑‍🎨 🧑🏻‍🎨 🧑🏼‍🎨 🧑🏽‍🎨 🧑🏾‍🎨 🧑🏿‍🎨 | artist |
| 🧑‍🏫 🧑🏻‍🏫 🧑🏼‍🏫 🧑🏽‍🏫 🧑🏾‍🏫 🧑🏿‍🏫 | teacher | 🧑‍🏭 🧑🏻‍🏭 🧑🏼‍🏭 🧑🏽‍🏭 🧑🏾‍🏭 🧑🏿‍🏭 | factory_worker |
| 🧑‍💻 🧑🏻‍💻 🧑🏼‍💻 🧑🏽‍💻 🧑🏾‍💻 🧑🏿‍💻 | technologist | 🧑‍💼 🧑🏻‍💼 🧑🏼‍💼 🧑🏽‍💼 🧑🏾‍💼 🧑🏿‍💼 | office_worker |
| 🧑‍🔧 🧑🏻‍🔧 🧑🏼‍🔧 🧑🏽‍🔧 🧑🏾‍🔧 🧑🏿‍🔧 | mechanic | 🧑‍🔬 🧑🏻‍🔬 🧑🏼‍🔬 🧑🏽‍🔬 🧑🏾‍🔬 🧑🏿‍🔬 | scientist |
| 🧑‍🚀 🧑🏻‍🚀 🧑🏼‍🚀 🧑🏽‍🚀 🧑🏾‍🚀 🧑🏿‍🚀 | astronaut | 🧑‍🚒 🧑🏻‍🚒 🧑🏼‍🚒 🧑🏽‍🚒 🧑🏾‍🚒 🧑🏿‍🚒 | firefighter |
| 🧑‍🤝‍🧑 🧑🏻‍🤝‍🧑🏻 🧑🏻‍🤝‍🧑🏼 🧑🏻‍🤝‍🧑🏽 🧑🏻‍🤝‍🧑🏾 🧑🏻‍🤝‍🧑🏿 🧑🏼‍🤝‍🧑🏻 🧑🏼‍🤝‍🧑🏼 🧑🏼‍🤝‍🧑🏽 🧑🏼‍🤝‍🧑🏾 🧑🏼‍🤝‍🧑🏿 🧑🏽‍🤝‍🧑🏻 🧑🏽‍🤝‍🧑🏼 🧑🏽‍🤝‍🧑🏽 🧑🏽‍🤝‍🧑🏾 🧑🏽‍🤝‍🧑🏿 🧑🏾‍🤝‍🧑🏻 🧑🏾‍🤝‍🧑🏼 🧑🏾‍🤝‍🧑🏽 🧑🏾‍🤝‍🧑🏾 🧑🏾‍🤝‍🧑🏿 🧑🏿‍🤝‍🧑🏻 🧑🏿‍🤝‍🧑🏼 🧑🏿‍🤝‍🧑🏽 🧑🏿‍🤝‍🧑🏾 🧑🏿‍🤝‍🧑🏿 | people_holding_hands | 🧑‍🦯 🧑🏻‍🦯 🧑🏼‍🦯 🧑🏽‍🦯 🧑🏾‍🦯 🧑🏿‍🦯 | person_with_probing_cane |
| 🧑‍🦰 🧑🏻‍🦰 🧑🏼‍🦰 🧑🏽‍🦰 🧑🏾‍🦰 🧑🏿‍🦰 | red_haired_person | 🧑‍🦱 🧑🏻‍🦱 🧑🏼‍🦱 🧑🏽‍🦱 🧑🏾‍🦱 🧑🏿‍🦱 | curly_haired_person |
| 🧑‍🦲 🧑🏻‍🦲 🧑🏼‍🦲 🧑🏽‍🦲 🧑🏾‍🦲 🧑🏿‍🦲 | bald_person | 🧑‍🦳 🧑🏻‍🦳 🧑🏼‍🦳 🧑🏽‍🦳 🧑🏾‍🦳 🧑🏿‍🦳 | white_haired_person |
| 🧑‍🦼 🧑🏻‍🦼 🧑🏼‍🦼 🧑🏽‍🦼 🧑🏾‍🦼 🧑🏿‍🦼 | person_in_motorized_wheelchair | 🧑‍🦽 🧑🏻‍🦽 🧑🏼‍🦽 🧑🏽‍🦽 🧑🏾‍🦽 🧑🏿‍🦽 | person_in_manual_wheelchair |
| 🧑‍⚕️ 🧑🏻‍⚕️ 🧑🏼‍⚕️ 🧑🏽‍⚕️ 🧑🏾‍⚕️ 🧑🏿‍⚕️ | health_worker | 🧑‍⚖️ 🧑🏻‍⚖️ 🧑🏼‍⚖️ 🧑🏽‍⚖️ 🧑🏾‍⚖️ 🧑🏿‍⚖️ | judge |
| 🧑‍✈️ 🧑🏻‍✈️ 🧑🏼‍✈️ 🧑🏽‍✈️ 🧑🏾‍✈️ 🧑🏿‍✈️ | pilot | 🧑 🧑🏻 🧑🏼 🧑🏽 🧑🏾 🧑🏿 | ADULT, adult |
| 🧒 🧒🏻 🧒🏼 🧒🏽 🧒🏾 🧒🏿 | CHILD, child | 🧓 🧓🏻 🧓🏼 🧓🏽 🧓🏾 🧓🏿 | OLDER ADULT, older_adult |
| 🧔 🧔🏻 🧔🏼 🧔🏽 🧔🏾 🧔🏿 | BEARDED PERSON, bearded_person | 🧕 🧕🏻 🧕🏼 🧕🏽 🧕🏾 🧕🏿 | PERSON WITH HEADSCARF, person_with_headscarf |
| 🧖‍♀️ 🧖🏻‍♀️ 🧖🏼‍♀️ 🧖🏽‍♀️ 🧖🏾‍♀️ 🧖🏿‍♀️ | woman_in_steamy_room | 🧖‍♂️ 🧖🏻‍♂️ 🧖🏼‍♂️ 🧖🏽‍♂️ 🧖🏾‍♂️ 🧖🏿‍♂️ | man_in_steamy_room |
| 🧖 🧖🏻 🧖🏼 🧖🏽 🧖🏾 🧖🏿 | PERSON IN STEAMY ROOM, person_in_steamy_room | 🧗‍♀️ 🧗🏻‍♀️ 🧗🏼‍♀️ 🧗🏽‍♀️ 🧗🏾‍♀️ 🧗🏿‍♀️ | woman_climbing |
| 🧗‍♂️ 🧗🏻‍♂️ 🧗🏼‍♂️ 🧗🏽‍♂️ 🧗🏾‍♂️ 🧗🏿‍♂️ | man_climbing | 🧗 🧗🏻 🧗🏼 🧗🏽 🧗🏾 🧗🏿 | PERSON CLIMBING, person_climbing |
| 🧘‍♀️ 🧘🏻‍♀️ 🧘🏼‍♀️ 🧘🏽‍♀️ 🧘🏾‍♀️ 🧘🏿‍♀️ | woman_in_lotus_position | 🧘‍♂️ 🧘🏻‍♂️ 🧘🏼‍♂️ 🧘🏽‍♂️ 🧘🏾‍♂️ 🧘🏿‍♂️ | man_in_lotus_position |
| 🧘 🧘🏻 🧘🏼 🧘🏽 🧘🏾 🧘🏿 | PERSON IN LOTUS POSITION, person_in_lotus_position | 🧙‍♀️ 🧙🏻‍♀️ 🧙🏼‍♀️ 🧙🏽‍♀️ 🧙🏾‍♀️ 🧙🏿‍♀️ | female_mage |
| 🧙‍♂️ 🧙🏻‍♂️ 🧙🏼‍♂️ 🧙🏽‍♂️ 🧙🏾‍♂️ 🧙🏿‍♂️ | male_mage | 🧙 🧙🏻 🧙🏼 🧙🏽 🧙🏾 🧙🏿 | MAGE, mage |
| 🧚‍♀️ 🧚🏻‍♀️ 🧚🏼‍♀️ 🧚🏽‍♀️ 🧚🏾‍♀️ 🧚🏿‍♀️ | female_fairy | 🧚‍♂️ 🧚🏻‍♂️ 🧚🏼‍♂️ 🧚🏽‍♂️ 🧚🏾‍♂️ 🧚🏿‍♂️ | male_fairy |
| 🧚 🧚🏻 🧚🏼 🧚🏽 🧚🏾 🧚🏿 | FAIRY, fairy | 🧛‍♀️ 🧛🏻‍♀️ 🧛🏼‍♀️ 🧛🏽‍♀️ 🧛🏾‍♀️ 🧛🏿‍♀️ | female_vampire |
| 🧛‍♂️ 🧛🏻‍♂️ 🧛🏼‍♂️ 🧛🏽‍♂️ 🧛🏾‍♂️ 🧛🏿‍♂️ | male_vampire | 🧛 🧛🏻 🧛🏼 🧛🏽 🧛🏾 🧛🏿 | VAMPIRE, vampire |
| 🧜‍♀️ 🧜🏻‍♀️ 🧜🏼‍♀️ 🧜🏽‍♀️ 🧜🏾‍♀️ 🧜🏿‍♀️ | mermaid | 🧜‍♂️ 🧜🏻‍♂️ 🧜🏼‍♂️ 🧜🏽‍♂️ 🧜🏾‍♂️ 🧜🏿‍♂️ | merman |
| 🧜 🧜🏻 🧜🏼 🧜🏽 🧜🏾 🧜🏿 | MERPERSON, merperson | 🧝‍♀️ 🧝🏻‍♀️ 🧝🏼‍♀️ 🧝🏽‍♀️ 🧝🏾‍♀️ 🧝🏿‍♀️ | female_elf |
| 🧝‍♂️ 🧝🏻‍♂️ 🧝🏼‍♂️ 🧝🏽‍♂️ 🧝🏾‍♂️ 🧝🏿‍♂️ | male_elf | 🧝 🧝🏻 🧝🏼 🧝🏽 🧝🏾 🧝🏿 | ELF, elf |
| 🧞‍♀️ | female_genie | 🧞‍♂️ | male_genie |
| 🧞 | GENIE, genie | 🧟‍♀️ | female_zombie |
| 🧟‍♂️ | male_zombie | 🧟 | ZOMBIE, zombie |
| 🧠 | BRAIN, brain | 🧡 | ORANGE HEART, orange_heart |
| 🧢 | BILLED CAP, billed_cap | 🧣 | SCARF, scarf |
| 🧤 | GLOVES, gloves | 🧥 | COAT, coat |
| 🧦 | SOCKS, socks | 🧧 | RED GIFT ENVELOPE, red_envelope |
| 🧨 | FIRECRACKER, firecracker | 🧩 | JIGSAW PUZZLE PIECE, jigsaw |
| 🧪 | TEST TUBE, test_tube | 🧫 | PETRI DISH, petri_dish |
| 🧬 | DNA DOUBLE HELIX, dna | 🧭 | COMPASS, compass |
| 🧮 | ABACUS, abacus | 🧯 | FIRE EXTINGUISHER, fire_extinguisher |
| 🧰 | TOOLBOX, toolbox | 🧱 | BRICK, bricks |
| 🧲 | MAGNET, magnet | 🧳 | LUGGAGE, luggage |
| 🧴 | LOTION BOTTLE, lotion_bottle | 🧵 | SPOOL OF THREAD, thread |
| 🧶 | BALL OF YARN, yarn | 🧷 | SAFETY PIN, safety_pin |
| 🧸 | TEDDY BEAR, teddy_bear | 🧹 | BROOM, broom |
| 🧺 | BASKET, basket | 🧻 | ROLL OF PAPER, roll_of_paper |
| 🧼 | BAR OF SOAP, soap | 🧽 | SPONGE, sponge |
| 🧾 | RECEIPT, receipt | 🧿 | NAZAR AMULET, nazar_amulet |
| 🩰 | BALLET SHOES, ballet_shoes | 🩱 | ONE-PIECE SWIMSUIT, one-piece_swimsuit |
| 🩲 | BRIEFS, briefs | 🩳 | SHORTS, shorts |
| 🩸 | DROP OF BLOOD, drop_of_blood | 🩹 | ADHESIVE BANDAGE, adhesive_bandage |
| 🩺 | STETHOSCOPE, stethoscope | 🪀 | YO-YO, yo-yo |
| 🪁 | KITE, kite | 🪂 | PARACHUTE, parachute |
| 🪐 | RINGED PLANET, ringed_planet | 🪑 | CHAIR, chair |
| 🪒 | RAZOR, razor | 🪓 | AXE, axe |
| 🪔 | DIYA LAMP, diya_lamp | 🪕 | BANJO, banjo |
| ‼️ | DOUBLE EXCLAMATION MARK, bangbang | ⁉️ | EXCLAMATION QUESTION MARK, interrobang |
| ™️ | TRADE MARK SIGN, tm | ℹ️ | INFORMATION SOURCE, information_source |
| ↔️ | LEFT RIGHT ARROW, left_right_arrow | ↕️ | UP DOWN ARROW, arrow_up_down |
| ↖️ | NORTH WEST ARROW, arrow_upper_left | ↗️ | NORTH EAST ARROW, arrow_upper_right |
| ↘️ | SOUTH EAST ARROW, arrow_lower_right | ↙️ | SOUTH WEST ARROW, arrow_lower_left |
| ↩️ | LEFTWARDS ARROW WITH HOOK, leftwards_arrow_with_hook | ↪️ | RIGHTWARDS ARROW WITH HOOK, arrow_right_hook |
| ⌚ | WATCH, watch | ⌛ | HOURGLASS, hourglass |
| ⌨️ | keyboard | ⏏️ | eject |
| ⏩ | BLACK RIGHT-POINTING DOUBLE TRIANGLE, fast_forward | ⏪ | BLACK LEFT-POINTING DOUBLE TRIANGLE, rewind |
| ⏫ | BLACK UP-POINTING DOUBLE TRIANGLE, arrow_double_up | ⏬ | BLACK DOWN-POINTING DOUBLE TRIANGLE, arrow_double_down |
| ⏭️ | black_right_pointing_double_triangle_with_vertical_bar | ⏮️ | black_left_pointing_double_triangle_with_vertical_bar |
| ⏯️ | black_right_pointing_triangle_with_double_vertical_bar | ⏰ | ALARM CLOCK, alarm_clock |
| ⏱️ | stopwatch | ⏲️ | timer_clock |
| ⏳ | HOURGLASS WITH FLOWING SAND, hourglass_flowing_sand | ⏸️ | double_vertical_bar |
| ⏹️ | black_square_for_stop | ⏺️ | black_circle_for_record |
| Ⓜ️ | CIRCLED LATIN CAPITAL LETTER M, m | ▪️ | BLACK SMALL SQUARE, black_small_square |
| ▫️ | WHITE SMALL SQUARE, white_small_square | ▶️ | BLACK RIGHT-POINTING TRIANGLE, arrow_forward |
| ◀️ | BLACK LEFT-POINTING TRIANGLE, arrow_backward | ◻️ | WHITE MEDIUM SQUARE, white_medium_square |
| ◼️ | BLACK MEDIUM SQUARE, black_medium_square | ◽ | WHITE MEDIUM SMALL SQUARE, white_medium_small_square |
| ◾ | BLACK MEDIUM SMALL SQUARE, black_medium_small_square | ☀️ | BLACK SUN WITH RAYS, sunny |
| ☁️ | CLOUD, cloud | ☂️ | umbrella |
| ☃️ | snowman | ☄️ | comet |
| ☎️ | BLACK TELEPHONE, phone, telephone | ☑️ | BALLOT BOX WITH CHECK, ballot_box_with_check |
| ☔ | UMBRELLA WITH RAIN DROPS, umbrella_with_rain_drops | ☕ | HOT BEVERAGE, coffee |
| ☘️ | shamrock | ☝️ ☝🏻 ☝🏼 ☝🏽 ☝🏾 ☝🏿 | WHITE UP POINTING INDEX, point_up |
| ☠️ | skull_and_crossbones | ☢️ | radioactive_sign |
| ☣️ | biohazard_sign | ☦️ | orthodox_cross |
| ☪️ | star_and_crescent | ☮️ | peace_symbol |
| ☯️ | yin_yang | ☸️ | wheel_of_dharma |
| ☹️ | white_frowning_face | ☺️ | WHITE SMILING FACE, relaxed |
| ♀️ | female_sign | ♂️ | male_sign |
| ♈ | ARIES, aries | ♉ | TAURUS, taurus |
| ♊ | GEMINI, gemini | ♋ | CANCER, cancer |
| ♌ | LEO, leo | ♍ | VIRGO, virgo |
| ♎ | LIBRA, libra | ♏ | SCORPIUS, scorpius |
| ♐ | SAGITTARIUS, sagittarius | ♑ | CAPRICORN, capricorn |
| ♒ | AQUARIUS, aquarius | ♓ | PISCES, pisces |
| ♟️ | chess_pawn | ♠️ | BLACK SPADE SUIT, spades |
| ♣️ | BLACK CLUB SUIT, clubs | ♥️ | BLACK HEART SUIT, hearts |
| ♦️ | BLACK DIAMOND SUIT, diamonds | ♨️ | HOT SPRINGS, hotsprings |
| ♻️ | BLACK UNIVERSAL RECYCLING SYMBOL, recycle | ♾️ | infinity |
| ♿ | WHEELCHAIR SYMBOL, wheelchair | ⚒️ | hammer_and_pick |
| ⚓ | ANCHOR, anchor | ⚔️ | crossed_swords |
| ⚕️ | medical_symbol, staff_of_aesculapius | ⚖️ | scales |
| ⚗️ | alembic | ⚙️ | gear |
| ⚛️ | atom_symbol | ⚜️ | fleur_de_lis |
| ⚠️ | WARNING SIGN, warning | ⚡ | HIGH VOLTAGE SIGN, zap |
| ⚪ | MEDIUM WHITE CIRCLE, white_circle | ⚫ | MEDIUM BLACK CIRCLE, black_circle |
| ⚰️ | coffin | ⚱️ | funeral_urn |
| ⚽ | SOCCER BALL, soccer | ⚾ | BASEBALL, baseball |
| ⛄ | SNOWMAN WITHOUT SNOW, snowman_without_snow | ⛅ | SUN BEHIND CLOUD, partly_sunny |
| ⛈️ | thunder_cloud_and_rain | ⛎ | OPHIUCHUS, ophiuchus |
| ⛏️ | pick | ⛑️ | helmet_with_white_cross |
| ⛓️ | chains | ⛔ | NO ENTRY, no_entry |
| ⛩️ | shinto_shrine | ⛪ | CHURCH, church |
| ⛰️ | mountain | ⛱️ | umbrella_on_ground |
| ⛲ | FOUNTAIN, fountain | ⛳ | FLAG IN HOLE, golf |
| ⛴️ | ferry | ⛵ | SAILBOAT, boat, sailboat |
| ⛷️ | skier | ⛸️ | ice_skate |
| ⛹️‍♀️ ⛹🏻‍♀️ ⛹🏼‍♀️ ⛹🏽‍♀️ ⛹🏾‍♀️ ⛹🏿‍♀️ | woman-bouncing-ball | ⛹️‍♂️ ⛹🏻‍♂️ ⛹🏼‍♂️ ⛹🏽‍♂️ ⛹🏾‍♂️ ⛹🏿‍♂️ | man-bouncing-ball |
| ⛹️ ⛹🏻 ⛹🏼 ⛹🏽 ⛹🏾 ⛹🏿 | person_with_ball | ⛺ | TENT, tent |
| ⛽ | FUEL PUMP, fuelpump | ✂️ | BLACK SCISSORS, scissors |
| ✅ | WHITE HEAVY CHECK MARK, white_check_mark | ✈️ | AIRPLANE, airplane |
| ✉️ | ENVELOPE, email, envelope | ✊ ✊🏻 ✊🏼 ✊🏽 ✊🏾 ✊🏿 | RAISED FIST, fist |
| ✋ ✋🏻 ✋🏼 ✋🏽 ✋🏾 ✋🏿 | RAISED HAND, hand, raised_hand | ✌️ ✌🏻 ✌🏼 ✌🏽 ✌🏾 ✌🏿 | VICTORY HAND, v |
| ✍️ ✍🏻 ✍🏼 ✍🏽 ✍🏾 ✍🏿 | writing_hand | ✏️ | PENCIL, pencil2 |
| ✒️ | BLACK NIB, black_nib | ✔️ | HEAVY CHECK MARK, heavy_check_mark |
| ✖️ | HEAVY MULTIPLICATION X, heavy_multiplication_x | ✝️ | latin_cross |
| ✡️ | star_of_david | ✨ | SPARKLES, sparkles |
| ✳️ | EIGHT SPOKED ASTERISK, eight_spoked_asterisk | ✴️ | EIGHT POINTED BLACK STAR, eight_pointed_black_star |
| ❄️ | SNOWFLAKE, snowflake | ❇️ | SPARKLE, sparkle |
| ❌ | CROSS MARK, x | ❎ | NEGATIVE SQUARED CROSS MARK, negative_squared_cross_mark |
| ❓ | BLACK QUESTION MARK ORNAMENT, question | ❔ | WHITE QUESTION MARK ORNAMENT, grey_question |
| ❕ | WHITE EXCLAMATION MARK ORNAMENT, grey_exclamation | ❗ | HEAVY EXCLAMATION MARK SYMBOL, exclamation, heavy_exclamation_mark |
| ❣️ | heavy_heart_exclamation_mark_ornament | ❤️ | HEAVY BLACK HEART, heart |
| ➕ | HEAVY PLUS SIGN, heavy_plus_sign | ➖ | HEAVY MINUS SIGN, heavy_minus_sign |
| ➗ | HEAVY DIVISION SIGN, heavy_division_sign | ➡️ | BLACK RIGHTWARDS ARROW, arrow_right |
| ➰ | CURLY LOOP, curly_loop | ➿ | DOUBLE CURLY LOOP, loop |
| ⤴️ | ARROW POINTING RIGHTWARDS THEN CURVING UPWARDS, arrow_heading_up | ⤵️ | ARROW POINTING RIGHTWARDS THEN CURVING DOWNWARDS, arrow_heading_down |
| ⬅️ | LEFTWARDS BLACK ARROW, arrow_left | ⬆️ | UPWARDS BLACK ARROW, arrow_up |
| ⬇️ | DOWNWARDS BLACK ARROW, arrow_down | ⬛ | BLACK LARGE SQUARE, black_large_square |
| ⬜ | WHITE LARGE SQUARE, white_large_square | ⭐ | WHITE MEDIUM STAR, star |
| ⭕ | HEAVY LARGE CIRCLE, o | 〰️ | WAVY DASH, wavy_dash |
| 〽️ | PART ALTERNATION MARK, part_alternation_mark | ㊗️ | CIRCLED IDEOGRAPH CONGRATULATION, congratulations |
| ㊙️ | CIRCLED IDEOGRAPH SECRET, secret |  |

