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
                SetCardView(card: card)
                .padding(5)
            }
            .padding()
        }
    }
    
    var topBar: some View {
        HStack {
            Text("Set").font(.title2).bold().padding()
            Spacer()
            Button(action: {
                viewModel.resetGame()
            }, label: {
                HStack {
                    Image(systemName: "plus.square.on.square")
                    Text("New Game")
                }.padding()
            })
        }
    }
}

struct SetCardView: View {
    var card: SetCard
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3).fill(Color.black)
            CardContent(card: card)
        }
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(viewModel: game)
    }
}