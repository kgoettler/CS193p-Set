//
//  Shapes.swift
//  SetGame
//
//  Created by Ken Goettler on 4/8/21.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var p = Path()
        let width = rect.width / 2
        let height = rect.height / 2
        let points = [
            CGPoint(x: center.x + width, y: center.y),
            CGPoint(x: center.x, y:center.y + height),
            CGPoint(x: center.x - width, y:center.y),
            CGPoint(x: center.x, y:center.y - height)
        ]
        p.move(to: points[0])
        for index in 0..<points.count {
            p.addLine(to: points[index])
        }
        p.closeSubpath()
        return p
    }
}

// Borrowed temporarily from xtai on GitHub
// ref: https://github.com/xtai/CS193p-SetGame/blob/main/SetGame/SetGameView/CardView/Squiggle.swift
struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: getCGPoint(x: 0.0, y: 0.70, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.25, y: 0.05, rect: rect), control1: getCGPoint(x: 0.00, y: 0.50, rect: rect), control2: getCGPoint(x: 0.05, y: 0.05, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.65, y: 0.25, rect: rect), control1: getCGPoint(x: 0.45, y: 0.05, rect: rect), control2: getCGPoint(x: 0.50, y: 0.25, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.90, y: 0.00, rect: rect), control1: getCGPoint(x: 0.80, y: 0.25, rect: rect), control2: getCGPoint(x: 0.80, y: 0.00, rect: rect))
        p.addCurve(to: getCGPoint(x: 1.00, y: 0.30, rect: rect), control1: getCGPoint(x: 0.95, y: 0.00, rect: rect), control2: getCGPoint(x: 1.00, y: 0.10, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.75, y: 0.95, rect: rect), control1: getCGPoint(x: 1.00, y: 0.50, rect: rect), control2: getCGPoint(x: 0.95, y: 0.95, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.35, y: 0.75, rect: rect), control1: getCGPoint(x: 0.55, y: 0.95, rect: rect), control2: getCGPoint(x: 0.50, y: 0.75, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.10, y: 1.00, rect: rect), control1: getCGPoint(x: 0.20, y: 0.75, rect: rect), control2: getCGPoint(x: 0.20, y: 1.00, rect: rect))
        p.addCurve(to: getCGPoint(x: 0.00, y: 0.70, rect: rect), control1: getCGPoint(x: 0.05, y: 1.00, rect: rect), control2: getCGPoint(x: 0.00, y: 0.90, rect: rect))
        p.closeSubpath()
        return p
    }

    private func getCGPoint(x: Double, y: Double, rect: CGRect) -> CGPoint {
        return CGPoint(x: rect.origin.x + (CGFloat(x) * rect.size.width), y: rect.origin.y + (CGFloat(y) * rect.size.height))
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct ShapesView: View {
    var body: some View {
        VStack{
            Squiggle()
                .frame(width: 250, height: 150)
            Diamond()
                .stroke(Color.green)
                .frame(width: 250.0, height: 150.0)
            Capsule()
                .frame(width: 250, height: 150)
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShapesView()
        }
    }
}
