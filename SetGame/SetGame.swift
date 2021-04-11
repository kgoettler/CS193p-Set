//
//  SetGame.swift
//  SetGame
//
//  Created by Ken Goettler on 4/8/21.
//

import Foundation
import SwiftUI

struct SetGame {
    private(set) var deck: Array<SetCard>
    var dealtCards: Array<SetCard>
    
    init() {
        deck = Array<SetCard>()
        dealtCards = Array<SetCard>()
        var i = 0
        for count in SetCard.SetCount.allCases {
            for shape in SetCard.SetShape.allCases {
                for color in SetCard.SetColor.allCases {
                    for shading in SetCard.SetShading.allCases {
                        deck.append(SetCard(shape: shape, color: color, fill: shading, count: count, id: i))
                        i += 1
                    }
                }
            }
        }
        deck.shuffle()
        // Deal initial set of 12 cards
        for _ in 1...12 {
            dealtCards.append(self.draw()!)
        }
    }
    
    mutating func draw() -> SetCard? {
        if deck.count > 0 {
            return deck.removeFirst()
        }
        return nil
    }
    
    mutating func deal(in: Int) {
        for _ in 1...`in` {
            if let card = self.draw() {
                dealtCards.append(card)
            } else {
                break
            }
        }
    }
    
    mutating func shuffleDealtCards() {
        self.dealtCards.shuffle()
    }
    
}

///
/// Single instance of a Set game card
///
struct SetCard: Identifiable {
    var shape: SetShape
    var color: SetColor
    var fill: SetShading
    var count: SetCount
    var isSelected: Bool = false
    var isMatched: Bool = false
    var id: Int
    
    enum SetCount: Int, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }

    enum SetShape: String, CaseIterable {
        case diamond
        case oval
        case squiggle
    }

    enum SetColor: CaseIterable {
        case red
        case green
        case blue
    }

    enum SetShading: CaseIterable {
        case solid
        case striped
        case open
    }
    
}

