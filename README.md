# README: SNAKES AND LADDERS

## Setup a Game:

POST request to ```http://127.0.0.1:3000/setup``` with the following JSON structure (example):
```json
{
  "title": "Snakes and Ladders All Irons",
  "board": {
    "title": "All Irons S&L v1",
    "tiles": [
      {
        "number": 0,
        "description": "Start"
      },
      {
        "number": 1,
        "description": "Tanzanite fang OR Magic fang"
      },
      {
        "number": 2,
        "description": "Sarachnis cudgel"
      },
      {
        "number": 3,
        "description": "Move to tile 17",
        "special_value": 14
      },
      {
        "number": 4,
        "description": "Any piece of Ahrims"
      },
      {
        "number": 5,
        "description": "Vorkath's head"
      },
      {
        "number": 6,
        "description": "ANY DKS rings"
      },
      {
        "number": 7,
        "description": "Ancient Icon"
      },
      {
        "number": 8,
        "description": "ANY malediction shard"
      },
      {
        "number": 9,
        "description": "ANY odium shard"
      },
      {
        "number": 10,
        "description": "Zenyte shard"
      },
      {
        "number": 11,
        "description": "Long bone"
      },
      {
        "number": 12,
        "description": "ANY Corp unique (Spirit Shield, Holy Elixer, Any sigil)"
      },
      {
        "number": 13,
        "description": "Black Mask"
      },
      {
        "number": 14,
        "description": "KBD head"
      },
      {
        "number": 15,
        "description": "Blood shard (through PvM ONLY)"
      },
      {
        "number": 16,
        "description": "Dragon spear (through PvM ONLY)"
      },
      {
        "number": 17,
        "description": "Dexterous prayer scroll OR Arcane prayer scroll"
      },
      {
        "number": 18,
        "description": "ANY piece of Karils"
      },
      {
        "number": 19,
        "description": "Dragon pickaxe (through PvM ONLY)"
      },
      {
        "number": 20,
        "description": "move to tile 33",
        "special_value": 13
      },
      {
        "number": 21,
        "description": "Awakener's Orb"
      },
      {
        "number": 22,
        "description": "ANY piece of Dharok"
      },
      {
        "number": 23,
        "description": "Dragon chainbody"
      },
      {
        "number": 24,
        "description": "ANY Grotesque Guardian unique EXCEPT Granite Maul (Black Tourmaline Core, Granite hammer, Granite ring, Granite gloves)"
      },
      {
        "number": 25,
        "description": "move to tile 11",
        "special_value": -14
      },
      {
        "number": 26,
        "description": "Osmumten's Fang OR Lightbearer"
      },
      {
        "number": 27,
        "description": "Kraken Tentacle or Trident of the Seas (full)"
      },
      {
        "number": 28,
        "description": "move to tile 42",
        "special_value": 14
      },
      {
        "number": 29,
        "description": "ANY Champion Scroll"
      },
      {
        "number": 30,
        "description": "ANY Piece of Bandos armor (from GWD)"
      },
      {
        "number": 31,
        "description": "ANY Quartz (Blood, Ice, Shadow, Smoke)"
      },
      {
        "number": 32,
        "description": "move to tile 16",
        "special_value": -16
      },
      {
        "number": 33,
        "description": "ANY TOA Unique EXCEPT Osmumten's Fang/Lightbearer"
      },
      {
        "number": 34,
        "description": "ANY godsword shard"
      },
      {
        "number": 35,
        "description": "Dragon 2h"
      },
      {
        "number": 36,
        "description": "Dragon boots"
      },
      {
        "number": 37,
        "description": "ANY Cerberus crystal (including Smouldering Stone)"
      },
      {
        "number": 38,
        "description": "ANY piece of Armadyl armor (from GWD)"
      },
      {
        "number": 39,
        "description": "ANY piece of Chaos Elder robes"
      },
      {
        "number": 40,
        "description": "move to tile 46",
        "special_value": 6
      },
      {
        "number": 41,
        "description": "Armadyl Crossbow"
      },
      {
        "number": 42,
        "description": "ANY Non Prayer Scroll COX Unique"
      },
      {
        "number": 43,
        "description": "ANY Hydra ring piece"
      },
      {
        "number": 44,
        "description": "Chromium ingot"
      },
      {
        "number": 45,
        "description": "Abyssal Whip"
      },
      {
        "number": 46,
        "description": "ANY Bludgeon piece"
      },
      {
        "number": 47,
        "description": "move to tile 61",
        "special_value": 14
      },
      {
        "number": 48,
        "description": "move to tile 34",
        "special_value": -12
      },
      {
        "number": 49,
        "description": "Avernic Defender Hilt OR Any Justiciar Piece"
      },
      {
        "number": 50,
        "description": "Crystal Armor Seed OR Enhanced Weapon Seed"
      },
      {
        "number": 51,
        "description": "Serpentine visage OR Uncut Onyx"
      },
      {
        "number": 52,
        "description": "Venator shard"
      },
      {
        "number": 53,
        "description": "ANY Voidwaker piece"
      },
      {
        "number": 54,
        "description": "Smoke battlestaff"
      },
      {
        "number": 55,
        "description": "Steam battlestaff OR Zamorak Spear OR Staff of the Dead"
      },
      {
        "number": 56,
        "description": "ANY GWD Hilt"
      },
      {
        "number": 57,
        "description": "KQ Head"
      },
      {
        "number": 58,
        "description": "move to tile 45",
        "special_value": -13
      },
      {
        "number": 59,
        "description": "Occult"
      },
      {
        "number": 60,
        "description": "Dark bow"
      },
      {
        "number": 61,
        "description": "ANY Revenant Weapon OR Amulet of Avarice"
      },
      {
        "number": 62,
        "description": "move to tile 36",
        "special_value": -26
      },
      {
        "number": 63,
        "description": "MYSTERY TILE (edited)"
      }
    ]
  },
  "players": [
    {
      "name": "Team 1",
      "rerolls": 5
    },
    {
      "name": "Team 2",
      "rerolls": 5
    }
  ]
}
```

## Play the game

Roll the dice with a GET request to ```http://127.0.0.1:3000/roll/:player_id(/:dice_sides)```

## Todo

* Refactor special tile code to a SpecialEffect class
* Implement frontend with the board to interact with
* Implement upload proof and proof approval by a game master before being able to roll again
* Implement user login
* Implement user can be on multiple games if he's registered
* Implement user roles (player and game master)
