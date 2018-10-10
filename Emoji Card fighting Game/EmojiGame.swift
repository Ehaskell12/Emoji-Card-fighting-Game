//
//  EmojiGame.swift
//  Emoji Card fighting Game
//
//  Created by Fabiola Haskell on 9/8/18.
//  Copyright © 2018 Eric Haskell. All rights reserved.



import Foundation

class EmojiGame {
    
// Deck
    var emojiCardsDeck = [Card] ()
    var actionCardsDeck = [Card] ()
    
// Cards in Hand
    var emojiCardsInHand = [Card] ()
    var actionCardsInHand = [Card] ()
    
// Card selected/Play
    var cardSelected:Card?
    var emojiCardInPlay:Card?
    
    // your aponit or player 2
    
    var OSemojiCardsInHand = [Card] () //OS = Other side
    var OSactionCardsInHand = [Card] ()
    
  //  var OScardSalected:Card?
    var OScardInPlay:Card?
    
// Whos turn Is it?
    
    var player1Turn = true
    
    func switchTurn () {
        if player1Turn == true {
            player1Turn = false
        } else { player1Turn = true}
    }
 
    func countCardLocations () {
        print("Emoji Deck \(emojiCardsDeck.count)")
        print("Emoji Hand \(emojiCardsInHand.count)")
        print("Selected \(cardSelected?.name ?? "?")")
        print("Card in Play \(emojiCardInPlay?.name ?? "?")")
        
    }
    
    func DrawingEmojiCardsInHand () {
        for _ in 1...4 {
            if emojiCardsDeck.count != 0{
            let randomeNum = Int(arc4random_uniform(UInt32(emojiCardsDeck.count)))
                emojiCardsInHand.append(emojiCardsDeck[randomeNum])
                emojiCardsDeck.remove(at: randomeNum)
            } else { print("No Emoji cards left, Doc - EmojiGame L57")
            }
        }
}
    func DrawingEmojiCardsInHandForOS() {
        for _ in 1...4 {
            if emojiCardsDeck.count != 0 {
                let randomeNum = Int(arc4random_uniform(UInt32(emojiCardsDeck.count)))
                OSemojiCardsInHand.append(emojiCardsDeck[randomeNum])
                emojiCardsDeck.remove(at: randomeNum)
            }
        }
        print("Number of cards in OSHand \(OSemojiCardsInHand.count)")
    }
    
    func CardInHandSelected (Index:Int){
        cardSelected = emojiCardsInHand[Index]
        
    }
    func OSFistcardinPlay () {
        OSemojiCardsInHand.sort(by: { $0.curentHealth > $1.curentHealth} )
        OScardInPlay = OSemojiCardsInHand[0]
    }
    
    func PlayCard (emoji:String) {
        for card in emojiCardsInHand {
            if emoji == card.emoji {
                emojiCardInPlay = card
                card.hasCardBeenPlayed = true
            }
        }
    }
    
    // Dice Roll
    var diceRollOutPut = 0
    
    func diceRoll () {
        let roll = 1 + Int(UInt32(arc4random_uniform(6)))
        print("\(roll)")
        diceRollOutPut = roll
    }
    
    func HitoneAnother(howManyTimes:Int) {
        for _ in 1...howManyTimes {
            diceRoll()
            if diceRollOutPut == 2 || diceRollOutPut == 1 {
                if OScardInPlay?.shield == 0 {
                    OScardInPlay?.curentHealth -= (emojiCardInPlay?.attackStrangthLow)!
                } else if (OScardInPlay?.shield)! > 0 && (OScardInPlay?.shield)! < (emojiCardInPlay?.attackStrangthLow)! {
                 OScardInPlay?.shield = 0
                    OScardInPlay?.curentHealth -= ((emojiCardInPlay?.attackStrangthLow)! - (OScardInPlay?.shield)!)
                } else { OScardInPlay?.shield -= (emojiCardInPlay?.attackStrangthLow)!}
            } else
            if diceRollOutPut == 3 || diceRollOutPut == 4 {
                if OScardInPlay?.shield == 0 {
                    OScardInPlay?.curentHealth -= (emojiCardInPlay?.attackStrangthMedium)!
                } else if (OScardInPlay?.shield)! > 0 && (OScardInPlay?.shield)! < (emojiCardInPlay?.attackStrangthMedium)! {
                    OScardInPlay?.shield = 0
                    OScardInPlay?.curentHealth -= ((emojiCardInPlay?.attackStrangthMedium)! - (OScardInPlay?.shield)!)
                } else { OScardInPlay?.shield -= (emojiCardInPlay?.attackStrangthMedium)!}
            } else
                if diceRollOutPut == 5 || diceRollOutPut == 6 {
                    if OScardInPlay?.shield == 0 {
                        OScardInPlay?.curentHealth -= (emojiCardInPlay?.attackStrangthHigh)!
                    } else if (OScardInPlay?.shield)! > 0 && (OScardInPlay?.shield)! < (emojiCardInPlay?.attackStrangthHigh)! {
                        OScardInPlay?.shield = 0
                        OScardInPlay?.curentHealth -= ((emojiCardInPlay?.attackStrangthHigh)! - (OScardInPlay?.shield)!)
                    } else { OScardInPlay?.shield -= (emojiCardInPlay?.attackStrangthHigh)!}
            }
            let OSDiceRoll = 1 + Int(arc4random_uniform(UInt32(6)))
            print("OSDiceRoll = \(OSDiceRoll)")
            if OSDiceRoll == 1 || OSDiceRoll == 2 {
                if emojiCardInPlay?.shield == 0 {
                    emojiCardInPlay?.curentHealth -= (OScardInPlay?.attackStrangthLow)!
                } else if (emojiCardInPlay?.shield)! > 0 && (emojiCardInPlay?.shield)! < (OScardInPlay?.attackStrangthLow)! {
                    emojiCardInPlay?.shield = 0
                    emojiCardInPlay?.curentHealth -= ((OScardInPlay?.attackStrangthLow)! - (emojiCardInPlay?.shield)!)
                } else { emojiCardInPlay?.shield -= (OScardInPlay?.attackStrangthLow)!}
            } else
                if OSDiceRoll == 3 || OSDiceRoll == 4 {
                if emojiCardInPlay?.shield == 0 {
                    emojiCardInPlay?.curentHealth -= (OScardInPlay?.attackStrangthMedium)!
                } else if (emojiCardInPlay?.shield)! > 0 && (emojiCardInPlay?.shield)! < (OScardInPlay?.attackStrangthMedium)! {
                    emojiCardInPlay?.shield = 0
                    emojiCardInPlay?.curentHealth -= ((OScardInPlay?.attackStrangthMedium)! - (emojiCardInPlay?.shield)!)
                } else {emojiCardInPlay?.shield -= (OScardInPlay?.attackStrangthMedium)!}
            } else
                if OSDiceRoll == 5 || OSDiceRoll == 6 {
                    if emojiCardInPlay?.shield == 0 {
                        emojiCardInPlay?.curentHealth -= (OScardInPlay?.attackStrangthHigh)!
                    } else if (emojiCardInPlay?.shield)! > 0 && (emojiCardInPlay?.shield)! < (OScardInPlay?.attackStrangthHigh)! {
                        emojiCardInPlay?.shield = 0
                        emojiCardInPlay?.curentHealth -= ((OScardInPlay?.attackStrangthHigh)! - (emojiCardInPlay?.shield)!)
                    } else {emojiCardInPlay?.shield -= (OScardInPlay?.attackStrangthHigh)!}
                    
                }
            }
    }
    
    func plus50SheldForEIP () {
        emojiCardInPlay?.shield += 50
    }
    func plus50SheldForOS()  {
        OScardInPlay?.shield += 50
    }
    
    // This init puts the cards in the deck
    init    (ECard1:Card,ECard2:Card,ECard3:Card,ECard4:Card,ECard5:Card,
             ECard6:Card,ECard7:Card,ECard8:Card,ECard9:Card) {
        
        emojiCardsDeck.append(ECard1)
        emojiCardsDeck.append(ECard2)
        emojiCardsDeck.append(ECard3)
        emojiCardsDeck.append(ECard4)
        emojiCardsDeck.append(ECard5)
        emojiCardsDeck.append(ECard6)
        emojiCardsDeck.append(ECard7)
        emojiCardsDeck.append(ECard8)
        emojiCardsDeck.append(ECard9)
        
    DrawingEmojiCardsInHand()
    DrawingEmojiCardsInHandForOS()
    OSFistcardinPlay()
        
        
    
    }

}




// all emji Cards (Deck)
    
//    
//
//    func addCardsToDeck () {
//        emojiCardsDeck.append(Tiger)
//        emojiCardsDeck.append(Lion)
//        emojiCardsDeck.append(Panda)
//        emojiCardsDeck.append(Fox)
//        emojiCardsDeck.append(Boar)
//
//        print("Num of emoji cards in deck \(emojiCardsInHand.count)")
//    }
//
//
//
//    //adding cards to Deck
//
//    init() {
//        addCardsToDeck()
//
    
        
//        for _ in 1...2 {
//            let randomNume:Int = Int(arc4random_uniform(UInt32(emojiCardsDeck.count)))
//            emojiCardsInHand.append(emojiCardsDeck[randomNume])
//            emojiCardsDeck.remove(at: randomNume)
//
//        }
//    }
//
//    func salectCard (buttonIndex:Int) {
//        cardSalected = emojiCardsInHand[buttonIndex]
//        emojiCardsInHand.remove(at: buttonIndex)
//
//    }
//
//}
