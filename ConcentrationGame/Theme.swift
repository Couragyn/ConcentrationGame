//
//  Theme.swift
//  ConcentrationGame
//
//  Created by Couragyn Chretien on 05/06/2020.
//  Copyright © 2020 Couragyn Chretien. All rights reserved.
//

import Foundation

struct Theme {
    var emojis = [String]()
    var backgroundColor = StringLiteralType()
    var cardColor = StringLiteralType()

    init(emojis: [String], backgroundColor: StringLiteralType, cardColor: StringLiteralType) {
        self.emojis = emojis
        self.backgroundColor = backgroundColor
        self.cardColor = cardColor
    }
}
