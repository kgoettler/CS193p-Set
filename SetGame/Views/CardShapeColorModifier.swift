//
//  CardShapeColorModifier.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//

import SwiftUI

struct CardContentColorModifier: ViewModifier {
    
    var color: SetCard.SetColor
    
    func body(content: Content) -> some View {
        Group {
            if color == .green {
                content.foregroundColor(Color.green)
            }
            if color == .purple {
                content.foregroundColor(Color.purple)
            }
            if color == .red {
                content.foregroundColor(Color.red)
            }
        }
    }
}

extension View {
    func color(color: SetCard.SetColor) -> some View {
        self.modifier(CardContentColorModifier(color: color))
    }
}
