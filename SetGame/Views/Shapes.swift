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
        let points: [Dictionary<String, CGPoint>] = [
            [
                "to":       getCGPoint(x: 0.95, y: 0.25, rect: rect),
                "control1": getCGPoint(x: 0.50, y: 0.00, rect: rect),
                "control2": getCGPoint(x: 0.95, y: 0.05, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 0.75, y: 0.65, rect: rect),
                "control1": getCGPoint(x: 0.95, y: 0.45, rect: rect),
                "control2": getCGPoint(x: 0.75, y: 0.50, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 1.00, y: 0.90, rect: rect),
                "control1": getCGPoint(x: 0.75, y: 0.80, rect: rect),
                "control2": getCGPoint(x: 1.00, y: 0.80, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 0.70, y: 1.00, rect: rect),
                "control1": getCGPoint(x: 1.00, y: 0.95, rect: rect),
                "control2": getCGPoint(x: 0.90, y: 1.00, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 0.05, y: 0.75, rect: rect),
                "control1": getCGPoint(x: 0.50, y: 1.00, rect: rect),
                "control2": getCGPoint(x: 0.05, y: 0.95, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 0.25, y: 0.35, rect: rect),
                "control1": getCGPoint(x: 0.05, y: 0.55, rect: rect),
                "control2": getCGPoint(x: 0.25, y: 0.50, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 0.00, y: 0.10, rect: rect),
                "control1": getCGPoint(x: 0.25, y: 0.20, rect: rect),
                "control2": getCGPoint(x: 0.00, y: 0.20, rect: rect)
            ],
            [
                "to":       getCGPoint(x: 0.30, y: 0.00, rect: rect),
                "control1": getCGPoint(x: 0.00, y: 0.05, rect: rect),
                "control2": getCGPoint(x: 0.10, y: 0.00, rect: rect)
            ]
        ]
        var p = Path()
        p.move(to: getCGPoint(x: 0.30, y: 0.0, rect: rect))
        for point in points {
            p.addCurve(to: point["to"]!, control1: point["control1"]!, control2: point["control2"]!)
        }
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

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack{
                Squiggle()
                    .frame(width: 50, height: 100)
                Diamond()
                    .stroke(Color.green)
                    .frame(width: 50.0, height: 100)
                Capsule()
                    .frame(width: 50, height: 100)
            }
        }
    }
}
