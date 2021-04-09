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
        ZStack {
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3).fill(Color.black)
            CardContent(card: card)
        }
    }
}
struct SetCardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = SetCard(shape: .squiggle, color: .blue, fill: .striped, count: .three, id: 1)
        SetCardView(card: card)
    }
}
