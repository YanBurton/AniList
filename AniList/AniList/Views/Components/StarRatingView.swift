//
//  StarRatingView.swift
//  AniList
//
//  Created by Claudia Burton on 2022-12-08.
//

import SwiftUI


    struct StarRatingView: View {
        @Binding var value: Double
        var stars: Int = 5
        
        @State var lastCoordinateValue: CGFloat = 0.0
        
        var body: some View {
            GeometryReader { gr in
                let ratingWidth = gr.size.width * value / Double(stars)
                let starWidth = gr.size.width / Double(stars)
                //let radius = starWidth * 0.01
                
                let maxValue = gr.size.width
                let scaleFactor = maxValue / Double(stars)
                
                ZStack {
                    HStack(spacing:0) {
                        Rectangle()
                            .fill(.yellow)
                            .frame(width: ratingWidth)
                        Rectangle()
                            .fill(.clear)
                    }
                    
                    HStack(spacing:0) {
                        ForEach(1...stars, id:\.self) { _ in
                            StarShape(points: 5, cutout: true)
                                .fill(Color(.systemGray6), style: FillStyle(eoFill: true, antialiased: true))
                                .frame(width: starWidth, height: gr.size.height, alignment: .center)
                        }
                    }
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { v in
                                if (abs(v.translation.width) < 0.1) {
                                    self.lastCoordinateValue = v.location.x
                                }
                                if v.translation.width > 0 {
                                    let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                    self.value = (nextCoordinateValue / scaleFactor)
                                } else {
                                    let nextCoordinateValue = max(0.0, self.lastCoordinateValue + v.translation.width)
                                    self.value = (nextCoordinateValue / scaleFactor)
                                }
                            }
                    )
                }
            }
    }
}

    
struct StarShape: Shape {
    var points = 5
    var cutout = false
    
    func Cartesian(length:Double, angle:Double) -> CGPoint {
        return CGPoint(x: length * cos(angle),
                       y: length * sin(angle))
    }
    
    func path(in rect: CGRect) -> Path {
        // centre of the containing rect
        var center = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        // Adjust center down for odd number of sides less than 8
        if points%2 == 1 && points < 8 {
            center = CGPoint(x: center.x, y: center.y * ((Double(points) * (-0.04)) + 1.3))
        }
        
        // radius of a circle that will fit in the rect
        let outerRadius = Double(min(rect.width,rect.height)) / 2.0
        let innerRadius = outerRadius * 0.4
        let offsetAngle = (Double.pi / Double(points)) + Double.pi/2.0
        
        var vertices:[CGPoint] = []
        for i in 0..<points{
            // Calculate the angle in Radians
            let angle1 = (2.0 * Double.pi/Double(points)) * Double(i)  + offsetAngle
            let outerPoint = Cartesian(length: outerRadius, angle: angle1)
            vertices.append(CGPoint(x: outerPoint.x + center.x, y: outerPoint.y + center.y))
            
            let angle2 = (2.0 * Double.pi/Double(points)) * (Double(i) + 0.5)  + offsetAngle
            let innerPoint = Cartesian(length: (innerRadius),
                                       angle: (angle2))
            vertices.append(CGPoint(x: innerPoint.x + center.x, y: innerPoint.y + center.y))
        }
        
        let path = Path() { path in
            if cutout {
                path.addPath(Rectangle().path(in: rect))
            }
            for (n, pt) in vertices.enumerated() {
                n == 0 ? path.move(to: pt) : path.addLine(to: pt)
            }
            path.closeSubpath()
        }
        return path
    }
}
