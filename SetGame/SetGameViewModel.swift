//
//  SetGameViewModel.swift
//  SetGame
//
//  Created by Ken Goettler on 4/8/21.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published var model = SetGame()
    
    var deck: Array<SetCard> {
        model.deck
    }
    
    var dealtCards: Array<SetCard> {
        model.dealtCards
    }
    
    var score: Int {
        model.score
    }
    
    var isSelectionSet: Bool {
        model.isSelectionSet
    }
    
    func resetGame() {
        model = SetGame()
    }
    
    func deal(in: Int) {
        model.deal(in: `in`)
    }
    
    func dealButtonPressed() {
        if model.threeCardsSelected && model.isSelectionSet {
            model.handleMatchedSet()
        } else {
            model.deal(in: 3)
        }
    }
    
    func toggleSelect(card: SetCard) {
        // Before selecting the new card, check if three cards are already selected
        if model.threeCardsSelected {
            if model.isSelectionSet {
                model.handleMatchedSet()
            } else {
                model.handleUnmatchedSet()
            }
        }
        // Select new card
        let index = model.dealtCards.firstIndex(matching: card)
        // If selected card still exists, handle selection event
        if let index = index {
            model.dealtCards[index].isSelected = !model.dealtCards[index].isSelected
            // Check if this is a set
            if model.threeCardsSelected {
                model.handlePotentialSet()
            }
        }
    }
    
}
