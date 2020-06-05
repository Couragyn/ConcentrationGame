//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Couragyn Chretien on 02/06/2020.
//  Copyright © 2020 Couragyn Chretien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var emoji = [Int:String]()
    var emojiChoices = ["👻","🎃","🍭","🙀","👹","🦇","😱","🍫","😈", "🍬"]
    var backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var cardColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
            
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func touchNewGameButton(_ sender: UIButton) {
        emoji.removeAll()
        setTheme()
        view.backgroundColor = backgroundColor
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        for index in cardButtons.indices {
            let button = cardButtons[index]
            button.backgroundColor = cardColor
            button.setTitle("", for: UIControl.State.normal)
        }
        flipCount = 0
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : cardColor
                
            }
        }
    }
           
    func setTheme() {
        var allEmojiChoices = ([["👻","🎃","🍭","🙀","👹","🦇","😱","🍫","😈", "🍬"]])
        var backgroundColors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        var cardColors = [#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)]
        
        allEmojiChoices.append(["🎾","🏀","🏈","⚾️","⚽️","🏒","🏓","🏸","🏹", "⛳️"])
        backgroundColors.append(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        cardColors.append(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
        
        allEmojiChoices.append(["🦓","🐒","🦧","🐖","🐨","🐧","🐩","🐵","🦙", "🐭"])
        backgroundColors.append(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))
        cardColors.append(#colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1))
        
        allEmojiChoices.append(["🐠","🐟","🐬","🐳","🐋","🦈","🐙","🦐","🦞", "🐡"])
        backgroundColors.append(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
        cardColors.append(#colorLiteral(red: 0.0147047256, green: 0.3567843264, blue: 0.01009623885, alpha: 1))
        
        allEmojiChoices.append(["🛠","🔧","🔨","🔩","⛏","🧰","🪓","⚒️","⚙️", "🗜"])
        backgroundColors.append(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        cardColors.append(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1))
        
        allEmojiChoices.append(["🇨🇦","🇹🇭","🇱🇧","🇴🇲","🇸🇧","🇬🇧","🇦🇶","🇲🇿","🇲🇽", "🇪🇺"])
        backgroundColors.append(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
        cardColors.append(#colorLiteral(red: 0.08718833829, green: 0.7493725712, blue: 0.1002399095, alpha: 1))
        
        let themeIndex = Int.random(in: 0 ..< 6)
        emojiChoices.removeAll()
        emojiChoices = allEmojiChoices[themeIndex]
        backgroundColor = backgroundColors[themeIndex]
        cardColor = cardColors[themeIndex]

        scoreLabel.textColor = cardColor
        flipCountLabel.textColor = cardColor
        newGameButton.backgroundColor = cardColor
        view.backgroundColor = backgroundColor
        for index in cardButtons.indices {
            cardButtons[index].backgroundColor = cardColor
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}


