//
//  SetGameView.swift
//  SetGame
//
//  Created by Ken Goettler on 4/8/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: SetGameViewModel

    var body: some View {
        VStack {
            topBar
            Grid(viewModel.dealtCards) { card in
                SetCardView(card: card).padding(5).onTapGesture {
                    withAnimation(.linear(duration: 0.05)) {
                        viewModel.toggleSelect(card: card)
                    }
                }
  
            }
        }
    }
    
    var topBar: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.75)) {
                        viewModel.resetGame()
                    }
                }, label: {
                    HStack {
                        Image(systemName: "plus.square.on.square")
                        Text("New Game")
                    }
                }).frame(maxWidth: geometry.size.width/3)
                Text("Set\nScore: \(viewModel.score)").bold().multilineTextAlignment(.center)
                    .frame(maxWidth: geometry.size.width/3)
                Button(action: {
                    viewModel.deal(in: 3)
                }, label: {
                    Text("Deal 3 Cards")
                }).frame(maxWidth: geometry.size.width / 3)
            }
        }.frame(maxHeight: 50).padding(.top)
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(viewModel: game)
    }
}
