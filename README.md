# emoji-data-ios

[![CI Status](http://img.shields.io/travis/maxoumime/emoji-data-ios.svg?style=flat)](https://travis-ci.org/maxoumime/emoji-data-ios)
[![Version](https://img.shields.io/cocoapods/v/emojidataios.svg?style=flat)](http://cocoapods.org/pods/emojidataios)
[![License](https://img.shields.io/cocoapods/l/emojidataios.svg?style=flat)](http://cocoapods.org/pods/emojidataios)
[![Platform](https://img.shields.io/cocoapods/p/emojidataios.svg?style=flat)](http://cocoapods.org/pods/emojidataios)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

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

#### Categories

There is 8 different categories, their are available through a enum named `EmojiCategory`

| Symbols |
| Objects |
| Nature |
| People |
| Foods |
| Places |
| Activity |
| Flags |

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

**emoji-java** based on the great work of the community from [vdurmont/emoji-java](https://github.com/vdurmont/emoji-java). The logic is inspired from there.
**emoji-data** provides the emojis for the library to work [iamcal/emoji-data](https://github.com/iamcal/emoji-data).

## Author

Maxime Bertheau, maxime.bertheau@gmail.com

## License

emojidataios is available under the MIT license. See the LICENSE file for more info.


## Available Emojis

Here is a table of the available emojis and their aliases.

| Emoji | Aliases | Emoji | Aliases |
| :---: | ------- | :---: | ------- |
| 👍 👍🏻 👍🏼 👍🏽 👍🏾 👍🏿 | +1 | 👎 👎🏻 👎🏼 👎🏽 👎🏾 👎🏿 | -1 |
| 💯 | 100 | 🔢 | 1234 |
| 🎱 | 8ball | 🅰️ | a |
| 🆎 | ab | 🔤 | abc |
| 🔡 | abcd | 🉑 | accept |
| 🎟️ | admission_tickets | 🧑 🧑🏻 🧑🏼 🧑🏽 🧑🏾 🧑🏿 | adult |
| 🚡 | aerial_tramway | ✈️ | airplane |
| 🛬 | airplane_arriving | 🛫 | airplane_departure |
| ⏰ | alarm_clock | ⚗️ | alembic |
| 👽 | alien | 🚑 | ambulance |
| 🏺 | amphora | ⚓ | anchor |
| 👼 👼🏻 👼🏼 👼🏽 👼🏾 👼🏿 | angel | 💢 | anger |
| 😠 | angry | 😧 | anguished |
| 🐜 | ant | 🍎 | apple |
| ♒ | aquarius | ♈ | aries |
| ◀️ | arrow_backward | ⏬ | arrow_double_down |
| ⏫ | arrow_double_up | ⬇️ | arrow_down |
| 🔽 | arrow_down_small | ▶️ | arrow_forward |
| ⤵️ | arrow_heading_down | ⤴️ | arrow_heading_up |
| ⬅️ | arrow_left | ↙️ | arrow_lower_left |
| ↘️ | arrow_lower_right | ➡️ | arrow_right |
| ↪️ | arrow_right_hook | ⬆️ | arrow_up |
| ↕️ | arrow_up_down | 🔼 | arrow_up_small |
| ↖️ | arrow_upper_left | ↗️ | arrow_upper_right |
| 🔃 | arrows_clockwise | 🔄 | arrows_counterclockwise |
| 🎨 | art | 🚛 | articulated_lorry |
| 😲 | astonished | 👟 | athletic_shoe |
| 🏧 | atm | ⚛️ | atom_symbol |
| 🥑 | avocado | 🅱️ | b |
| 👶 👶🏻 👶🏼 👶🏽 👶🏾 👶🏿 | baby | 🍼 | baby_bottle |
| 🐤 | baby_chick | 🚼 | baby_symbol |
| 🔙 | back | 🥓 | bacon |
| 🏸 | badminton_racquet_and_shuttlecock | 🛄 | baggage_claim |
| 🥖 | baguette_bread | 🎈 | balloon |
| 🗳️ | ballot_box_with_ballot | ☑️ | ballot_box_with_check |
| 🎍 | bamboo | 🍌 | banana |
| ‼️ | bangbang | 🏦 | bank |
| 📊 | bar_chart | 💈 | barber |
| 🌥️ | barely_sunny | ⚾ | baseball |
| 🏀 | basketball | 🦇 | bat |
| 🛀 🛀🏻 🛀🏼 🛀🏽 🛀🏾 🛀🏿 | bath | 🛁 | bathtub |
| 🔋 | battery | 🏖️ | beach_with_umbrella |
| 🐻 | bear | 🧔 🧔🏻 🧔🏼 🧔🏽 🧔🏾 🧔🏿 | bearded_person |
| 🛏️ | bed | 🐝 | bee |
| 🍺 | beer | 🍻 | beers |
| 🐞 | beetle | 🔰 | beginner |
| 🔔 | bell | 🛎️ | bellhop_bell |
| 🍱 | bento | 🚴 🚴🏻 🚴🏼 🚴🏽 🚴🏾 🚴🏿 | bicyclist |
| 🚲 | bike | 👙 | bikini |
| 🧢 | billed_cap | ☣️ | biohazard_sign |
| 🐦 | bird | 🎂 | birthday |
| ⚫ | black_circle | ⏺️ | black_circle_for_record |
| 🖤 | black_heart | 🃏 | black_joker |
| ⬛ | black_large_square | ⏮️ | black_left_pointing_double_triangle_with_vertical_bar |
| ◾ | black_medium_small_square | ◼️ | black_medium_square |
| ✒️ | black_nib | ⏭️ | black_right_pointing_double_triangle_with_vertical_bar |
| ⏯️ | black_right_pointing_triangle_with_double_vertical_bar | ▪️ | black_small_square |
| 🔲 | black_square_button | ⏹️ | black_square_for_stop |
| 👱‍♂️ 👱🏻‍♂️ 👱🏼‍♂️ 👱🏽‍♂️ 👱🏾‍♂️ 👱🏿‍♂️ | blond-haired-man | 👱‍♀️ 👱🏻‍♀️ 👱🏼‍♀️ 👱🏽‍♀️ 👱🏾‍♀️ 👱🏿‍♀️ | blond-haired-woman |
| 🌼 | blossom | 🐡 | blowfish |
| 📘 | blue_book | 🚙 | blue_car |
| 💙 | blue_heart | 😊 | blush |
| 🐗 | boar | ⛵ | boat |
| 💣 | bomb | 📖 | book |
| 🔖 | bookmark | 📑 | bookmark_tabs |
| 📚 | books | 💥 | boom |
| 👢 | boot | 💐 | bouquet |
| 🙇 🙇🏻 🙇🏼 🙇🏽 🙇🏾 🙇🏿 | bow | 🏹 | bow_and_arrow |
| 🥣 | bowl_with_spoon | 🎳 | bowling |
| 🥊 | boxing_glove | 👦 👦🏻 👦🏼 👦🏽 👦🏾 👦🏿 | boy |
| 🧠 | brain | 🍞 | bread |
| 🤱 🤱🏻 🤱🏼 🤱🏽 🤱🏾 🤱🏿 | breast-feeding | 👰 👰🏻 👰🏼 👰🏽 👰🏾 👰🏿 | bride_with_veil |
| 🌉 | bridge_at_night | 💼 | briefcase |
| 🥦 | broccoli | 💔 | broken_heart |
| 🐛 | bug | 🏗️ | building_construction |
| 💡 | bulb | 🚅 | bullettrain_front |
| 🚄 | bullettrain_side | 🌯 | burrito |
| 🚌 | bus | 🚏 | busstop |
| 👤 | bust_in_silhouette | 👥 | busts_in_silhouette |
| 🦋 | butterfly | 🌵 | cactus |
| 🍰 | cake | 📆 | calendar |
| 🤙 🤙🏻 🤙🏼 🤙🏽 🤙🏾 🤙🏿 | call_me_hand | 📲 | calling |
| 🐫 | camel | 📷 | camera |
| 📸 | camera_with_flash | 🏕️ | camping |
| ♋ | cancer | 🕯️ | candle |
| 🍬 | candy | 🥫 | canned_food |
| 🛶 | canoe | 🔠 | capital_abcd |
| ♑ | capricorn | 🚗 | car |
| 🗃️ | card_file_box | 📇 | card_index |
| 🗂️ | card_index_dividers | 🎠 | carousel_horse |
| 🥕 | carrot | 🐱 | cat |
| 🐈 | cat2 | 💿 | cd |
| ⛓️ | chains | 🍾 | champagne |
| 💹 | chart | 📉 | chart_with_downwards_trend |
| 📈 | chart_with_upwards_trend | 🏁 | checkered_flag |
| 🧀 | cheese_wedge | 🍒 | cherries |
| 🌸 | cherry_blossom | 🌰 | chestnut |
| 🐔 | chicken | 🧒 🧒🏻 🧒🏼 🧒🏽 🧒🏾 🧒🏿 | child |
| 🚸 | children_crossing | 🐿️ | chipmunk |
| 🍫 | chocolate_bar | 🥢 | chopsticks |
| 🎄 | christmas_tree | ⛪ | church |
| 🎦 | cinema | 🎪 | circus_tent |
| 🌇 | city_sunrise | 🌆 | city_sunset |
| 🏙️ | cityscape | 🆑 | cl |
| 👏 👏🏻 👏🏼 👏🏽 👏🏾 👏🏿 | clap | 🎬 | clapper |
| 🏛️ | classical_building | 🥂 | clinking_glasses |
| 📋 | clipboard | 🕐 | clock1 |
| 🕙 | clock10 | 🕥 | clock1030 |
| 🕚 | clock11 | 🕦 | clock1130 |
| 🕛 | clock12 | 🕧 | clock1230 |
| 🕜 | clock130 | 🕑 | clock2 |
| 🕝 | clock230 | 🕒 | clock3 |
| 🕞 | clock330 | 🕓 | clock4 |
| 🕟 | clock430 | 🕔 | clock5 |
| 🕠 | clock530 | 🕕 | clock6 |
| 🕡 | clock630 | 🕖 | clock7 |
| 🕢 | clock730 | 🕗 | clock8 |
| 🕣 | clock830 | 🕘 | clock9 |
| 🕤 | clock930 | 📕 | closed_book |
| 🔐 | closed_lock_with_key | 🌂 | closed_umbrella |
| ☁️ | cloud | 🤡 | clown_face |
| ♣️ | clubs | 🇨🇳 | cn |
| 🧥 | coat | 🍸 | cocktail |
| 🥥 | coconut | ☕ | coffee |
| ⚰️ | coffin | 😰 | cold_sweat |
| 💥 | collision | ☄️ | comet |
| 🗜️ | compression | 💻 | computer |
| 🎊 | confetti_ball | 😖 | confounded |
| 😕 | confused | ㊗️ | congratulations |
| 🚧 | construction | 👷 👷🏻 👷🏼 👷🏽 👷🏾 👷🏿 | construction_worker |
| 🎛️ | control_knobs | 🏪 | convenience_store |
| 🍪 | cookie | 🍳 | cooking |
| 🆒 | cool | 👮 👮🏻 👮🏼 👮🏽 👮🏾 👮🏿 | cop |
| ©️ | copyright | 🌽 | corn |
| 🛋️ | couch_and_lamp | 👫 | couple |
| 💑 | couple_with_heart | 💏 | couplekiss |
| 🐮 | cow | 🐄 | cow2 |
| 🦀 | crab | 💳 | credit_card |
| 🌙 | crescent_moon | 🦗 | cricket |
| 🏏 | cricket_bat_and_ball | 🐊 | crocodile |
| 🥐 | croissant | 🤞 🤞🏻 🤞🏼 🤞🏽 🤞🏾 🤞🏿 | crossed_fingers |
| 🎌 | crossed_flags | ⚔️ | crossed_swords |
| 👑 | crown | 😢 | cry |
| 😿 | crying_cat_face | 🔮 | crystal_ball |
| 🥒 | cucumber | 🥤 | cup_with_straw |
| 💘 | cupid | 🥌 | curling_stone |
| ➰ | curly_loop | 💱 | currency_exchange |
| 🍛 | curry | 🍮 | custard |
| 🛃 | customs | 🥩 | cut_of_meat |
| 🌀 | cyclone | 🗡️ | dagger_knife |
| 💃 💃🏻 💃🏼 💃🏽 💃🏾 💃🏿 | dancer | 👯 | dancers |
| 🍡 | dango | 🕶️ | dark_sunglasses |
| 🎯 | dart | 💨 | dash |
| 📅 | date | 🇩🇪 | de |
| 🌳 | deciduous_tree | 🦌 | deer |
| 🏬 | department_store | 🏚️ | derelict_house_building |
| 🏜️ | desert | 🏝️ | desert_island |
| 🖥️ | desktop_computer | 💠 | diamond_shape_with_a_dot_inside |
| ♦️ | diamonds | 😞 | disappointed |
| 😥 | disappointed_relieved | 💫 | dizzy |
| 😵 | dizzy_face | 🚯 | do_not_litter |
| 🐶 | dog | 🐕 | dog2 |
| 💵 | dollar | 🎎 | dolls |
| 🐬 | dolphin | 🚪 | door |
| ⏸️ | double_vertical_bar | 🍩 | doughnut |
| 🕊️ | dove_of_peace | 🐉 | dragon |
| 🐲 | dragon_face | 👗 | dress |
| 🐪 | dromedary_camel | 🤤 | drooling_face |
| 💧 | droplet | 🥁 | drum_with_drumsticks |
| 🦆 | duck | 🥟 | dumpling |
| 📀 | dvd | 📧 | e-mail |
| 🦅 | eagle | 👂 👂🏻 👂🏼 👂🏽 👂🏾 👂🏿 | ear |
| 🌾 | ear_of_rice | 🌍 | earth_africa |
| 🌎 | earth_americas | 🌏 | earth_asia |
| 🥚 | egg | 🍆 | eggplant |
| 8️⃣ | eight | ✴️ | eight_pointed_black_star |
| ✳️ | eight_spoked_asterisk | ⏏️ | eject |
| 🔌 | electric_plug | 🐘 | elephant |
| 🧝 🧝🏻 🧝🏼 🧝🏽 🧝🏾 🧝🏿 | elf | ✉️ | email |
| 🔚 | end | ✉️ | envelope |
| 📩 | envelope_with_arrow | 🇪🇸 | es |
| 💶 | euro | 🏰 | european_castle |
| 🏤 | european_post_office | 🌲 | evergreen_tree |
| ❗ | exclamation | 🤯 | exploding_head |
| 😑 | expressionless | 👁️ | eye |
| 👁️‍🗨️ | eye-in-speech-bubble | 👓 | eyeglasses |
| 👀 | eyes | 🤦 🤦🏻 🤦🏼 🤦🏽 🤦🏾 🤦🏿 | face_palm |
| 🤮 | face_vomiting | 🤠 | face_with_cowboy_hat |
| 🤫 | face_with_finger_covering_closed_lips | 🤭 | face_with_hand_over_mouth |
| 🤕 | face_with_head_bandage | 🧐 | face_with_monocle |
| 🤨 | face_with_one_eyebrow_raised | 🤮 | face_with_open_mouth_vomiting |
| 🤨 | face_with_raised_eyebrow | 🙄 | face_with_rolling_eyes |
| 🤬 | face_with_symbols_on_mouth | 🤒 | face_with_thermometer |
| 👊 👊🏻 👊🏼 👊🏽 👊🏾 👊🏿 | facepunch | 🏭 | factory |
| 🧚 🧚🏻 🧚🏼 🧚🏽 🧚🏾 🧚🏿 | fairy | 🍂 | fallen_leaf |
| 👨‍👩‍👦 | family | 👪 | family |
| ⏩ | fast_forward | 📠 | fax |
| 😨 | fearful | 🐾 | feet |
| 👩‍🎨 👩🏻‍🎨 👩🏼‍🎨 👩🏽‍🎨 👩🏾‍🎨 👩🏿‍🎨 | female-artist | 👩‍🚀 👩🏻‍🚀 👩🏼‍🚀 👩🏽‍🚀 👩🏾‍🚀 👩🏿‍🚀 | female-astronaut |
| 👷‍♀️ 👷🏻‍♀️ 👷🏼‍♀️ 👷🏽‍♀️ 👷🏾‍♀️ 👷🏿‍♀️ | female-construction-worker | 👩‍🍳 👩🏻‍🍳 👩🏼‍🍳 👩🏽‍🍳 👩🏾‍🍳 👩🏿‍🍳 | female-cook |
| 🕵️‍♀️ 🕵🏻‍♀️ 🕵🏼‍♀️ 🕵🏽‍♀️ 🕵🏾‍♀️ 🕵🏿‍♀️ | female-detective | 👩‍⚕️ 👩🏻‍⚕️ 👩🏼‍⚕️ 👩🏽‍⚕️ 👩🏾‍⚕️ 👩🏿‍⚕️ | female-doctor |
| 👩‍🏭 👩🏻‍🏭 👩🏼‍🏭 👩🏽‍🏭 👩🏾‍🏭 👩🏿‍🏭 | female-factory-worker | 👩‍🌾 👩🏻‍🌾 👩🏼‍🌾 👩🏽‍🌾 👩🏾‍🌾 👩🏿‍🌾 | female-farmer |
| 👩‍🚒 👩🏻‍🚒 👩🏼‍🚒 👩🏽‍🚒 👩🏾‍🚒 👩🏿‍🚒 | female-firefighter | 💂‍♀️ 💂🏻‍♀️ 💂🏼‍♀️ 💂🏽‍♀️ 💂🏾‍♀️ 💂🏿‍♀️ | female-guard |
| 👩‍⚖️ 👩🏻‍⚖️ 👩🏼‍⚖️ 👩🏽‍⚖️ 👩🏾‍⚖️ 👩🏿‍⚖️ | female-judge | 👩‍🔧 👩🏻‍🔧 👩🏼‍🔧 👩🏽‍🔧 👩🏾‍🔧 👩🏿‍🔧 | female-mechanic |
| 👩‍💼 👩🏻‍💼 👩🏼‍💼 👩🏽‍💼 👩🏾‍💼 👩🏿‍💼 | female-office-worker | 👩‍✈️ 👩🏻‍✈️ 👩🏼‍✈️ 👩🏽‍✈️ 👩🏾‍✈️ 👩🏿‍✈️ | female-pilot |
| 👮‍♀️ 👮🏻‍♀️ 👮🏼‍♀️ 👮🏽‍♀️ 👮🏾‍♀️ 👮🏿‍♀️ | female-police-officer | 👩‍🔬 👩🏻‍🔬 👩🏼‍🔬 👩🏽‍🔬 👩🏾‍🔬 👩🏿‍🔬 | female-scientist |
| 👩‍🎤 👩🏻‍🎤 👩🏼‍🎤 👩🏽‍🎤 👩🏾‍🎤 👩🏿‍🎤 | female-singer | 👩‍🎓 👩🏻‍🎓 👩🏼‍🎓 👩🏽‍🎓 👩🏾‍🎓 👩🏿‍🎓 | female-student |
| 👩‍🏫 👩🏻‍🏫 👩🏼‍🏫 👩🏽‍🏫 👩🏾‍🏫 👩🏿‍🏫 | female-teacher | 👩‍💻 👩🏻‍💻 👩🏼‍💻 👩🏽‍💻 👩🏾‍💻 👩🏿‍💻 | female-technologist |
| 🧝‍♀️ 🧝🏻‍♀️ 🧝🏼‍♀️ 🧝🏽‍♀️ 🧝🏾‍♀️ 🧝🏿‍♀️ | female_elf | 🧚‍♀️ 🧚🏻‍♀️ 🧚🏼‍♀️ 🧚🏽‍♀️ 🧚🏾‍♀️ 🧚🏿‍♀️ | female_fairy |
| 🧞‍♀️ | female_genie | 🧙‍♀️ 🧙🏻‍♀️ 🧙🏼‍♀️ 🧙🏽‍♀️ 🧙🏾‍♀️ 🧙🏿‍♀️ | female_mage |
| ♀️ | female_sign | 🧛‍♀️ 🧛🏻‍♀️ 🧛🏼‍♀️ 🧛🏽‍♀️ 🧛🏾‍♀️ 🧛🏿‍♀️ | female_vampire |
| 🧟‍♀️ | female_zombie | 🤺 | fencer |
| 🎡 | ferris_wheel | ⛴️ | ferry |
| 🏑 | field_hockey_stick_and_ball | 🗄️ | file_cabinet |
| 📁 | file_folder | 🎞️ | film_frames |
| 📽️ | film_projector | 🔥 | fire |
| 🚒 | fire_engine | 🎆 | fireworks |
| 🥇 | first_place_medal | 🌓 | first_quarter_moon |
| 🌛 | first_quarter_moon_with_face | 🐟 | fish |
| 🍥 | fish_cake | 🎣 | fishing_pole_and_fish |
| ✊ ✊🏻 ✊🏼 ✊🏽 ✊🏾 ✊🏿 | fist | 5️⃣ | five |
| 🇦🇨 | flag-ac | 🇦🇩 | flag-ad |
| 🇦🇪 | flag-ae | 🇦🇫 | flag-af |
| 🇦🇬 | flag-ag | 🇦🇮 | flag-ai |
| 🇦🇱 | flag-al | 🇦🇲 | flag-am |
| 🇦🇴 | flag-ao | 🇦🇶 | flag-aq |
| 🇦🇷 | flag-ar | 🇦🇸 | flag-as |
| 🇦🇹 | flag-at | 🇦🇺 | flag-au |
| 🇦🇼 | flag-aw | 🇦🇽 | flag-ax |
| 🇦🇿 | flag-az | 🇧🇦 | flag-ba |
| 🇧🇧 | flag-bb | 🇧🇩 | flag-bd |
| 🇧🇪 | flag-be | 🇧🇫 | flag-bf |
| 🇧🇬 | flag-bg | 🇧🇭 | flag-bh |
| 🇧🇮 | flag-bi | 🇧🇯 | flag-bj |
| 🇧🇱 | flag-bl | 🇧🇲 | flag-bm |
| 🇧🇳 | flag-bn | 🇧🇴 | flag-bo |
| 🇧🇶 | flag-bq | 🇧🇷 | flag-br |
| 🇧🇸 | flag-bs | 🇧🇹 | flag-bt |
| 🇧🇻 | flag-bv | 🇧🇼 | flag-bw |
| 🇧🇾 | flag-by | 🇧🇿 | flag-bz |
| 🇨🇦 | flag-ca | 🇨🇨 | flag-cc |
| 🇨🇩 | flag-cd | 🇨🇫 | flag-cf |
| 🇨🇬 | flag-cg | 🇨🇭 | flag-ch |
| 🇨🇮 | flag-ci | 🇨🇰 | flag-ck |
| 🇨🇱 | flag-cl | 🇨🇲 | flag-cm |
| 🇨🇳 | flag-cn | 🇨🇴 | flag-co |
| 🇨🇵 | flag-cp | 🇨🇷 | flag-cr |
| 🇨🇺 | flag-cu | 🇨🇻 | flag-cv |
| 🇨🇼 | flag-cw | 🇨🇽 | flag-cx |
| 🇨🇾 | flag-cy | 🇨🇿 | flag-cz |
| 🇩🇪 | flag-de | 🇩🇬 | flag-dg |
| 🇩🇯 | flag-dj | 🇩🇰 | flag-dk |
| 🇩🇲 | flag-dm | 🇩🇴 | flag-do |
| 🇩🇿 | flag-dz | 🇪🇦 | flag-ea |
| 🇪🇨 | flag-ec | 🇪🇪 | flag-ee |
| 🇪🇬 | flag-eg | 🇪🇭 | flag-eh |
| 🏴󠁧󠁢󠁥󠁮󠁧󠁿 | flag-england | 🇪🇷 | flag-er |
| 🇪🇸 | flag-es | 🇪🇹 | flag-et |
| 🇪🇺 | flag-eu | 🇫🇮 | flag-fi |
| 🇫🇯 | flag-fj | 🇫🇰 | flag-fk |
| 🇫🇲 | flag-fm | 🇫🇴 | flag-fo |
| 🇫🇷 | flag-fr | 🇬🇦 | flag-ga |
| 🇬🇧 | flag-gb | 🇬🇩 | flag-gd |
| 🇬🇪 | flag-ge | 🇬🇫 | flag-gf |
| 🇬🇬 | flag-gg | 🇬🇭 | flag-gh |
| 🇬🇮 | flag-gi | 🇬🇱 | flag-gl |
| 🇬🇲 | flag-gm | 🇬🇳 | flag-gn |
| 🇬🇵 | flag-gp | 🇬🇶 | flag-gq |
| 🇬🇷 | flag-gr | 🇬🇸 | flag-gs |
| 🇬🇹 | flag-gt | 🇬🇺 | flag-gu |
| 🇬🇼 | flag-gw | 🇬🇾 | flag-gy |
| 🇭🇰 | flag-hk | 🇭🇲 | flag-hm |
| 🇭🇳 | flag-hn | 🇭🇷 | flag-hr |
| 🇭🇹 | flag-ht | 🇭🇺 | flag-hu |
| 🇮🇨 | flag-ic | 🇮🇩 | flag-id |
| 🇮🇪 | flag-ie | 🇮🇱 | flag-il |
| 🇮🇲 | flag-im | 🇮🇳 | flag-in |
| 🇮🇴 | flag-io | 🇮🇶 | flag-iq |
| 🇮🇷 | flag-ir | 🇮🇸 | flag-is |
| 🇮🇹 | flag-it | 🇯🇪 | flag-je |
| 🇯🇲 | flag-jm | 🇯🇴 | flag-jo |
| 🇯🇵 | flag-jp | 🇰🇪 | flag-ke |
| 🇰🇬 | flag-kg | 🇰🇭 | flag-kh |
| 🇰🇮 | flag-ki | 🇰🇲 | flag-km |
| 🇰🇳 | flag-kn | 🇰🇵 | flag-kp |
| 🇰🇷 | flag-kr | 🇰🇼 | flag-kw |
| 🇰🇾 | flag-ky | 🇰🇿 | flag-kz |
| 🇱🇦 | flag-la | 🇱🇧 | flag-lb |
| 🇱🇨 | flag-lc | 🇱🇮 | flag-li |
| 🇱🇰 | flag-lk | 🇱🇷 | flag-lr |
| 🇱🇸 | flag-ls | 🇱🇹 | flag-lt |
| 🇱🇺 | flag-lu | 🇱🇻 | flag-lv |
| 🇱🇾 | flag-ly | 🇲🇦 | flag-ma |
| 🇲🇨 | flag-mc | 🇲🇩 | flag-md |
| 🇲🇪 | flag-me | 🇲🇫 | flag-mf |
| 🇲🇬 | flag-mg | 🇲🇭 | flag-mh |
| 🇲🇰 | flag-mk | 🇲🇱 | flag-ml |
| 🇲🇲 | flag-mm | 🇲🇳 | flag-mn |
| 🇲🇴 | flag-mo | 🇲🇵 | flag-mp |
| 🇲🇶 | flag-mq | 🇲🇷 | flag-mr |
| 🇲🇸 | flag-ms | 🇲🇹 | flag-mt |
| 🇲🇺 | flag-mu | 🇲🇻 | flag-mv |
| 🇲🇼 | flag-mw | 🇲🇽 | flag-mx |
| 🇲🇾 | flag-my | 🇲🇿 | flag-mz |
| 🇳🇦 | flag-na | 🇳🇨 | flag-nc |
| 🇳🇪 | flag-ne | 🇳🇫 | flag-nf |
| 🇳🇬 | flag-ng | 🇳🇮 | flag-ni |
| 🇳🇱 | flag-nl | 🇳🇴 | flag-no |
| 🇳🇵 | flag-np | 🇳🇷 | flag-nr |
| 🇳🇺 | flag-nu | 🇳🇿 | flag-nz |
| 🇴🇲 | flag-om | 🇵🇦 | flag-pa |
| 🇵🇪 | flag-pe | 🇵🇫 | flag-pf |
| 🇵🇬 | flag-pg | 🇵🇭 | flag-ph |
| 🇵🇰 | flag-pk | 🇵🇱 | flag-pl |
| 🇵🇲 | flag-pm | 🇵🇳 | flag-pn |
| 🇵🇷 | flag-pr | 🇵🇸 | flag-ps |
| 🇵🇹 | flag-pt | 🇵🇼 | flag-pw |
| 🇵🇾 | flag-py | 🇶🇦 | flag-qa |
| 🇷🇪 | flag-re | 🇷🇴 | flag-ro |
| 🇷🇸 | flag-rs | 🇷🇺 | flag-ru |
| 🇷🇼 | flag-rw | 🇸🇦 | flag-sa |
| 🇸🇧 | flag-sb | 🇸🇨 | flag-sc |
| 🏴󠁧󠁢󠁳󠁣󠁴󠁿 | flag-scotland | 🇸🇩 | flag-sd |
| 🇸🇪 | flag-se | 🇸🇬 | flag-sg |
| 🇸🇭 | flag-sh | 🇸🇮 | flag-si |
| 🇸🇯 | flag-sj | 🇸🇰 | flag-sk |
| 🇸🇱 | flag-sl | 🇸🇲 | flag-sm |
| 🇸🇳 | flag-sn | 🇸🇴 | flag-so |
| 🇸🇷 | flag-sr | 🇸🇸 | flag-ss |
| 🇸🇹 | flag-st | 🇸🇻 | flag-sv |
| 🇸🇽 | flag-sx | 🇸🇾 | flag-sy |
| 🇸🇿 | flag-sz | 🇹🇦 | flag-ta |
| 🇹🇨 | flag-tc | 🇹🇩 | flag-td |
| 🇹🇫 | flag-tf | 🇹🇬 | flag-tg |
| 🇹🇭 | flag-th | 🇹🇯 | flag-tj |
| 🇹🇰 | flag-tk | 🇹🇱 | flag-tl |
| 🇹🇲 | flag-tm | 🇹🇳 | flag-tn |
| 🇹🇴 | flag-to | 🇹🇷 | flag-tr |
| 🇹🇹 | flag-tt | 🇹🇻 | flag-tv |
| 🇹🇼 | flag-tw | 🇹🇿 | flag-tz |
| 🇺🇦 | flag-ua | 🇺🇬 | flag-ug |
| 🇺🇲 | flag-um | 🇺🇳 | flag-un |
| 🇺🇸 | flag-us | 🇺🇾 | flag-uy |
| 🇺🇿 | flag-uz | 🇻🇦 | flag-va |
| 🇻🇨 | flag-vc | 🇻🇪 | flag-ve |
| 🇻🇬 | flag-vg | 🇻🇮 | flag-vi |
| 🇻🇳 | flag-vn | 🇻🇺 | flag-vu |
| 🏴󠁧󠁢󠁷󠁬󠁳󠁿 | flag-wales | 🇼🇫 | flag-wf |
| 🇼🇸 | flag-ws | 🇽🇰 | flag-xk |
| 🇾🇪 | flag-ye | 🇾🇹 | flag-yt |
| 🇿🇦 | flag-za | 🇿🇲 | flag-zm |
| 🇿🇼 | flag-zw | 🎏 | flags |
| 🔦 | flashlight | ⚜️ | fleur_de_lis |
| 🐬 | flipper | 💾 | floppy_disk |
| 🎴 | flower_playing_cards | 😳 | flushed |
| 🛸 | flying_saucer | 🌫️ | fog |
| 🌁 | foggy | 🏈 | football |
| 👣 | footprints | 🍴 | fork_and_knife |
| 🥠 | fortune_cookie | ⛲ | fountain |
| 4️⃣ | four | 🍀 | four_leaf_clover |
| 🦊 | fox_face | 🇫🇷 | fr |
| 🖼️ | frame_with_picture | 🆓 | free |
| 🍳 | fried_egg | 🍤 | fried_shrimp |
| 🍟 | fries | 🐸 | frog |
| 😦 | frowning | ⛽ | fuelpump |
| 🌕 | full_moon | 🌝 | full_moon_with_face |
| ⚱️ | funeral_urn | 🎲 | game_die |
| 🇬🇧 | gb | ⚙️ | gear |
| 💎 | gem | ♊ | gemini |
| 🧞 | genie | 👻 | ghost |
| 🎁 | gift | 💝 | gift_heart |
| 🦒 | giraffe_face | 👧 👧🏻 👧🏼 👧🏽 👧🏾 👧🏿 | girl |
| 🥛 | glass_of_milk | 🌐 | globe_with_meridians |
| 🧤 | gloves | 🥅 | goal_net |
| 🐐 | goat | ⛳ | golf |
| 🏌️ 🏌🏻 🏌🏼 🏌🏽 🏌🏾 🏌🏿 | golfer | 🦍 | gorilla |
| 🍇 | grapes | 🍏 | green_apple |
| 📗 | green_book | 💚 | green_heart |
| 🥗 | green_salad | ❕ | grey_exclamation |
| ❔ | grey_question | 😬 | grimacing |
| 😁 | grin | 😀 | grinning |
| 🤪 | grinning_face_with_one_large_and_one_small_eye | 🤩 | grinning_face_with_star_eyes |
| 💂 💂🏻 💂🏼 💂🏽 💂🏾 💂🏿 | guardsman | 🎸 | guitar |
| 🔫 | gun | 💇 💇🏻 💇🏼 💇🏽 💇🏾 💇🏿 | haircut |
| 🍔 | hamburger | 🔨 | hammer |
| ⚒️ | hammer_and_pick | 🛠️ | hammer_and_wrench |
| 🐹 | hamster | ✋ ✋🏻 ✋🏼 ✋🏽 ✋🏾 ✋🏿 | hand |
| 🤞 🤞🏻 🤞🏼 🤞🏽 🤞🏾 🤞🏿 | hand_with_index_and_middle_fingers_crossed | 👜 | handbag |
| 🤾 🤾🏻 🤾🏼 🤾🏽 🤾🏾 🤾🏿 | handball | 🤝 | handshake |
| 💩 | hankey | #️⃣ | hash |
| 🐥 | hatched_chick | 🐣 | hatching_chick |
| 🎧 | headphones | 🙉 | hear_no_evil |
| ❤️ | heart | 💟 | heart_decoration |
| 😍 | heart_eyes | 😻 | heart_eyes_cat |
| 💓 | heartbeat | 💗 | heartpulse |
| ♥️ | hearts | ✔️ | heavy_check_mark |
| ➗ | heavy_division_sign | 💲 | heavy_dollar_sign |
| ❗ | heavy_exclamation_mark | ❣️ | heavy_heart_exclamation_mark_ornament |
| ➖ | heavy_minus_sign | ✖️ | heavy_multiplication_x |
| ➕ | heavy_plus_sign | 🦔 | hedgehog |
| 🚁 | helicopter | ⛑️ | helmet_with_white_cross |
| 🌿 | herb | 🌺 | hibiscus |
| 🔆 | high_brightness | 👠 | high_heel |
| 🔪 | hocho | 🕳️ | hole |
| 🍯 | honey_pot | 🐝 | honeybee |
| 🐴 | horse | 🏇 🏇🏻 🏇🏼 🏇🏽 🏇🏾 🏇🏿 | horse_racing |
| 🏥 | hospital | 🌶️ | hot_pepper |
| 🌭 | hotdog | 🏨 | hotel |
| ♨️ | hotsprings | ⌛ | hourglass |
| ⏳ | hourglass_flowing_sand | 🏠 | house |
| 🏘️ | house_buildings | 🏡 | house_with_garden |
| 🤗 | hugging_face | 😯 | hushed |
| 🤟 🤟🏻 🤟🏼 🤟🏽 🤟🏾 🤟🏿 | i_love_you_hand_sign | 🍨 | ice_cream |
| 🏒 | ice_hockey_stick_and_puck | ⛸️ | ice_skate |
| 🍦 | icecream | 🆔 | id |
| 🉐 | ideograph_advantage | 👿 | imp |
| 📥 | inbox_tray | 📨 | incoming_envelope |
| 💁 💁🏻 💁🏼 💁🏽 💁🏾 💁🏿 | information_desk_person | ℹ️ | information_source |
| 😇 | innocent | ⁉️ | interrobang |
| 📱 | iphone | 🇮🇹 | it |
| 🏮 | izakaya_lantern | 🎃 | jack_o_lantern |
| 🗾 | japan | 🏯 | japanese_castle |
| 👺 | japanese_goblin | 👹 | japanese_ogre |
| 👖 | jeans | 😂 | joy |
| 😹 | joy_cat | 🕹️ | joystick |
| 🇯🇵 | jp | 🤹 🤹🏻 🤹🏼 🤹🏽 🤹🏾 🤹🏿 | juggling |
| 🕋 | kaaba | 🔑 | key |
| ⌨️ | keyboard | *️⃣ | keycap_star |
| 🔟 | keycap_ten | 👘 | kimono |
| 💋 | kiss | 😗 | kissing |
| 😽 | kissing_cat | 😚 | kissing_closed_eyes |
| 😘 | kissing_heart | 😙 | kissing_smiling_eyes |
| 🥝 | kiwifruit | 🔪 | knife |
| 🍽️ | knife_fork_plate | 🐨 | koala |
| 🈁 | koko | 🇰🇷 | kr |
| 🏷️ | label | 🏮 | lantern |
| 🔵 | large_blue_circle | 🔷 | large_blue_diamond |
| 🔶 | large_orange_diamond | 🌗 | last_quarter_moon |
| 🌜 | last_quarter_moon_with_face | ✝️ | latin_cross |
| 😆 | laughing | 🍃 | leaves |
| 📒 | ledger | 🤛 🤛🏻 🤛🏼 🤛🏽 🤛🏾 🤛🏿 | left-facing_fist |
| 🛅 | left_luggage | ↔️ | left_right_arrow |
| 🗨️ | left_speech_bubble | ↩️ | leftwards_arrow_with_hook |
| 🍋 | lemon | ♌ | leo |
| 🐆 | leopard | 🎚️ | level_slider |
| ♎ | libra | 🚈 | light_rail |
| 🌩️ | lightning | 🌩️ | lightning_cloud |
| 🔗 | link | 🖇️ | linked_paperclips |
| 🦁 | lion_face | 👄 | lips |
| 💄 | lipstick | 🦎 | lizard |
| 🔒 | lock | 🔏 | lock_with_ink_pen |
| 🍭 | lollipop | ➿ | loop |
| 🔊 | loud_sound | 📢 | loudspeaker |
| 🏩 | love_hotel | 💌 | love_letter |
| 🔅 | low_brightness | 🖊️ | lower_left_ballpoint_pen |
| 🖍️ | lower_left_crayon | 🖋️ | lower_left_fountain_pen |
| 🖌️ | lower_left_paintbrush | 🤥 | lying_face |
| Ⓜ️ | m | 🔍 | mag |
| 🔎 | mag_right | 🧙 🧙🏻 🧙🏼 🧙🏽 🧙🏾 🧙🏿 | mage |
| 🀄 | mahjong | 📫 | mailbox |
| 📪 | mailbox_closed | 📬 | mailbox_with_mail |
| 📭 | mailbox_with_no_mail | 👨‍🎨 👨🏻‍🎨 👨🏼‍🎨 👨🏽‍🎨 👨🏾‍🎨 👨🏿‍🎨 | male-artist |
| 👨‍🚀 👨🏻‍🚀 👨🏼‍🚀 👨🏽‍🚀 👨🏾‍🚀 👨🏿‍🚀 | male-astronaut | 👷‍♂️ 👷🏻‍♂️ 👷🏼‍♂️ 👷🏽‍♂️ 👷🏾‍♂️ 👷🏿‍♂️ | male-construction-worker |
| 👨‍🍳 👨🏻‍🍳 👨🏼‍🍳 👨🏽‍🍳 👨🏾‍🍳 👨🏿‍🍳 | male-cook | 🕵️‍♂️ 🕵🏻‍♂️ 🕵🏼‍♂️ 🕵🏽‍♂️ 🕵🏾‍♂️ 🕵🏿‍♂️ | male-detective |
| 👨‍⚕️ 👨🏻‍⚕️ 👨🏼‍⚕️ 👨🏽‍⚕️ 👨🏾‍⚕️ 👨🏿‍⚕️ | male-doctor | 👨‍🏭 👨🏻‍🏭 👨🏼‍🏭 👨🏽‍🏭 👨🏾‍🏭 👨🏿‍🏭 | male-factory-worker |
| 👨‍🌾 👨🏻‍🌾 👨🏼‍🌾 👨🏽‍🌾 👨🏾‍🌾 👨🏿‍🌾 | male-farmer | 👨‍🚒 👨🏻‍🚒 👨🏼‍🚒 👨🏽‍🚒 👨🏾‍🚒 👨🏿‍🚒 | male-firefighter |
| 💂‍♂️ 💂🏻‍♂️ 💂🏼‍♂️ 💂🏽‍♂️ 💂🏾‍♂️ 💂🏿‍♂️ | male-guard | 👨‍⚖️ 👨🏻‍⚖️ 👨🏼‍⚖️ 👨🏽‍⚖️ 👨🏾‍⚖️ 👨🏿‍⚖️ | male-judge |
| 👨‍🔧 👨🏻‍🔧 👨🏼‍🔧 👨🏽‍🔧 👨🏾‍🔧 👨🏿‍🔧 | male-mechanic | 👨‍💼 👨🏻‍💼 👨🏼‍💼 👨🏽‍💼 👨🏾‍💼 👨🏿‍💼 | male-office-worker |
| 👨‍✈️ 👨🏻‍✈️ 👨🏼‍✈️ 👨🏽‍✈️ 👨🏾‍✈️ 👨🏿‍✈️ | male-pilot | 👮‍♂️ 👮🏻‍♂️ 👮🏼‍♂️ 👮🏽‍♂️ 👮🏾‍♂️ 👮🏿‍♂️ | male-police-officer |
| 👨‍🔬 👨🏻‍🔬 👨🏼‍🔬 👨🏽‍🔬 👨🏾‍🔬 👨🏿‍🔬 | male-scientist | 👨‍🎤 👨🏻‍🎤 👨🏼‍🎤 👨🏽‍🎤 👨🏾‍🎤 👨🏿‍🎤 | male-singer |
| 👨‍🎓 👨🏻‍🎓 👨🏼‍🎓 👨🏽‍🎓 👨🏾‍🎓 👨🏿‍🎓 | male-student | 👨‍🏫 👨🏻‍🏫 👨🏼‍🏫 👨🏽‍🏫 👨🏾‍🏫 👨🏿‍🏫 | male-teacher |
| 👨‍💻 👨🏻‍💻 👨🏼‍💻 👨🏽‍💻 👨🏾‍💻 👨🏿‍💻 | male-technologist | 🧝‍♂️ 🧝🏻‍♂️ 🧝🏼‍♂️ 🧝🏽‍♂️ 🧝🏾‍♂️ 🧝🏿‍♂️ | male_elf |
| 🧚‍♂️ 🧚🏻‍♂️ 🧚🏼‍♂️ 🧚🏽‍♂️ 🧚🏾‍♂️ 🧚🏿‍♂️ | male_fairy | 🧞‍♂️ | male_genie |
| 🧙‍♂️ 🧙🏻‍♂️ 🧙🏼‍♂️ 🧙🏽‍♂️ 🧙🏾‍♂️ 🧙🏿‍♂️ | male_mage | ♂️ | male_sign |
| 🧛‍♂️ 🧛🏻‍♂️ 🧛🏼‍♂️ 🧛🏽‍♂️ 🧛🏾‍♂️ 🧛🏿‍♂️ | male_vampire | 🧟‍♂️ | male_zombie |
| 👨 👨🏻 👨🏼 👨🏽 👨🏾 👨🏿 | man | 🚴‍♂️ 🚴🏻‍♂️ 🚴🏼‍♂️ 🚴🏽‍♂️ 🚴🏾‍♂️ 🚴🏿‍♂️ | man-biking |
| ⛹️‍♂️ ⛹🏻‍♂️ ⛹🏼‍♂️ ⛹🏽‍♂️ ⛹🏾‍♂️ ⛹🏿‍♂️ | man-bouncing-ball | 🙇‍♂️ 🙇🏻‍♂️ 🙇🏼‍♂️ 🙇🏽‍♂️ 🙇🏾‍♂️ 🙇🏿‍♂️ | man-bowing |
| 👨‍👦 | man-boy | 👨‍👦‍👦 | man-boy-boy |
| 🤸‍♂️ 🤸🏻‍♂️ 🤸🏼‍♂️ 🤸🏽‍♂️ 🤸🏾‍♂️ 🤸🏿‍♂️ | man-cartwheeling | 🤦‍♂️ 🤦🏻‍♂️ 🤦🏼‍♂️ 🤦🏽‍♂️ 🤦🏾‍♂️ 🤦🏿‍♂️ | man-facepalming |
| 🙍‍♂️ 🙍🏻‍♂️ 🙍🏼‍♂️ 🙍🏽‍♂️ 🙍🏾‍♂️ 🙍🏿‍♂️ | man-frowning | 🙅‍♂️ 🙅🏻‍♂️ 🙅🏼‍♂️ 🙅🏽‍♂️ 🙅🏾‍♂️ 🙅🏿‍♂️ | man-gesturing-no |
| 🙆‍♂️ 🙆🏻‍♂️ 🙆🏼‍♂️ 🙆🏽‍♂️ 🙆🏾‍♂️ 🙆🏿‍♂️ | man-gesturing-ok | 💇‍♂️ 💇🏻‍♂️ 💇🏼‍♂️ 💇🏽‍♂️ 💇🏾‍♂️ 💇🏿‍♂️ | man-getting-haircut |
| 💆‍♂️ 💆🏻‍♂️ 💆🏼‍♂️ 💆🏽‍♂️ 💆🏾‍♂️ 💆🏿‍♂️ | man-getting-massage | 👨‍👧 | man-girl |
| 👨‍👧‍👦 | man-girl-boy | 👨‍👧‍👧 | man-girl-girl |
| 🏌️‍♂️ 🏌🏻‍♂️ 🏌🏼‍♂️ 🏌🏽‍♂️ 🏌🏾‍♂️ 🏌🏿‍♂️ | man-golfing | 👨‍❤️‍👨 | man-heart-man |
| 🤹‍♂️ 🤹🏻‍♂️ 🤹🏼‍♂️ 🤹🏽‍♂️ 🤹🏾‍♂️ 🤹🏿‍♂️ | man-juggling | 👨‍❤️‍💋‍👨 | man-kiss-man |
| 🏋️‍♂️ 🏋🏻‍♂️ 🏋🏼‍♂️ 🏋🏽‍♂️ 🏋🏾‍♂️ 🏋🏿‍♂️ | man-lifting-weights | 👨‍👨‍👦 | man-man-boy |
| 👨‍👨‍👦‍👦 | man-man-boy-boy | 👨‍👨‍👧 | man-man-girl |
| 👨‍👨‍👧‍👦 | man-man-girl-boy | 👨‍👨‍👧‍👧 | man-man-girl-girl |
| 🚵‍♂️ 🚵🏻‍♂️ 🚵🏼‍♂️ 🚵🏽‍♂️ 🚵🏾‍♂️ 🚵🏿‍♂️ | man-mountain-biking | 🤾‍♂️ 🤾🏻‍♂️ 🤾🏼‍♂️ 🤾🏽‍♂️ 🤾🏾‍♂️ 🤾🏿‍♂️ | man-playing-handball |
| 🤽‍♂️ 🤽🏻‍♂️ 🤽🏼‍♂️ 🤽🏽‍♂️ 🤽🏾‍♂️ 🤽🏿‍♂️ | man-playing-water-polo | 🙎‍♂️ 🙎🏻‍♂️ 🙎🏼‍♂️ 🙎🏽‍♂️ 🙎🏾‍♂️ 🙎🏿‍♂️ | man-pouting |
| 🙋‍♂️ 🙋🏻‍♂️ 🙋🏼‍♂️ 🙋🏽‍♂️ 🙋🏾‍♂️ 🙋🏿‍♂️ | man-raising-hand | 🚣‍♂️ 🚣🏻‍♂️ 🚣🏼‍♂️ 🚣🏽‍♂️ 🚣🏾‍♂️ 🚣🏿‍♂️ | man-rowing-boat |
| 🏃‍♂️ 🏃🏻‍♂️ 🏃🏼‍♂️ 🏃🏽‍♂️ 🏃🏾‍♂️ 🏃🏿‍♂️ | man-running | 🤷‍♂️ 🤷🏻‍♂️ 🤷🏼‍♂️ 🤷🏽‍♂️ 🤷🏾‍♂️ 🤷🏿‍♂️ | man-shrugging |
| 🏄‍♂️ 🏄🏻‍♂️ 🏄🏼‍♂️ 🏄🏽‍♂️ 🏄🏾‍♂️ 🏄🏿‍♂️ | man-surfing | 🏊‍♂️ 🏊🏻‍♂️ 🏊🏼‍♂️ 🏊🏽‍♂️ 🏊🏾‍♂️ 🏊🏿‍♂️ | man-swimming |
| 💁‍♂️ 💁🏻‍♂️ 💁🏼‍♂️ 💁🏽‍♂️ 💁🏾‍♂️ 💁🏿‍♂️ | man-tipping-hand | 🚶‍♂️ 🚶🏻‍♂️ 🚶🏼‍♂️ 🚶🏽‍♂️ 🚶🏾‍♂️ 🚶🏿‍♂️ | man-walking |
| 👳‍♂️ 👳🏻‍♂️ 👳🏼‍♂️ 👳🏽‍♂️ 👳🏾‍♂️ 👳🏿‍♂️ | man-wearing-turban | 👯‍♂️ | man-with-bunny-ears-partying |
| 👪 | man-woman-boy | 👨‍👩‍👦 | man-woman-boy |
| 👨‍👩‍👦‍👦 | man-woman-boy-boy | 👨‍👩‍👧 | man-woman-girl |
| 👨‍👩‍👧‍👦 | man-woman-girl-boy | 👨‍👩‍👧‍👧 | man-woman-girl-girl |
| 🤼‍♂️ | man-wrestling | 👫 | man_and_woman_holding_hands |
| 🧗‍♂️ 🧗🏻‍♂️ 🧗🏼‍♂️ 🧗🏽‍♂️ 🧗🏾‍♂️ 🧗🏿‍♂️ | man_climbing | 🕺 🕺🏻 🕺🏼 🕺🏽 🕺🏾 🕺🏿 | man_dancing |
| 🕴️ 🕴🏻 🕴🏼 🕴🏽 🕴🏾 🕴🏿 | man_in_business_suit_levitating | 🧘‍♂️ 🧘🏻‍♂️ 🧘🏼‍♂️ 🧘🏽‍♂️ 🧘🏾‍♂️ 🧘🏿‍♂️ | man_in_lotus_position |
| 🧖‍♂️ 🧖🏻‍♂️ 🧖🏼‍♂️ 🧖🏽‍♂️ 🧖🏾‍♂️ 🧖🏿‍♂️ | man_in_steamy_room | 🤵 🤵🏻 🤵🏼 🤵🏽 🤵🏾 🤵🏿 | man_in_tuxedo |
| 👲 👲🏻 👲🏼 👲🏽 👲🏾 👲🏿 | man_with_gua_pi_mao | 👳 👳🏻 👳🏼 👳🏽 👳🏾 👳🏿 | man_with_turban |
| 👞 | mans_shoe | 🕰️ | mantelpiece_clock |
| 🍁 | maple_leaf | 🥋 | martial_arts_uniform |
| 😷 | mask | 💆 💆🏻 💆🏼 💆🏽 💆🏾 💆🏿 | massage |
| 🍖 | meat_on_bone | 🎖️ | medal |
| ⚕️ | medical_symbol | 📣 | mega |
| 🍈 | melon | 📝 | memo |
| 🕎 | menorah_with_nine_branches | 🚹 | mens |
| 🧜‍♀️ 🧜🏻‍♀️ 🧜🏼‍♀️ 🧜🏽‍♀️ 🧜🏾‍♀️ 🧜🏿‍♀️ | mermaid | 🧜‍♂️ 🧜🏻‍♂️ 🧜🏼‍♂️ 🧜🏽‍♂️ 🧜🏾‍♂️ 🧜🏿‍♂️ | merman |
| 🧜 🧜🏻 🧜🏼 🧜🏽 🧜🏾 🧜🏿 | merperson | 🚇 | metro |
| 🎤 | microphone | 🔬 | microscope |
| 🖕 🖕🏻 🖕🏼 🖕🏽 🖕🏾 🖕🏿 | middle_finger | 🌌 | milky_way |
| 🚐 | minibus | 💽 | minidisc |
| 📴 | mobile_phone_off | 🤑 | money_mouth_face |
| 💸 | money_with_wings | 💰 | moneybag |
| 🐒 | monkey | 🐵 | monkey_face |
| 🚝 | monorail | 🌔 | moon |
| 🎓 | mortar_board | 🕌 | mosque |
| 🌤️ | mostly_sunny | 🤶 🤶🏻 🤶🏼 🤶🏽 🤶🏾 🤶🏿 | mother_christmas |
| 🛥️ | motor_boat | 🛵 | motor_scooter |
| 🛣️ | motorway | 🗻 | mount_fuji |
| ⛰️ | mountain | 🚵 🚵🏻 🚵🏼 🚵🏽 🚵🏾 🚵🏿 | mountain_bicyclist |
| 🚠 | mountain_cableway | 🚞 | mountain_railway |
| 🐭 | mouse | 🐁 | mouse2 |
| 🎥 | movie_camera | 🗿 | moyai |
| 🤶 🤶🏻 🤶🏼 🤶🏽 🤶🏾 🤶🏿 | mrs_claus | 💪 💪🏻 💪🏼 💪🏽 💪🏾 💪🏿 | muscle |
| 🍄 | mushroom | 🎹 | musical_keyboard |
| 🎵 | musical_note | 🎼 | musical_score |
| 🔇 | mute | 💅 💅🏻 💅🏼 💅🏽 💅🏾 💅🏿 | nail_care |
| 📛 | name_badge | 🏞️ | national_park |
| 🤢 | nauseated_face | 👔 | necktie |
| ❎ | negative_squared_cross_mark | 🤓 | nerd_face |
| 😐 | neutral_face | 🆕 | new |
| 🌑 | new_moon | 🌚 | new_moon_with_face |
| 📰 | newspaper | 🆖 | ng |
| 🌃 | night_with_stars | 9️⃣ | nine |
| 🔕 | no_bell | 🚳 | no_bicycles |
| ⛔ | no_entry | 🚫 | no_entry_sign |
| 🙅 🙅🏻 🙅🏼 🙅🏽 🙅🏾 🙅🏿 | no_good | 📵 | no_mobile_phones |
| 😶 | no_mouth | 🚷 | no_pedestrians |
| 🚭 | no_smoking | 🚱 | non-potable_water |
| 👃 👃🏻 👃🏼 👃🏽 👃🏾 👃🏿 | nose | 📓 | notebook |
| 📔 | notebook_with_decorative_cover | 🎶 | notes |
| 🔩 | nut_and_bolt | ⭕ | o |
| 🅾️ | o2 | 🌊 | ocean |
| 🛑 | octagonal_sign | 🐙 | octopus |
| 🍢 | oden | 🏢 | office |
| 🛢️ | oil_drum | 🆗 | ok |
| 👌 👌🏻 👌🏼 👌🏽 👌🏾 👌🏿 | ok_hand | 🙆 🙆🏻 🙆🏼 🙆🏽 🙆🏾 🙆🏿 | ok_woman |
| 🗝️ | old_key | 🧓 🧓🏻 🧓🏼 🧓🏽 🧓🏾 🧓🏿 | older_adult |
| 👴 👴🏻 👴🏼 👴🏽 👴🏾 👴🏿 | older_man | 👵 👵🏻 👵🏼 👵🏽 👵🏾 👵🏿 | older_woman |
| 🕉️ | om_symbol | 🔛 | on |
| 🚘 | oncoming_automobile | 🚍 | oncoming_bus |
| 🚔 | oncoming_police_car | 🚖 | oncoming_taxi |
| 1️⃣ | one | 📖 | open_book |
| 📂 | open_file_folder | 👐 👐🏻 👐🏼 👐🏽 👐🏾 👐🏿 | open_hands |
| 😮 | open_mouth | ⛎ | ophiuchus |
| 📙 | orange_book | 🧡 | orange_heart |
| ☦️ | orthodox_cross | 📤 | outbox_tray |
| 🦉 | owl | 🐂 | ox |
| 📦 | package | 📄 | page_facing_up |
| 📃 | page_with_curl | 📟 | pager |
| 🌴 | palm_tree | 🤲 🤲🏻 🤲🏼 🤲🏽 🤲🏾 🤲🏿 | palms_up_together |
| 🥞 | pancakes | 🐼 | panda_face |
| 📎 | paperclip | 🅿️ | parking |
| 〽️ | part_alternation_mark | ⛅ | partly_sunny |
| 🌦️ | partly_sunny_rain | 🛳️ | passenger_ship |
| 🛂 | passport_control | 🐾 | paw_prints |
| ☮️ | peace_symbol | 🍑 | peach |
| 🥜 | peanuts | 🍐 | pear |
| 📝 | pencil | ✏️ | pencil2 |
| 🐧 | penguin | 😔 | pensive |
| 🎭 | performing_arts | 😣 | persevere |
| 🧗 🧗🏻 🧗🏼 🧗🏽 🧗🏾 🧗🏿 | person_climbing | 🤸 🤸🏻 🤸🏼 🤸🏽 🤸🏾 🤸🏿 | person_doing_cartwheel |
| 🙍 🙍🏻 🙍🏼 🙍🏽 🙍🏾 🙍🏿 | person_frowning | 🧘 🧘🏻 🧘🏼 🧘🏽 🧘🏾 🧘🏿 | person_in_lotus_position |
| 🧖 🧖🏻 🧖🏼 🧖🏽 🧖🏾 🧖🏿 | person_in_steamy_room | ⛹️ ⛹🏻 ⛹🏼 ⛹🏽 ⛹🏾 ⛹🏿 | person_with_ball |
| 👱 👱🏻 👱🏼 👱🏽 👱🏾 👱🏿 | person_with_blond_hair | 🧕 🧕🏻 🧕🏼 🧕🏽 🧕🏾 🧕🏿 | person_with_headscarf |
| 🙎 🙎🏻 🙎🏼 🙎🏽 🙎🏾 🙎🏿 | person_with_pouting_face | ☎️ | phone |
| ⛏️ | pick | 🥧 | pie |
| 🐷 | pig | 🐖 | pig2 |
| 🐽 | pig_nose | 💊 | pill |
| 🍍 | pineapple | ♓ | pisces |
| 🍕 | pizza | 🛐 | place_of_worship |
| 👇 👇🏻 👇🏼 👇🏽 👇🏾 👇🏿 | point_down | 👈 👈🏻 👈🏼 👈🏽 👈🏾 👈🏿 | point_left |
| 👉 👉🏻 👉🏼 👉🏽 👉🏾 👉🏿 | point_right | ☝️ ☝🏻 ☝🏼 ☝🏽 ☝🏾 ☝🏿 | point_up |
| 👆 👆🏻 👆🏼 👆🏽 👆🏾 👆🏿 | point_up_2 | 🚓 | police_car |
| 🐩 | poodle | 💩 | poop |
| 🍿 | popcorn | 🏣 | post_office |
| 📯 | postal_horn | 📮 | postbox |
| 🚰 | potable_water | 🥔 | potato |
| 👝 | pouch | 🍗 | poultry_leg |
| 💷 | pound | 😾 | pouting_cat |
| 🙏 🙏🏻 🙏🏼 🙏🏽 🙏🏾 🙏🏿 | pray | 📿 | prayer_beads |
| 🤰 🤰🏻 🤰🏼 🤰🏽 🤰🏾 🤰🏿 | pregnant_woman | 🥨 | pretzel |
| 🤴 🤴🏻 🤴🏼 🤴🏽 🤴🏾 🤴🏿 | prince | 👸 👸🏻 👸🏼 👸🏽 👸🏾 👸🏿 | princess |
| 🖨️ | printer | 👊 👊🏻 👊🏼 👊🏽 👊🏾 👊🏿 | punch |
| 💜 | purple_heart | 👛 | purse |
| 📌 | pushpin | 🚮 | put_litter_in_its_place |
| ❓ | question | 🐰 | rabbit |
| 🐇 | rabbit2 | 🐎 | racehorse |
| 🏎️ | racing_car | 🏍️ | racing_motorcycle |
| 📻 | radio | 🔘 | radio_button |
| ☢️ | radioactive_sign | 😡 | rage |
| 🚃 | railway_car | 🛤️ | railway_track |
| 🌧️ | rain_cloud | 🌈 | rainbow |
| 🏳️‍🌈 | rainbow-flag | 🤚 🤚🏻 🤚🏼 🤚🏽 🤚🏾 🤚🏿 | raised_back_of_hand |
| ✋ ✋🏻 ✋🏼 ✋🏽 ✋🏾 ✋🏿 | raised_hand | 🖐️ 🖐🏻 🖐🏼 🖐🏽 🖐🏾 🖐🏿 | raised_hand_with_fingers_splayed |
| 🙌 🙌🏻 🙌🏼 🙌🏽 🙌🏾 🙌🏿 | raised_hands | 🙋 🙋🏻 🙋🏼 🙋🏽 🙋🏾 🙋🏿 | raising_hand |
| 🐏 | ram | 🍜 | ramen |
| 🐀 | rat | ♻️ | recycle |
| 🚗 | red_car | 🔴 | red_circle |
| ®️ | registered | ☺️ | relaxed |
| 😌 | relieved | 🎗️ | reminder_ribbon |
| 🔁 | repeat | 🔂 | repeat_one |
| 🚻 | restroom | 🖕 🖕🏻 🖕🏼 🖕🏽 🖕🏾 🖕🏿 | reversed_hand_with_middle_finger_extended |
| 💞 | revolving_hearts | ⏪ | rewind |
| 🦏 | rhinoceros | 🎀 | ribbon |
| 🍚 | rice | 🍙 | rice_ball |
| 🍘 | rice_cracker | 🎑 | rice_scene |
| 🤜 🤜🏻 🤜🏼 🤜🏽 🤜🏾 🤜🏿 | right-facing_fist | 🗯️ | right_anger_bubble |
| 💍 | ring | 🤖 | robot_face |
| 🚀 | rocket | 🗞️ | rolled_up_newspaper |
| 🎢 | roller_coaster | 🤣 | rolling_on_the_floor_laughing |
| 🐓 | rooster | 🌹 | rose |
| 🏵️ | rosette | 🚨 | rotating_light |
| 📍 | round_pushpin | 🚣 🚣🏻 🚣🏼 🚣🏽 🚣🏾 🚣🏿 | rowboat |
| 🇷🇺 | ru | 🏉 | rugby_football |
| 🏃 🏃🏻 🏃🏼 🏃🏽 🏃🏾 🏃🏿 | runner | 🏃 🏃🏻 🏃🏼 🏃🏽 🏃🏾 🏃🏿 | running |
| 🎽 | running_shirt_with_sash | 🈂️ | sa |
| ♐ | sagittarius | ⛵ | sailboat |
| 🍶 | sake | 👡 | sandal |
| 🥪 | sandwich | 🎅 🎅🏻 🎅🏼 🎅🏽 🎅🏾 🎅🏿 | santa |
| 🛰️ | satellite | 📡 | satellite_antenna |
| 😆 | satisfied | 🦕 | sauropod |
| 🎷 | saxophone | ⚖️ | scales |
| 🧣 | scarf | 🏫 | school |
| 🎒 | school_satchel | ✂️ | scissors |
| 🛴 | scooter | 🦂 | scorpion |
| ♏ | scorpius | 😱 | scream |
| 🙀 | scream_cat | 📜 | scroll |
| 💺 | seat | 🥈 | second_place_medal |
| ㊙️ | secret | 🙈 | see_no_evil |
| 🌱 | seedling | 🤳 🤳🏻 🤳🏼 🤳🏽 🤳🏾 🤳🏿 | selfie |
| 🤬 | serious_face_with_symbols_covering_mouth | 7️⃣ | seven |
| 🥘 | shallow_pan_of_food | ☘️ | shamrock |
| 🦈 | shark | 🍧 | shaved_ice |
| 🐑 | sheep | 🐚 | shell |
| 🛡️ | shield | ⛩️ | shinto_shrine |
| 🚢 | ship | 👕 | shirt |
| 💩 | shit | 🤯 | shocked_face_with_exploding_head |
| 👞 | shoe | 🛍️ | shopping_bags |
| 🛒 | shopping_trolley | 🚿 | shower |
| 🦐 | shrimp | 🤷 🤷🏻 🤷🏼 🤷🏽 🤷🏾 🤷🏿 | shrug |
| 🤫 | shushing_face | 🤘 🤘🏻 🤘🏼 🤘🏽 🤘🏾 🤘🏿 | sign_of_the_horns |
| 📶 | signal_strength | 6️⃣ | six |
| 🔯 | six_pointed_star | 🎿 | ski |
| ⛷️ | skier | 🏻 | skin-tone-2 |
| 🏼 | skin-tone-3 | 🏽 | skin-tone-4 |
| 🏾 | skin-tone-5 | 🏿 | skin-tone-6 |
| 💀 | skull | ☠️ | skull_and_crossbones |
| 🛷 | sled | 😴 | sleeping |
| 🛌 🛌🏻 🛌🏼 🛌🏽 🛌🏾 🛌🏿 | sleeping_accommodation | 😪 | sleepy |
| 🕵️ 🕵🏻 🕵🏼 🕵🏽 🕵🏾 🕵🏿 | sleuth_or_spy | 🙁 | slightly_frowning_face |
| 🙂 | slightly_smiling_face | 🎰 | slot_machine |
| 🛩️ | small_airplane | 🔹 | small_blue_diamond |
| 🔸 | small_orange_diamond | 🔺 | small_red_triangle |
| 🔻 | small_red_triangle_down | 😄 | smile |
| 😸 | smile_cat | 😃 | smiley |
| 😺 | smiley_cat | 🤭 | smiling_face_with_smiling_eyes_and_hand_covering_mouth |
| 😈 | smiling_imp | 😏 | smirk |
| 😼 | smirk_cat | 🚬 | smoking |
| 🐌 | snail | 🐍 | snake |
| 🤧 | sneezing_face | 🏔️ | snow_capped_mountain |
| 🌨️ | snow_cloud | 🏂 🏂🏻 🏂🏼 🏂🏽 🏂🏾 🏂🏿 | snowboarder |
| ❄️ | snowflake | ☃️ | snowman |
| ⛄ | snowman_without_snow | 😭 | sob |
| ⚽ | soccer | 🧦 | socks |
| 🔜 | soon | 🆘 | sos |
| 🔉 | sound | 👾 | space_invader |
| ♠️ | spades | 🍝 | spaghetti |
| ❇️ | sparkle | 🎇 | sparkler |
| ✨ | sparkles | 💖 | sparkling_heart |
| 🙊 | speak_no_evil | 🔈 | speaker |
| 🗣️ | speaking_head_in_silhouette | 💬 | speech_balloon |
| 🚤 | speedboat | 🕷️ | spider |
| 🕸️ | spider_web | 🗓️ | spiral_calendar_pad |
| 🗒️ | spiral_note_pad | 🖖 🖖🏻 🖖🏼 🖖🏽 🖖🏾 🖖🏿 | spock-hand |
| 🥄 | spoon | 🏅 | sports_medal |
| 🦑 | squid | 🏟️ | stadium |
| ⚕️ | staff_of_aesculapius | ⭐ | star |
| 🤩 | star-struck | 🌟 | star2 |
| ☪️ | star_and_crescent | ✡️ | star_of_david |
| 🌠 | stars | 🚉 | station |
| 🗽 | statue_of_liberty | 🚂 | steam_locomotive |
| 🍲 | stew | ⏱️ | stopwatch |
| 📏 | straight_ruler | 🍓 | strawberry |
| 😛 | stuck_out_tongue | 😝 | stuck_out_tongue_closed_eyes |
| 😜 | stuck_out_tongue_winking_eye | 🎙️ | studio_microphone |
| 🥙 | stuffed_flatbread | 🌥️ | sun_behind_cloud |
| 🌦️ | sun_behind_rain_cloud | 🌤️ | sun_small_cloud |
| 🌞 | sun_with_face | 🌻 | sunflower |
| 😎 | sunglasses | ☀️ | sunny |
| 🌅 | sunrise | 🌄 | sunrise_over_mountains |
| 🏄 🏄🏻 🏄🏼 🏄🏽 🏄🏾 🏄🏿 | surfer | 🍣 | sushi |
| 🚟 | suspension_railway | 😓 | sweat |
| 💦 | sweat_drops | 😅 | sweat_smile |
| 🍠 | sweet_potato | 🏊 🏊🏻 🏊🏼 🏊🏽 🏊🏾 🏊🏿 | swimmer |
| 🔣 | symbols | 🕍 | synagogue |
| 💉 | syringe | 🦖 | t-rex |
| 🏓 | table_tennis_paddle_and_ball | 🌮 | taco |
| 🎉 | tada | 🥡 | takeout_box |
| 🎋 | tanabata_tree | 🍊 | tangerine |
| ♉ | taurus | 🚕 | taxi |
| 🍵 | tea | ☎️ | telephone |
| 📞 | telephone_receiver | 🔭 | telescope |
| 🎾 | tennis | ⛺ | tent |
| 🤘 🤘🏻 🤘🏼 🤘🏽 🤘🏾 🤘🏿 | the_horns | 🌡️ | thermometer |
| 🤔 | thinking_face | 🥉 | third_place_medal |
| 💭 | thought_balloon | 3️⃣ | three |
| 🖱️ | three_button_mouse | 👎 👎🏻 👎🏼 👎🏽 👎🏾 👎🏿 | thumbsdown |
| 👍 👍🏻 👍🏼 👍🏽 👍🏾 👍🏿 | thumbsup | ⛈️ | thunder_cloud_and_rain |
| 🎫 | ticket | 🐯 | tiger |
| 🐅 | tiger2 | ⏲️ | timer_clock |
| 😫 | tired_face | ™️ | tm |
| 🚽 | toilet | 🗼 | tokyo_tower |
| 🍅 | tomato | 👅 | tongue |
| 🔝 | top | 🎩 | tophat |
| 🌪️ | tornado | 🌪️ | tornado_cloud |
| 🖲️ | trackball | 🚜 | tractor |
| 🚥 | traffic_light | 🚋 | train |
| 🚆 | train2 | 🚊 | tram |
| 🚩 | triangular_flag_on_post | 📐 | triangular_ruler |
| 🔱 | trident | 😤 | triumph |
| 🚎 | trolleybus | 🏆 | trophy |
| 🍹 | tropical_drink | 🐠 | tropical_fish |
| 🚚 | truck | 🎺 | trumpet |
| 👕 | tshirt | 🌷 | tulip |
| 🥃 | tumbler_glass | 🦃 | turkey |
| 🐢 | turtle | 📺 | tv |
| 🔀 | twisted_rightwards_arrows | 2️⃣ | two |
| 💕 | two_hearts | 👬 | two_men_holding_hands |
| 👭 | two_women_holding_hands | 🈹 | u5272 |
| 🈴 | u5408 | 🈺 | u55b6 |
| 🈯 | u6307 | 🈷️ | u6708 |
| 🈶 | u6709 | 🈵 | u6e80 |
| 🈚 | u7121 | 🈸 | u7533 |
| 🈲 | u7981 | 🈳 | u7a7a |
| 🇬🇧 | uk | ☂️ | umbrella |
| ⛱️ | umbrella_on_ground | ☔ | umbrella_with_rain_drops |
| 😒 | unamused | 🔞 | underage |
| 🦄 | unicorn_face | 🔓 | unlock |
| 🆙 | up | 🙃 | upside_down_face |
| 🇺🇸 | us | ✌️ ✌🏻 ✌🏼 ✌🏽 ✌🏾 ✌🏿 | v |
| 🧛 🧛🏻 🧛🏼 🧛🏽 🧛🏾 🧛🏿 | vampire | 🚦 | vertical_traffic_light |
| 📼 | vhs | 📳 | vibration_mode |
| 📹 | video_camera | 🎮 | video_game |
| 🎻 | violin | ♍ | virgo |
| 🌋 | volcano | 🏐 | volleyball |
| 🆚 | vs | 🚶 🚶🏻 🚶🏼 🚶🏽 🚶🏾 🚶🏿 | walking |
| 🌘 | waning_crescent_moon | 🌖 | waning_gibbous_moon |
| ⚠️ | warning | 🗑️ | wastebasket |
| ⌚ | watch | 🐃 | water_buffalo |
| 🤽 🤽🏻 🤽🏼 🤽🏽 🤽🏾 🤽🏿 | water_polo | 🍉 | watermelon |
| 👋 👋🏻 👋🏼 👋🏽 👋🏾 👋🏿 | wave | 🏴 | waving_black_flag |
| 🏳️ | waving_white_flag | 〰️ | wavy_dash |
| 🌒 | waxing_crescent_moon | 🌔 | waxing_gibbous_moon |
| 🚾 | wc | 😩 | weary |
| 💒 | wedding | 🏋️ 🏋🏻 🏋🏼 🏋🏽 🏋🏾 🏋🏿 | weight_lifter |
| 🐳 | whale | 🐋 | whale2 |
| ☸️ | wheel_of_dharma | ♿ | wheelchair |
| ✅ | white_check_mark | ⚪ | white_circle |
| 💮 | white_flower | ☹️ | white_frowning_face |
| ⬜ | white_large_square | ◽ | white_medium_small_square |
| ◻️ | white_medium_square | ▫️ | white_small_square |
| 🔳 | white_square_button | 🥀 | wilted_flower |
| 🌬️ | wind_blowing_face | 🎐 | wind_chime |
| 🍷 | wine_glass | 😉 | wink |
| 🐺 | wolf | 👩 👩🏻 👩🏼 👩🏽 👩🏾 👩🏿 | woman |
| 🚴‍♀️ 🚴🏻‍♀️ 🚴🏼‍♀️ 🚴🏽‍♀️ 🚴🏾‍♀️ 🚴🏿‍♀️ | woman-biking | ⛹️‍♀️ ⛹🏻‍♀️ ⛹🏼‍♀️ ⛹🏽‍♀️ ⛹🏾‍♀️ ⛹🏿‍♀️ | woman-bouncing-ball |
| 🙇‍♀️ 🙇🏻‍♀️ 🙇🏼‍♀️ 🙇🏽‍♀️ 🙇🏾‍♀️ 🙇🏿‍♀️ | woman-bowing | 👩‍👦 | woman-boy |
| 👩‍👦‍👦 | woman-boy-boy | 🤸‍♀️ 🤸🏻‍♀️ 🤸🏼‍♀️ 🤸🏽‍♀️ 🤸🏾‍♀️ 🤸🏿‍♀️ | woman-cartwheeling |
| 🤦‍♀️ 🤦🏻‍♀️ 🤦🏼‍♀️ 🤦🏽‍♀️ 🤦🏾‍♀️ 🤦🏿‍♀️ | woman-facepalming | 🙍‍♀️ 🙍🏻‍♀️ 🙍🏼‍♀️ 🙍🏽‍♀️ 🙍🏾‍♀️ 🙍🏿‍♀️ | woman-frowning |
| 🙅‍♀️ 🙅🏻‍♀️ 🙅🏼‍♀️ 🙅🏽‍♀️ 🙅🏾‍♀️ 🙅🏿‍♀️ | woman-gesturing-no | 🙆‍♀️ 🙆🏻‍♀️ 🙆🏼‍♀️ 🙆🏽‍♀️ 🙆🏾‍♀️ 🙆🏿‍♀️ | woman-gesturing-ok |
| 💇‍♀️ 💇🏻‍♀️ 💇🏼‍♀️ 💇🏽‍♀️ 💇🏾‍♀️ 💇🏿‍♀️ | woman-getting-haircut | 💆‍♀️ 💆🏻‍♀️ 💆🏼‍♀️ 💆🏽‍♀️ 💆🏾‍♀️ 💆🏿‍♀️ | woman-getting-massage |
| 👩‍👧 | woman-girl | 👩‍👧‍👦 | woman-girl-boy |
| 👩‍👧‍👧 | woman-girl-girl | 🏌️‍♀️ 🏌🏻‍♀️ 🏌🏼‍♀️ 🏌🏽‍♀️ 🏌🏾‍♀️ 🏌🏿‍♀️ | woman-golfing |
| 👩‍❤️‍👨 | woman-heart-man | 👩‍❤️‍👩 | woman-heart-woman |
| 🤹‍♀️ 🤹🏻‍♀️ 🤹🏼‍♀️ 🤹🏽‍♀️ 🤹🏾‍♀️ 🤹🏿‍♀️ | woman-juggling | 👩‍❤️‍💋‍👨 | woman-kiss-man |
| 👩‍❤️‍💋‍👩 | woman-kiss-woman | 🏋️‍♀️ 🏋🏻‍♀️ 🏋🏼‍♀️ 🏋🏽‍♀️ 🏋🏾‍♀️ 🏋🏿‍♀️ | woman-lifting-weights |
| 🚵‍♀️ 🚵🏻‍♀️ 🚵🏼‍♀️ 🚵🏽‍♀️ 🚵🏾‍♀️ 🚵🏿‍♀️ | woman-mountain-biking | 🤾‍♀️ 🤾🏻‍♀️ 🤾🏼‍♀️ 🤾🏽‍♀️ 🤾🏾‍♀️ 🤾🏿‍♀️ | woman-playing-handball |
| 🤽‍♀️ 🤽🏻‍♀️ 🤽🏼‍♀️ 🤽🏽‍♀️ 🤽🏾‍♀️ 🤽🏿‍♀️ | woman-playing-water-polo | 🙎‍♀️ 🙎🏻‍♀️ 🙎🏼‍♀️ 🙎🏽‍♀️ 🙎🏾‍♀️ 🙎🏿‍♀️ | woman-pouting |
| 🙋‍♀️ 🙋🏻‍♀️ 🙋🏼‍♀️ 🙋🏽‍♀️ 🙋🏾‍♀️ 🙋🏿‍♀️ | woman-raising-hand | 🚣‍♀️ 🚣🏻‍♀️ 🚣🏼‍♀️ 🚣🏽‍♀️ 🚣🏾‍♀️ 🚣🏿‍♀️ | woman-rowing-boat |
| 🏃‍♀️ 🏃🏻‍♀️ 🏃🏼‍♀️ 🏃🏽‍♀️ 🏃🏾‍♀️ 🏃🏿‍♀️ | woman-running | 🤷‍♀️ 🤷🏻‍♀️ 🤷🏼‍♀️ 🤷🏽‍♀️ 🤷🏾‍♀️ 🤷🏿‍♀️ | woman-shrugging |
| 🏄‍♀️ 🏄🏻‍♀️ 🏄🏼‍♀️ 🏄🏽‍♀️ 🏄🏾‍♀️ 🏄🏿‍♀️ | woman-surfing | 🏊‍♀️ 🏊🏻‍♀️ 🏊🏼‍♀️ 🏊🏽‍♀️ 🏊🏾‍♀️ 🏊🏿‍♀️ | woman-swimming |
| 💁‍♀️ 💁🏻‍♀️ 💁🏼‍♀️ 💁🏽‍♀️ 💁🏾‍♀️ 💁🏿‍♀️ | woman-tipping-hand | 🚶‍♀️ 🚶🏻‍♀️ 🚶🏼‍♀️ 🚶🏽‍♀️ 🚶🏾‍♀️ 🚶🏿‍♀️ | woman-walking |
| 👳‍♀️ 👳🏻‍♀️ 👳🏼‍♀️ 👳🏽‍♀️ 👳🏾‍♀️ 👳🏿‍♀️ | woman-wearing-turban | 👯‍♀️ | woman-with-bunny-ears-partying |
| 👩‍👩‍👦 | woman-woman-boy | 👩‍👩‍👦‍👦 | woman-woman-boy-boy |
| 👩‍👩‍👧 | woman-woman-girl | 👩‍👩‍👧‍👦 | woman-woman-girl-boy |
| 👩‍👩‍👧‍👧 | woman-woman-girl-girl | 🤼‍♀️ | woman-wrestling |
| 🧗‍♀️ 🧗🏻‍♀️ 🧗🏼‍♀️ 🧗🏽‍♀️ 🧗🏾‍♀️ 🧗🏿‍♀️ | woman_climbing | 🧘‍♀️ 🧘🏻‍♀️ 🧘🏼‍♀️ 🧘🏽‍♀️ 🧘🏾‍♀️ 🧘🏿‍♀️ | woman_in_lotus_position |
| 🧖‍♀️ 🧖🏻‍♀️ 🧖🏼‍♀️ 🧖🏽‍♀️ 🧖🏾‍♀️ 🧖🏿‍♀️ | woman_in_steamy_room | 👚 | womans_clothes |
| 👒 | womans_hat | 🚺 | womens |
| 🗺️ | world_map | 😟 | worried |
| 🔧 | wrench | 🤼 | wrestlers |
| ✍️ ✍🏻 ✍🏼 ✍🏽 ✍🏾 ✍🏿 | writing_hand | ❌ | x |
| 💛 | yellow_heart | 💴 | yen |
| ☯️ | yin_yang | 😋 | yum |
| 🤪 | zany_face | ⚡ | zap |
| 🦓 | zebra_face | 0️⃣ | zero |
| 🤐 | zipper_mouth_face | 🧟 | zombie |
| 💤 | zzz |
