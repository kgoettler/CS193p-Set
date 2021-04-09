//
//  CardShape.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//

import SwiftUI

struct CardContentShape: Shape {
    
    var shape: SetCard.SetShape
    
    func path(in rect: CGRect) -> Path {
        switch shape {
        case .diamond:
            return Diamond().path(in: rect)
        case .squiggle:
            return Squiggle().path(in: rect)
        case .oval:
            return Capsule().path(in: rect)
        }
    }
}
