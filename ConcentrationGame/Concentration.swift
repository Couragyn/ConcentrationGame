//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Couragyn Chretien on 04/06/2020.
//  Copyright © 2020 Couragyn Chretien. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var chosenCards = [Int]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var scoreChange = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    scoreChange = 2
                } else {
                    if chosenCards.contains(cards[matchIndex].identifier) {
                        scoreChange = -1
                    } else {
                        chosenCards.append(cards[matchIndex].identifier)
                    }
                    if chosenCards.contains(cards[index].identifier) {
                        scoreChange = -1
                    } else {
                        chosenCards.append(cards[index].identifier)
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                scoreChange = 0
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        Card.resetIdentifier()
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
