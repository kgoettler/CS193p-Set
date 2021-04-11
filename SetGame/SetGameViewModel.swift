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
    
    var remaining: Int {
        model.deck.count
    }
    
    func resetGame() {
        model = SetGame()
    }
    
    func deal(in: Int) {
        model.deal(in: `in`)
    }
    
    func toggleSelect(card: SetCard) {
        let index = model.dealtCards.firstIndex(matching: card)!
        model.dealtCards[index].isSelected = !model.dealtCards[index].isSelected
        if model.threeCardsSelected {
            model.handlePotentialSet()
        }
    }
}
