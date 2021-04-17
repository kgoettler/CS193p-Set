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
    var score: Int = 0
    
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
        //deck.shuffle()
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
    
    mutating func deal(in: Int, at: Int) {
        for _ in 1...`in` {
            if let card = self.draw() {
                dealtCards.insert(card, at: at)
            } else {
                break
            }
        }
    }
    
    mutating func handlePotentialSet() {
        if isSelectionSet {
            score += 1
            dealtCards.indices.filter({ dealtCards[$0].isSelected }).forEach({ dealtCards[$0].isMatched = true })
        } else {
            score -= 1
            dealtCards.indices.filter({ dealtCards[$0].isSelected }).forEach({ dealtCards[$0].isMatched = false })
        }
    }
    
    mutating func replaceMatchedCards() {
        // Remove matched cards
        var i = 0
        let insertIndex = dealtCards.indices.filter({ index in dealtCards[index].isSelected })
        repeat {
            if dealtCards[i].isSelected {
                dealtCards.remove(at: i)
            } else {
                i += 1
            }
        } while i < dealtCards.count
        // Deal three new cards
        if dealtCards.count < 12 {
            for index in insertIndex {
                deal(in: 1, at: index)
            }
        }
    }
    
    mutating func resetSelectedCards() {
        dealtCards.indices
            .filter({ dealtCards[$0].isSelected })
            .forEach({
                dealtCards[$0].isSelected = false
                dealtCards[$0].isMatched = nil
            })
    }
    
    var isSelectionSet: Bool {
        if threeCardsSelected {
            let selectedCards = dealtCards.filter({card in card.isSelected})
            let numberOfShapes = selectedCards.map({ $0.shape }).distinct().count
            let numberOfColors = selectedCards.map({ $0.color }).distinct().count
            let numberOfFills = selectedCards.map({ $0.fill }).distinct().count
            let numberOfCounts = selectedCards.map({ $0.count }).distinct().count
            if numberOfShapes != 2 && numberOfColors != 2 && numberOfFills != 2 && numberOfCounts != 2 {
                print("Set found!")
                return true
            }
        }
        return false
    }
    
    var threeCardsSelected: Bool {
        var numberOfSelectedCards: Int = 0
        for index in 0..<dealtCards.count {
            if dealtCards[index].isSelected {
                numberOfSelectedCards += 1
            }
        }
        return numberOfSelectedCards == 3
    }
    
}

extension Array where Element: Hashable {
    func distinct() -> Array<Element> {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
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
    var isMatched: Bool?
    var id: Int
    
    enum SetCount: Int, CaseIterable, Hashable {
        case one = 1
        case two = 2
        case three = 3
    }

    enum SetShape: String, CaseIterable, Hashable {
        case diamond
        case oval
        case squiggle
    }

    enum SetColor: CaseIterable, Hashable {
        case red
        case green
        case purple
    }

    enum SetShading: CaseIterable, Hashable {
        case solid
        case striped
        case open
    }
    
}

