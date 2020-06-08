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
    let haloweenTheme: (emojis: Array<String>, backgroundColor: UIColor, cardColor: UIColor) = (["👻","🎃","🍭","🙀","👹","🦇","😱","🍫","😈", "🍬"], #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1))
    lazy var emojiChoices = haloweenTheme.emojis
    lazy var backgroundColor = haloweenTheme.backgroundColor
    lazy var cardColor = haloweenTheme.cardColor
    
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
   
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var scoreCount = 0 {
        didSet{
            scoreCountLabel.text = "Score: \(scoreCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
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
        scoreCount = 0
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card not in cardButtons")
        }
        scoreCount += game.scoreChange
        flipCount += game.flipChange
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
        let sportTheme: (emojis: Array<String>, backgroundColor: UIColor, cardColor: UIColor) = (["🎾","🏀","🏈","⚾️","⚽️","🏒","🏓","🏸","🏹", "⛳️"], #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))

        let animalTheme: (emojis: Array<String>, backgroundColor: UIColor, cardColor: UIColor) = (["🦓","🐒","🦧","🐖","🐨","🐧","🐩","🐵","🦙", "🐭"], #colorLiteral(red: 0.6679978967, green: 0.4751212597, blue: 0.2586010993, alpha: 1), #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))

        let fishTheme: (emojis: Array<String>, backgroundColor: UIColor, cardColor: UIColor) = (["🐠","🐟","🐬","🐳","🐋","🦈","🐙","🦐","🦞", "🐡"], #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))

        let toolTheme: (emojis: Array<String>, backgroundColor: UIColor, cardColor: UIColor) = (["🛠","🔧","🔨","🔩","⛏","🧰","🪓","⚒️","⚙️", "🗜"], #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1))

        let flagTheme: (emojis: Array<String>, backgroundColor: UIColor, cardColor: UIColor) = (["🇨🇦","🇹🇭","🇱🇧","🇴🇲","🇸🇧","🇬🇧","🇦🇶","🇲🇿","🇲🇽", "🇪🇺"], #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))

        
        let allEmojiChoices = ([haloweenTheme.emojis, sportTheme.emojis, animalTheme.emojis, fishTheme.emojis, toolTheme.emojis, flagTheme.emojis])
        let backgroundColors = ([haloweenTheme.backgroundColor, sportTheme.backgroundColor, animalTheme.backgroundColor, fishTheme.backgroundColor, toolTheme.backgroundColor, flagTheme.backgroundColor])
        let cardColors = ([haloweenTheme.cardColor, sportTheme.cardColor, animalTheme.cardColor, fishTheme.cardColor, toolTheme.cardColor, flagTheme.cardColor])
        
        let themeIndex = Int.random(in: 0 ..< 6)
        emojiChoices.removeAll()
        emojiChoices = allEmojiChoices[themeIndex]
        backgroundColor = backgroundColors[themeIndex]
        cardColor = cardColors[themeIndex]

        scoreCountLabel.textColor = cardColor
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


