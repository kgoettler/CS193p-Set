//
//  CardContent.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//

import SwiftUI

struct CardContent: View {
    
    var card: SetCard
    
    var body: some View {
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
    
    @ViewBuilder
    private func drawShape() -> some View {
        Group {
            CardContentShape(shape: card.shape)
                .shade(style: card.fill, stripeWidth: 3)
                .color(color: card.color)
            CardContentShape(shape: card.shape)
                .stroke(lineWidth: 3)
                .color(color: card.color)
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
    
    // MARK: - UI Parameters
    var shapeAspectRatio: CGFloat = 10/6
    var shapePaddingFactor: CGFloat = 0.8
}

struct CardContent_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        CardContent(card: game.deck[0])
    }
}
