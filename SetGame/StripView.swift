//
//  StripView.swift
//  SetGame
//
//  Created by Ken Goettler on 4/9/21.
//
import SwiftUI


struct StripView<T>: View where T: Shape {
    let numberOfStrips: Int = 5
    let lineWidth: CGFloat = 2
    let borderLineWidth: CGFloat = 1
    let color = Color.green
    let shape: T
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<numberOfStrips) { number in
                Color.white
                color.frame(width: lineWidth)
                if number == numberOfStrips - 1 {
                    Color.white
                }
            }
            
        }.mask(shape)
        .overlay(shape.stroke(color, lineWidth: borderLineWidth))
    }
}

/*
struct StripView_Previews: PreviewProvider {
    static var previews: some View {
        StripView(shape: Squiggle())
    }
}
 */


struct Stripe: ViewModifier {
    let numberOfStrips: Int = 5
    let lineWidth: CGFloat = 2
    let borderLineWidth: CGFloat = 1
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            ForEach(0..<numberOfStrips) { number in
                Color.white
                color.frame(height: lineWidth)
                if number == numberOfStrips - 1 {
                    Color.white
                }
            }
            
        }.mask(content)
    }
}

extension View {
    func stripe(color: Color) -> some View {
        self.modifier(Stripe(color: color))
    }
}

struct Stripe_Previews: PreviewProvider {
    static var previews: some View {
        Squiggle()
            .stripe(color: Color.black)
    }
}
