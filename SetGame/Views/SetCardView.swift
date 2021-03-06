//
//  SetCardView.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//

import SwiftUI

struct SetCardView: View {
    var card: SetCard
    
    var body: some View {
        GeometryReader { geometry in
            // Prioritize filling the width
            let newHeight = geometry.size.width / cardAspectRatio
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2)
                    .fill(getCardBorderColor(card: card))
                CardContent(card: card)
            }
            .frame(width: geometry.size.width, height: newHeight)
            .offset(x: 0, y: geometry.size.height / 2 - newHeight / 2)
            .scaleEffect(card.isSelected ? CGSize(width: 1.05, height: 1.05) : CGSize(width: 1.0, height: 1.0))
            .animation(Animation.linear(duration: 0.1), value: card.isSelected)
        }
    }
    
    func getCardBorderColor(card: SetCard) -> Color {
        if let isMatched = card.isMatched {
            return isMatched ? Color.green : Color.red
        }
        return card.isSelected ? Color.black : Color.gray
    }
    
    // MARK: - UI Constants
    let cardAspectRatio: CGFloat = 12/9
}
struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetCard(shape: .squiggle, color: .purple, fill: .striped, count: .three, isMatched: true, id: 1)
        SetCardView(card: card)
    }
}
