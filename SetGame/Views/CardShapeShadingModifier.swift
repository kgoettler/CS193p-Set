//
//  CardShapeShadingModifier.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//

import SwiftUI

struct CardContentShadingModifier: ViewModifier {
    
    var style: SetCard.SetShading
    var stripeWidth = 0
    
    func body(content: Content) -> some View {
        Group {
            if style == .open {
                Color.clear.mask(content)
            }
            if style == .solid {
                content
            }
            if style == .striped {
                StripedPattern(stripeWidth: stripeWidth).mask(content)
            }
                
        }
    }
}

extension View {
    func shade(style: SetCard.SetShading, stripeWidth: Int = 0) -> some View {
        self.modifier(CardContentShadingModifier(style: style, stripeWidth: stripeWidth))
    }
}
