//
//  SetGameApp.swift
//  SetGame
//
//  Created by Ken Goettler on 4/8/21.
//

import SwiftUI

@main
struct SetGameApp: App {
    let viewModel = SetGameViewModel()
    var body: some Scene {
        WindowGroup {
            SetGameView(viewModel: viewModel)
        }
    }
}
