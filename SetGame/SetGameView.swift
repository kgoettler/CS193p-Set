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
            Grid(viewModel.dealtCards) { card in
                SetCardView(card: card)
                .padding(5)
            }
            .padding()
        }
    }
}

struct SetCardView: View {
    var card: SetCard
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3).fill(Color.black)
                VStack {
                    drawCardContent()
                }
            }
        }
    }
    
    private func drawCardContent() -> some View {
        GeometryReader { geometry in
            let shapeCount = card.count.rawValue
            let shapeWidth = geometry.size.width * shapePaddingFactor
            let shapeHeight = geometry.size.height * shapePaddingFactor / 3
            ForEach(1..<card.count.rawValue+1) { index in
                let pos = self.getShapeCenter(in: geometry.size, count: shapeCount, index: index)
                drawShape()
                    .frame(width: shapeWidth, height:shapeHeight)
                    .position(x: pos.x,  y: pos.y)
                    .aspectRatio(shapeAspectRatio, contentMode: .fit)
            }
        }
    }
    
    private func getShapeCenter(in size: CGSize, count: Int, index: Int) -> CGPoint {
        let x = size.width / 2
        let yFactor = size.height / 6
        var y: CGFloat
        if count == 1 {
            y = yFactor * 3
        } else if count == 2 {
            y = yFactor * (CGFloat(index) * 2)
        } else {
            y = yFactor * (CGFloat(index) * 2 - 1)
        }
        return CGPoint(x: x, y: y)
    }
    
    @ViewBuilder
    private func drawShape() -> some View {
        switch card.shape {
        case .diamond:
            Diamond()
                .stroke(lineWidth: 3)
                .fill(card.color.getColor)
            Diamond()
                .fill(card.fill == SetShading.solid ? card.color.getColor : Color.white.opacity(0))
        case .oval:
            Capsule()
                .stroke(lineWidth: 3)
                .fill(card.color.getColor)
            Capsule()
                .fill(card.fill == SetShading.solid ? card.color.getColor : Color.white.opacity(0))
        case .squiggle:
            Squiggle()
                .stroke(lineWidth: 3)
                .fill(card.color.getColor)
            Squiggle()
                .fill(card.fill == SetShading.solid ? card.color.getColor : Color.white.opacity(0))
        }
    }
    
    // MARK: - UI Parameters
    var shapeAspectRatio: CGFloat = 10/6
    var shapePaddingFactor: CGFloat = 0.8
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(viewModel: game)
    }
}
