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
    
    var remaining: Int {
        model.deck.count
    }
    
}
