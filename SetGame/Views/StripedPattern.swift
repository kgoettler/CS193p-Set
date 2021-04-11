//
//  StripedPattern.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//

import SwiftUI

struct StripedPattern: Shape {
    
    var stripeWidth: Int
    
    func path(in rect: CGRect) -> Path {
        let numberOfStripes = Int(rect.height) / stripeWidth
        var path = Path()
        path.move(to: rect.origin)
        for index in 0...numberOfStripes {
            if index % 2 == 0 {
                path.addRect(CGRect(
                    x: 0,
                    y: index * stripeWidth,
                    width: Int(rect.width),
                    height: stripeWidth))
            }
        }
        return path
    }
}

struct Striped_Previews: PreviewProvider {
    static var previews: some View {
        StripedPattern(stripeWidth: 5)
    }
}
