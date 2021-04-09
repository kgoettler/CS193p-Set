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
        let numberOfStripes = Int(rect.width) / stripeWidth
        var path = Path()
        path.move(to: rect.origin)
        for index in 0...numberOfStripes {
            if index % 2 == 0 {
                path.addRect(CGRect(
                    x: index * stripeWidth,
                    y: 0,
                    width: stripeWidth,
                    height: Int(rect.height)))
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
