//
//  Card.swift
//  ConcentrationGame
//
//  Created by Couragyn Chretien on 04/06/2020.
//  Copyright © 2020 Couragyn Chretien. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
