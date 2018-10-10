//
//  ViewController.swift
//  Emoji Card fighting Game
//
//  Created by Fabiola Haskell on 9/4/18.
//  Copyright © 2018 Eric Haskell. All rights reserved.
//

import UIKit

//MARK:Card Object locations

let TigerCard = Card (emojiOrAction:EEmojiOrAction.Emoji , name: "Tiger", cardNote:"", emoji: "🐯", emojiType: EEmojiType.Earth, curentHealth: 120, attackStrangthLow: 8, attackStrangthMedium: 10, attackStrangthHigh: 18)

let LionCard = Card  (emojiOrAction:EEmojiOrAction.Emoji, name: "Lion", cardNote:"", emoji: "🦁", emojiType: EEmojiType.Earth, curentHealth: 134, attackStrangthLow: 6, attackStrangthMedium: 8, attackStrangthHigh: 18)

let PandaCard = Card (emojiOrAction:EEmojiOrAction.Emoji, name: "Panda",  cardNote:"", emoji: "🐼", emojiType: EEmojiType.Earth, curentHealth: 150, attackStrangthLow: 4, attackStrangthMedium: 6, attackStrangthHigh: 10)

let FoxCard = Card (emojiOrAction:EEmojiOrAction.Emoji, name: "Fox", cardNote:"", emoji: "🦊", emojiType: EEmojiType.Earth, curentHealth: 94, attackStrangthLow: 10, attackStrangthMedium: 14, attackStrangthHigh: 20)

let BoarCard = Card (emojiOrAction:EEmojiOrAction.Emoji, name: "Boar", cardNote:"", emoji: "🐗", emojiType: EEmojiType.Earth, curentHealth: 120, attackStrangthLow: 10, attackStrangthMedium: 12, attackStrangthHigh: 16)

let SharkCard = Card (emojiOrAction: EEmojiOrAction.Emoji, name: "Shark", cardNote: "Hear comes Jaws!!!", emoji: "🦈", emojiType: EEmojiType.Water, curentHealth: 120, attackStrangthLow: 8, attackStrangthMedium: 10, attackStrangthHigh: 14)

let DragonCard = Card (emojiOrAction: EEmojiOrAction.Emoji, name: "Dragon", cardNote: "I will spit flames at you!!!", emoji: "🐉", emojiType: EEmojiType.Wind, curentHealth: 100, attackStrangthLow: 13, attackStrangthMedium: 17, attackStrangthHigh: 20)

let TacoCard = Card (emojiOrAction: EEmojiOrAction.Emoji, name: "Taco", cardNote: "Yo quiero Taco Bell", emoji: "🌮", emojiType: EEmojiType.Earth, curentHealth: 200, attackStrangthLow: 5, attackStrangthMedium: 6, attackStrangthHigh: 20)

let BatCard = Card (emojiOrAction: EEmojiOrAction.Emoji, name: "Bat", cardNote: "I am Dracula", emoji: "🦇", emojiType: EEmojiType.Wind, curentHealth: 120, attackStrangthLow: 3, attackStrangthMedium: 10, attackStrangthHigh: 15)


class ViewController: UIViewController {
    
   lazy var Game = EmojiGame (ECard1:TigerCard,ECard2:LionCard, ECard3: PandaCard, ECard4: FoxCard,ECard5:BoarCard,ECard6:SharkCard,ECard7:DragonCard,ECard8:TacoCard,ECard9:BatCard)
    
    
    
// EmojiInPlay Labels
    @IBOutlet weak var emojiInPlay: UILabel!
    @IBOutlet weak var EIPName: UILabel! // EIP = emojiInPlay
    @IBOutlet weak var EIPCurentHealth: UILabel!
    @IBOutlet weak var EIPStartingHealth: UILabel!
    @IBOutlet weak var EIPShieldPercent: UILabel!
    @IBOutlet weak var EIPType: UILabel!
    @IBOutlet weak var EIPAttackStrengthLow: UILabel!
    @IBOutlet weak var EIPAttackStrengthMedium: UILabel!
    @IBOutlet weak var EIPAttackStrengthHigh: UILabel!
    
    func updateCardInPlay () {
        
        var CIPCH = 0
        if (Game.emojiCardInPlay?.curentHealth ?? 0) <= 0 {CIPCH = 0
        } else { CIPCH = (Game.emojiCardInPlay?.curentHealth ?? 0)}
        
        emojiInPlay.text = Game.emojiCardInPlay?.emoji ?? "?"
        EIPName.text = Game.emojiCardInPlay?.name ?? "?"
        EIPCurentHealth.text = String(Int(CIPCH))
        EIPStartingHealth.text = String(Int(Game.emojiCardInPlay?.startingHealth ?? 0))
        EIPShieldPercent.text = "\(Int(Game.emojiCardInPlay?.shield ?? 0))%"
        EIPType.text = Game.emojiCardInPlay?.emojiType.rawValue
        EIPAttackStrengthLow.text = String(Int(Game.emojiCardInPlay?.attackStrangthLow ?? 0))
        EIPAttackStrengthMedium.text = String(Int(Game.emojiCardInPlay?.attackStrangthMedium ?? 0))
        EIPAttackStrengthHigh.text = String(Int(Game.emojiCardInPlay?.attackStrangthHigh ?? 0))
        
        Game.emojiCardInPlay?.hasCardBeenPlayed = true
        
    
    }
    
    // Health/Shield meeter for Emoji In Play
    //Shield
    @IBOutlet weak var EIPS1: UILabel! // EIPS = EmojiInPlayShield
    @IBOutlet weak var EIPS2: UILabel!
    @IBOutlet weak var EIPS3: UILabel!
    @IBOutlet weak var EIPS4: UILabel!
    @IBOutlet weak var EIPS5: UILabel!
    @IBOutlet weak var EIPS6: UILabel!
    @IBOutlet weak var EIPS7: UILabel!
    @IBOutlet weak var EIPS8: UILabel!
    @IBOutlet weak var EIPS9: UILabel!
    @IBOutlet weak var EIPS10: UILabel!
    //Health
    @IBOutlet weak var EIPH1: UILabel! // EIPH = EmojiInPlayHealth
    @IBOutlet weak var EIPH2: UILabel!
    @IBOutlet weak var EIPH3: UILabel!
    @IBOutlet weak var EIPH4: UILabel!
    @IBOutlet weak var EIPH5: UILabel!
    @IBOutlet weak var EIPH6: UILabel!
    @IBOutlet weak var EIPH7: UILabel!
    @IBOutlet weak var EIPH8: UILabel!
    @IBOutlet weak var EIPH9: UILabel!
    @IBOutlet weak var EIPH10: UILabel!
    
    
    func updateEIPHealthMetter() {
        let Percent = Double(Game.emojiCardInPlay?.curentHealth ?? 0) / Double(Game.emojiCardInPlay?.startingHealth ?? 0)
        print(" EIP Health = \(Percent)")
        
        if Percent >= 0.1 { EIPH1.backgroundColor = UIColor.green}  else {EIPH1.backgroundColor = UIColor.clear }
        if Percent >= 0.2 {EIPH2.backgroundColor = UIColor.green}  else {EIPH2.backgroundColor = UIColor.clear }
        if Percent >= 0.3 {EIPH3.backgroundColor = UIColor.green}  else {EIPH3.backgroundColor = UIColor.clear }
        if Percent >= 0.4 {EIPH4.backgroundColor = UIColor.green}  else {EIPH4.backgroundColor = UIColor.clear }
        if Percent >= 0.5 {EIPH5.backgroundColor = UIColor.green}  else {EIPH5.backgroundColor = UIColor.clear }
        if Percent >= 0.6 {EIPH6.backgroundColor = UIColor.green}  else {EIPH6.backgroundColor = UIColor.clear }
        if Percent >= 0.7 {EIPH7.backgroundColor = UIColor.green}  else {EIPH7.backgroundColor = UIColor.clear }
        if Percent >= 0.8 {EIPH8.backgroundColor = UIColor.green}  else {EIPH8.backgroundColor = UIColor.clear }
        if Percent >= 0.9 {EIPH9.backgroundColor = UIColor.green}  else {EIPH9.backgroundColor = UIColor.clear }
        if Percent >= 1.0 {EIPH10.backgroundColor = UIColor.green}  else {EIPH10.backgroundColor = UIColor.clear }
    }
    
    func updateEIPShield () {
        let Percent = Double(Game.emojiCardInPlay?.shield ?? 0) / Double(100)
            print("EIP Shield = \(Percent)")
        
        if Percent >= 0.1 { EIPS1.backgroundColor = UIColor.blue}   else {EIPS1.backgroundColor = UIColor.clear }
        if Percent >= 0.2 {EIPS2.backgroundColor = UIColor.blue}   else {EIPS2.backgroundColor = UIColor.clear }
        if Percent >= 0.3 {EIPS3.backgroundColor = UIColor.blue}   else {EIPS3.backgroundColor = UIColor.clear }
        if Percent >= 0.4 {EIPS4.backgroundColor = UIColor.blue}   else {EIPS4.backgroundColor = UIColor.clear }
        if Percent >= 0.5 {EIPS5.backgroundColor = UIColor.blue}   else {EIPS5.backgroundColor = UIColor.clear }
        if Percent >= 0.6 {EIPS6.backgroundColor = UIColor.blue}   else {EIPS6.backgroundColor = UIColor.clear }
        if Percent >= 0.7 {EIPS7.backgroundColor = UIColor.blue}   else {EIPS7.backgroundColor = UIColor.clear }
        if Percent >= 0.8 {EIPS8.backgroundColor = UIColor.blue}   else {EIPS8.backgroundColor = UIColor.clear }
        if Percent >= 0.9 {EIPS9.backgroundColor = UIColor.blue}   else {EIPS9.backgroundColor = UIColor.clear }
        if Percent >= 1.0 {EIPS10.backgroundColor = UIColor.blue}   else {EIPS10.backgroundColor = UIColor.clear }
    }
    
    
    
    
    // EmojiInPlay stuff that should not be a label
    @IBOutlet weak var H: UILabel!
    @IBOutlet weak var S: UILabel!
    
    
//OtherSideEmojiInPlay Labels
    @IBOutlet weak var otherSideEmojiInPlay: UILabel!
    @IBOutlet weak var OSEIPName: UILabel! //OSEIP = otherSideEmojiInPlay
    @IBOutlet weak var OSEIPType: UILabel!
   
    @IBOutlet weak var OSEIPCurentHealth: UILabel!
    @IBOutlet weak var OSEIPStartingHealth: UILabel!
    @IBOutlet weak var OSEIPShieldPercent: UILabel!
    
    func updateOSCardInPlay () {
        var OCCH = 0
        if (Game.OScardInPlay?.curentHealth ?? 0) <= 0 {OCCH = 0
        } else { OCCH = (Game.OScardInPlay?.curentHealth ?? 0)}
        
        otherSideEmojiInPlay.text = Game.OScardInPlay?.emoji ?? ""
        OSEIPName.text = Game.OScardInPlay?.name ?? ""
        OSEIPType.text = Game.OScardInPlay?.emojiType.rawValue ?? ""
        OSEIPCurentHealth.text = String(Int(OCCH))
        OSEIPStartingHealth.text = String(Int(Game.OScardInPlay?.startingHealth ?? 0))
        OSEIPShieldPercent.text = String(Int(Game.OScardInPlay?.shield ?? 0))
        
        
        Game.OScardInPlay?.hasCardBeenPlayed = true
        
//        updateOSShield()
//        updateOSHealthMetter()
        
        
    }
    
    //OS Card Display
    @IBOutlet weak var OSCard1: UILabel!
    @IBOutlet weak var OSCard2: UILabel!
    @IBOutlet weak var OSCard3: UILabel!
    @IBOutlet weak var OSCard4: UILabel!
    
    func updateOSCardDisplay() {
        if Game.OSemojiCardsInHand[0].curentHealth <= 0{ OSCard1.text = "❌"
        }else if Game.OSemojiCardsInHand[0].hasCardBeenPlayed == true { OSCard1.text = String(Game.OSemojiCardsInHand[0].emoji)}
       
         if Game.OSemojiCardsInHand[1].curentHealth <= 0{ OSCard2.text = "❌"
        }else if Game.OSemojiCardsInHand[1].hasCardBeenPlayed == true { OSCard2.text = String(Game.OSemojiCardsInHand[1].emoji)}
        
         if Game.OSemojiCardsInHand[2].curentHealth <= 0{ OSCard3.text = "❌"
        }else if Game.OSemojiCardsInHand[2].hasCardBeenPlayed == true { OSCard3.text = String(Game.OSemojiCardsInHand[2].emoji)}
        
         if Game.OSemojiCardsInHand[3].curentHealth <= 0{ OSCard4.text = "❌"
        }else if Game.OSemojiCardsInHand[3].hasCardBeenPlayed == true { OSCard4.text = String(Game.OSemojiCardsInHand[3].emoji)}

    }
    
    
    //Other Side Health/Shield bar
    //Shield
    @IBOutlet weak var OSS1: UILabel!
    @IBOutlet weak var OSS2: UILabel!
    @IBOutlet weak var OSS3: UILabel!
    @IBOutlet weak var OSS4: UILabel!
    @IBOutlet weak var OSS5: UILabel!
    @IBOutlet weak var OSS6: UILabel!
    @IBOutlet weak var OSS7: UILabel!
    @IBOutlet weak var OSS8: UILabel!
    @IBOutlet weak var OSS9: UILabel!
    @IBOutlet weak var OSS10: UILabel!
    //Health
    @IBOutlet weak var OSH1: UILabel!
    @IBOutlet weak var OSH2: UILabel!
    @IBOutlet weak var OSH3: UILabel!
    @IBOutlet weak var OSH4: UILabel!
    @IBOutlet weak var OSH5: UILabel!
    @IBOutlet weak var OSH6: UILabel!
    @IBOutlet weak var OSH7: UILabel!
    @IBOutlet weak var OSH8: UILabel!
    @IBOutlet weak var OSH9: UILabel!
    @IBOutlet weak var OSH10: UILabel!
    
    func updateOSHealthMetter() {
        let Percent = Double(Game.OScardInPlay?.curentHealth ?? 0) / Double(Game.OScardInPlay?.startingHealth ?? 0)
        print("OS Health = \(Percent)")
        
        if Percent >= 0.1 { OSH1.backgroundColor = UIColor.green} else {OSH1.backgroundColor = UIColor.clear }
        if Percent >= 0.2 {OSH2.backgroundColor = UIColor.green} else {OSH2.backgroundColor = UIColor.clear }
        if Percent >= 0.3 {OSH3.backgroundColor = UIColor.green}  else {OSH3.backgroundColor = UIColor.clear }
        if Percent >= 0.4 {OSH4.backgroundColor = UIColor.green}  else {OSH4.backgroundColor = UIColor.clear }
        if Percent >= 0.5 {OSH5.backgroundColor = UIColor.green}  else {OSH5.backgroundColor = UIColor.clear }
        if Percent >= 0.6 {OSH6.backgroundColor = UIColor.green}  else {OSH6.backgroundColor = UIColor.clear }
        if Percent >= 0.7 {OSH7.backgroundColor = UIColor.green}  else {OSH7.backgroundColor = UIColor.clear }
        if Percent >= 0.8 {OSH8.backgroundColor = UIColor.green}  else {OSH8.backgroundColor = UIColor.clear }
        if Percent >= 0.9 {OSH9.backgroundColor = UIColor.green}  else {OSH9.backgroundColor = UIColor.clear }
        if Percent >= 1.0 {OSH10.backgroundColor = UIColor.green}  else {OSH10.backgroundColor = UIColor.clear }
    }
    
    func updateOSShield () {
        let Percent = Double(Game.OScardInPlay?.shield ?? 0) / Double(100)
            print("OS Shield = \(Percent)")
        if Percent >= 0.1 { OSS1.backgroundColor = UIColor.blue} else {OSS1.backgroundColor = UIColor.clear}
        if Percent >= 0.2 {OSS2.backgroundColor = UIColor.blue} else {OSS2.backgroundColor = UIColor.clear}
        if Percent >= 0.3 {OSS3.backgroundColor = UIColor.blue} else {OSS3.backgroundColor = UIColor.clear}
        if Percent >= 0.4 {OSS4.backgroundColor = UIColor.blue}  else {OSS4.backgroundColor = UIColor.clear}
        if Percent >= 0.5 {OSS5.backgroundColor = UIColor.blue}  else {OSS5.backgroundColor = UIColor.clear}
        if Percent >= 0.6 {OSS6.backgroundColor = UIColor.blue}  else {OSS6.backgroundColor = UIColor.clear}
        if Percent >= 0.7 {OSS7.backgroundColor = UIColor.blue}  else {OSS7.backgroundColor = UIColor.clear}
        if Percent >= 0.8 {OSS8.backgroundColor = UIColor.blue}  else {OSS8.backgroundColor = UIColor.clear}
        if Percent >= 0.9 {OSS9.backgroundColor = UIColor.blue}  else {OSS9.backgroundColor = UIColor.clear}
        if Percent >= 1.0 {OSS10.backgroundColor = UIColor.blue}  else {OSS10.backgroundColor = UIColor.clear}
    }
    
    
    
    
    
    
    //OSEIP other should not be label
    @IBOutlet weak var gameDialog: UILabel!
    @IBOutlet weak var OSH: UILabel!
    @IBOutlet weak var OSS: UILabel!
    
    
// Card Selected Labels
    @IBOutlet weak var cardSelectedEmoji: UILabel!
    @IBOutlet weak var CSName: UILabel! // CS = CardSelected
    @IBOutlet weak var CSNote: UILabel!
    @IBOutlet weak var CSType: UILabel!
    @IBOutlet weak var CSCurentHealth: UILabel!
    @IBOutlet weak var CSStartingHealth: UILabel!
    @IBOutlet weak var CSShieldPercent: UILabel!
    @IBOutlet weak var CSAttackStrengthLow: UILabel!
    @IBOutlet weak var CSAttackStrengthMedium: UILabel!
    @IBOutlet weak var CSAttackStrengthHigh: UILabel!
    
    func updateViewCardSelected () {
        cardSelectedEmoji.text = Game.cardSelected?.emoji ?? "?"
        CSName.text = Game.cardSelected?.name ?? "?"
        CSNote.text = Game.cardSelected?.cardNote ?? "?"
        CSType.text = Game.cardSelected?.emojiType.rawValue ?? "?"
        CSCurentHealth.text = String(Int(Game.cardSelected?.curentHealth ?? 0))
        CSStartingHealth.text = String(Int(Game.cardSelected?.startingHealth ?? 0))
        CSShieldPercent.text = "\(Int(Game.cardSelected?.shield ?? 0))%"
        CSAttackStrengthLow.text = String(Int(Game.cardSelected?.attackStrangthLow ?? 0))
        CSAttackStrengthMedium.text = String(Int(Game.cardSelected?.attackStrangthMedium ?? 0))
        CSAttackStrengthHigh.text = String(Int(Game.cardSelected?.attackStrangthHigh ?? 0))
        
        updateCSHealthMetter()
        updateCSShield()
        
        
    }
    
    // CS Health/Shield meater
    //Shield
    @IBOutlet weak var CSS1: UILabel!
    @IBOutlet weak var CSS2: UILabel!
    @IBOutlet weak var CSS3: UILabel!
    @IBOutlet weak var CSS4: UILabel!
    @IBOutlet weak var CSS5: UILabel!
    @IBOutlet weak var CSS6: UILabel!
    @IBOutlet weak var CSS7: UILabel!
    @IBOutlet weak var CSS8: UILabel!
    @IBOutlet weak var CSS9: UILabel!
    @IBOutlet weak var CSS10: UILabel!
    //Health
    @IBOutlet weak var CSH1: UILabel!
    @IBOutlet weak var CSH2: UILabel!
    @IBOutlet weak var CSH3: UILabel!
    @IBOutlet weak var CSH4: UILabel!
    @IBOutlet weak var CSH5: UILabel!
    @IBOutlet weak var CSH6: UILabel!
    @IBOutlet weak var CSH7: UILabel!
    @IBOutlet weak var CSH8: UILabel!
    @IBOutlet weak var CSH9: UILabel!
    @IBOutlet weak var CSH10: UILabel!
    
    func updateCSHealthMetter() {
        let Percent = Double(Game.cardSelected?.curentHealth ?? 0) / Double(Game.cardSelected?.startingHealth ?? 0)
        print("CSHealth = \(Percent)")
        
        if Percent >= 0.1 { CSH1.backgroundColor = UIColor.green} else {CSH1.backgroundColor = UIColor.clear }
        if Percent >= 0.2 {CSH2.backgroundColor = UIColor.green} else {CSH2.backgroundColor = UIColor.clear }
        if Percent >= 0.3 {CSH3.backgroundColor = UIColor.green} else {CSH3.backgroundColor = UIColor.clear }
        if Percent >= 0.4 {CSH4.backgroundColor = UIColor.green} else {CSH4.backgroundColor = UIColor.clear }
        if Percent >= 0.5 {CSH5.backgroundColor = UIColor.green} else {CSH5.backgroundColor = UIColor.clear }
        if Percent >= 0.6 {CSH6.backgroundColor = UIColor.green} else {CSH6.backgroundColor = UIColor.clear }
        if Percent >= 0.7 {CSH7.backgroundColor = UIColor.green} else {CSH7.backgroundColor = UIColor.clear }
        if Percent >= 0.8 {CSH8.backgroundColor = UIColor.green} else {CSH8.backgroundColor = UIColor.clear }
        if Percent >= 0.9 {CSH9.backgroundColor = UIColor.green} else {CSH9.backgroundColor = UIColor.clear }
        if Percent >= 1.0 {CSH10.backgroundColor = UIColor.green} else {CSH10.backgroundColor = UIColor.clear }
    }
    
    func updateCSShield () {
        let Percent = Double(Game.cardSelected?.shield ?? 0) / Double(100)

        if Percent >= 0.1 { CSS1.backgroundColor = UIColor.blue} else {CSS1.backgroundColor = UIColor.clear }
        if Percent >= 0.2 {CSS2.backgroundColor = UIColor.blue} else {CSS2.backgroundColor = UIColor.clear }
        if Percent >= 0.3 {CSS3.backgroundColor = UIColor.blue} else {CSS3.backgroundColor = UIColor.clear }
        if Percent >= 0.4 {CSS4.backgroundColor = UIColor.blue} else {CSS4.backgroundColor = UIColor.clear }
        if Percent >= 0.5 {CSS5.backgroundColor = UIColor.blue} else {CSS5.backgroundColor = UIColor.clear }
        if Percent >= 0.6 {CSS6.backgroundColor = UIColor.blue} else {CSS6.backgroundColor = UIColor.clear }
        if Percent >= 0.7 {CSS7.backgroundColor = UIColor.blue} else {CSS7.backgroundColor = UIColor.clear }
        if Percent >= 0.8 {CSS8.backgroundColor = UIColor.blue} else {CSS8.backgroundColor = UIColor.clear }
        if Percent >= 0.9 {CSS9.backgroundColor = UIColor.blue} else {CSS9.backgroundColor = UIColor.clear }
        if Percent >= 1.0 {CSS10.backgroundColor = UIColor.blue} else {CSS10.backgroundColor = UIColor.clear }
    }
    
    
    // CS other should not be a label
    @IBOutlet weak var LMH: UILabel!
    @IBOutlet weak var shield: UILabel!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var cardSelected: UILabel!

    //Dice Rold
    @IBOutlet weak var topRow1: UILabel!
    @IBOutlet weak var topRow2: UILabel!
    @IBOutlet weak var topRow3: UILabel!
    @IBOutlet weak var middleRow1: UILabel!
    @IBOutlet weak var middleRow2: UILabel!
    @IBOutlet weak var middleRow3: UILabel!
    @IBOutlet weak var bottomRow1: UILabel!
    @IBOutlet weak var bottomRow2: UILabel!
    @IBOutlet weak var bottomRow3: UILabel!
    
    func updateDice () {
        topRow1.backgroundColor = UIColor.gray; topRow2.backgroundColor = UIColor.gray; topRow3.backgroundColor = UIColor.gray
        middleRow1.backgroundColor = UIColor.gray; middleRow2.backgroundColor = UIColor.gray; middleRow3.backgroundColor = UIColor.gray
        bottomRow1.backgroundColor = UIColor.gray; bottomRow2.backgroundColor = UIColor.gray; bottomRow3.backgroundColor = UIColor.gray
        if Game.diceRollOutPut == 1 {   // maybe you could make this a loop
            topRow1.text = ""; topRow2.text = ""; topRow3.text = ""
            middleRow1.text = ""; middleRow2.text = "●"; middleRow3.text = ""
            bottomRow1.text = ""; bottomRow2.text = ""; bottomRow3.text = ""
        } else if Game.diceRollOutPut == 2 {
            topRow1.text = "●"; topRow2.text = ""; topRow3.text = ""
            middleRow1.text = ""; middleRow2.text = ""; middleRow3.text = ""
            bottomRow1.text = ""; bottomRow2.text = ""; bottomRow3.text = "●"
        } else if Game.diceRollOutPut == 3 {
            topRow1.text = "●"; topRow2.text = ""; topRow3.text = ""
            middleRow1.text = ""; middleRow2.text = "●"; middleRow3.text = ""
            bottomRow1.text = ""; bottomRow2.text = ""; bottomRow3.text = "●"
        } else if Game.diceRollOutPut == 4 {
            topRow1.text = "●"; topRow2.text = ""; topRow3.text = "●"
            middleRow1.text = ""; middleRow2.text = ""; middleRow3.text = ""
            bottomRow1.text = "●"; bottomRow2.text = ""; bottomRow3.text = "●"
        } else if Game.diceRollOutPut == 5 {
            topRow1.text = "●"; topRow2.text = ""; topRow3.text = "●"
            middleRow1.text = ""; middleRow2.text = "●"; middleRow3.text = ""
            bottomRow1.text = "●"; bottomRow2.text = ""; bottomRow3.text = "●"
        } else if Game.diceRollOutPut == 6 {
            topRow1.text = "●"; topRow2.text = ""; topRow3.text = "●"
            middleRow1.text = "●"; middleRow2.text = ""; middleRow3.text = "●"
            bottomRow1.text = "●"; bottomRow2.text = ""; bottomRow3.text = "●"
        }
    }
    // MARK:Buttons
    
    // button Options
    @IBAction func attackButton(_ sender: UIButton) {
        if Game.emojiCardInPlay?.emoji != nil && Game.OScardInPlay?.emoji != nil {
        if (Game.emojiCardInPlay?.curentHealth)! > 0 && (Game.OScardInPlay?.curentHealth)! > 0{
            
        Game.HitoneAnother(howManyTimes: 1)
        updateDice()
        updateOSCardInPlay()
        updateCardInPlay()
            
        updateOSShield()
        updateOSHealthMetter()
        
        updateEIPHealthMetter()
        updateEIPShield()
            
        updateCSHealthMetter()
        updateCSShield()
            
        updateOSCardDisplay()
            }
            }
        }
    
    @IBAction func endTurnButton(_ sender: UIButton) {
        Game.switchTurn()
        
    }
    
    @IBAction func playCard(_ sender: UIButton) {
        Game.PlayCard(emoji: (Game.cardSelected?.emoji)!)
        updateCardInPlay()
        updateOSCardInPlay()
        
        updateEIPHealthMetter()
        updateEIPShield()
        
        
    }
    
    
    //Cards in Hand
    
    //Emoji Cards
    @IBOutlet var emojiCardsInHand: [UIButton]!
    @IBAction func selectEmojiCardInHand(_ sender: UIButton) {
        if let cardSalectedInexNum:Int = emojiCardsInHand.index(of: sender) {
        Game.CardInHandSelected(Index: cardSalectedInexNum)
         
        }else { print("Chosen Card was not in array emojiCardsInHand")}
        Game.countCardLocations()
        updateViewForCardsInHand()
        
         updateViewCardSelected()
        updateOSCardDisplay()
        
        
    }
    

    //Action Cards
    @IBOutlet var actionCardsInHand: [UIButton]!
    @IBAction func selectActionCardInHand(_ sender: UIButton) {
        if actionCardsInHand.index(of: sender)! == 0 {
            Game.plus50SheldForEIP()
        } else if actionCardsInHand.index(of: sender)! == 1 {
            Game.plus50SheldForOS()
        }
        updateCSShield()
        updateEIPShield()
        updateOSShield()
    }
    
    func updateViewForCardsInHand () {
        for Index in Game.emojiCardsInHand.indices {
            let button = emojiCardsInHand[Index]
            let Card = Game.emojiCardsInHand[Index]
        
            button.setTitle(Card.emoji, for: UIControlState.normal)
            
        }
    }
    
  
 
    
    
    
    

    

//    // NOTE: this is what my enum turned int to
//
//    let emojiTypes = ["Earth","Water","Wind","Human"]
//    let CardLocation = ["Deck","Hand","Selected","Play","Dead"]
//    let emojiOrActionSelection = ["Emoji","Action"]
//
//    // MARK: Data / Card info
//    // the number represnets the index for the following
//    // Tiger = 0
//    // Lion = 1
//    // Panda = 2
//    // Fox = 3
//    //Boar = 4
//
//
//    let emojiOrAction = ["emoji","emoji","emoji","emoji","emoji"]
//    let name = ["Tiger","Lion","Panda","Fox","Boar"]
//    let cardNote = ["T","L","P","F","B"]
//    let emoji = ["🐯","🦁","🐼","🦊","🐗"]
//    let emojiType = ["Deck","Deck","Deck","Deck","Deck"]
//    let startingHealth = [120,134,150,94,120]
//
//    let attackStrangthLow = [8,6,4,10,10]
//    let attackStrangthMedium = [10,8,6,14,12]
//    let attackStrangthHigh = [18,18,10,20,16]
//
//
//
    
    
    
    
    
    
    
    
    

    
    
    
    //    enum EEmojiType:Int {
    //        case Earth = 0
    //        case Water = 1
    //        case Wind = 2
    //        case Human = 3
    //    }
    
    //
    //    enum ECardLocation:Int {
    //        case Deck = 0
    //        case Hand = 1
    //        case Selected = 2
    //        case Play = 3
    //        case Dead = 4
    //    }
    //
    //    enum EEmojiOrAction:Int {
    //        case Emoji = 0
    //        case Action = 1
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    // Emoji cars
//
//    @IBOutlet var emojiCardsInHand: [UIButton]!
//    @IBAction func selectingEmojiCardInHand(_ sender: UIButton) {
//
//        if let buttonNum = emojiCardsInHand.index(of: sender) {
//
//
//        } else { print ("Chosen Card Was not in cardButtons")}
//
//
//    // Action cards
//
//
//    //   func updateViewFromModel ()
//
//    }
    
    
   
    
 
        
    
    






























}

