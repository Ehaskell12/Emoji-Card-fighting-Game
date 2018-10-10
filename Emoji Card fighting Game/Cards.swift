//
//  Cards.swift
//  Emoji Card fighting Game
//
//  Created by Fabiola Haskell on 9/8/18.
//  Copyright © 2018 Eric Haskell. All rights reserved.
//
//
// RULES:
//  full sheld is 100 HP
//  you can have only one emoji card in play at one time
//  only one card salected at one time
// you can attack up to three times
// drawing cards?
// you start with two random emoji cards
// 

import Foundation

enum EEmojiType:String {

    case Earth = "Earth"  // Weakness in humans  + 10 Damage
    case Water = "Water"  // weakness is Wind    + 10 Damage
    case Wind = "Wind"    // weakness is Earth   + 10 Damage
    case fire = "Fire"    // weakness is Water   + 10 Damage
    case Human = "Human"  // Weakness is Human   + 20 Damage
}

enum ECardLocation:String {
    case Deck = "Deck"
    case Hand = "Hand"
    case Selected = "Selected"
    case Play = "Play"
    case Dead = "Dead"
}

enum EEmojiOrAction:String {
    case Emoji = "Emoji"
    case Action = "Action"
 }

class Card {
    
    var emojiOrAction:EEmojiOrAction
    var name: String
    var cardNote: String
    var emoji: String
    var emojiType : EEmojiType
    var startingHealth: Int
    var curentHealth:Int
    var shield = 0
    var attackStrangthLow: Int
    var attackStrangthMedium: Int
    var attackStrangthHigh: Int
    var cardLocation = ECardLocation.Deck
    var hasCardBeenPlayed = false
    
    init(emojiOrAction:EEmojiOrAction,name:String,cardNote:String, emoji:String, emojiType:EEmojiType, curentHealth:Int, attackStrangthLow:Int, attackStrangthMedium:Int, attackStrangthHigh:Int) {
        
        self.emojiOrAction = emojiOrAction
        self.name = name
        self.cardNote = cardNote
        self.emoji = emoji
        self.emojiType = emojiType
        self.startingHealth = curentHealth
        self.curentHealth = curentHealth
        self.attackStrangthLow = attackStrangthLow
        self.attackStrangthMedium = attackStrangthMedium
        self.attackStrangthHigh = attackStrangthHigh
        
        func halfSheld () {
//            shield += 50
//            if shield > 100 {
//                shield = 100
            }
        }
        func fullShield () {
            //shield = 100
        }


    
    
}
