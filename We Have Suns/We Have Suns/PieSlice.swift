//
//  PieSlice.swift
//  We Have Suns
//
//  Created by Natalia Terlecka on 20/02/2024.
//

import SwiftUI

struct PieSlice: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            path.closeSubpath()
        }
    }
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle.radians, endAngle.radians) }
        set {
            startAngle = Angle(radians: newValue.first)
            endAngle = Angle(radians: newValue.second)
        }
    }
}
