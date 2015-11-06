//
//  LineSegments.swift
//  Swift Geometry
//
//  Created by Jory Stiefel on 11/6/15.
//  Copyright © 2015 Jory Stiefel. All rights reserved.
//

import Foundation

struct LineSegment {
    var p1: CGPoint
    var p2: CGPoint
    
    func midpoint() -> CGPoint {
        let x = (p1.x + p2.x) / 2
        let y = (p1.y + p2.y) / 2
        return CGPoint(x: x, y: y)
    }
    
    func slope() -> CGFloat {
        return atan2(p2.y - p1.y, p2.x - p1.x)
    }
    
    func length() -> CGFloat {
        return hypot(p1.x - p2.x, p1.y - p2.y)
    }
    
    func interpolatePointAtT(t: CGFloat) -> CGPoint {
        let u = 1 - t
        let x = p1.x * u + p2.x * t
        let y = p1.y * u + p2.y * t
        return CGPoint(x: x, y: y)
    }
    
    func bounds() -> CGRect {
        return CGRect(x: min(p1.x, p2.x),
                      y: min(p1.y, p2.y),
                  width: abs(p1.x - p2.x),
                 height: abs(p1.y - p2.y))
    }
    
    func pointsOnLineAtDistance(distance: CGFloat) -> [CGPoint] {
        let dX = p2.x - p1.x
        let dY = p2.y - p1.y
        let numPoints = Int(floor(self.length() / distance))
        let stepX = dX / CGFloat(numPoints)
        let stepY = dY / CGFloat(numPoints)
        var pX = p1.x + stepX
        var pY = p1.y + stepY
        
        var result: [CGPoint] = []
        for(var ix = 0; ix < numPoints; ix++) {
            result.append(CGPoint(x: pX, y: pY))
            pX += stepX
            pY += stepY
        }
        
        return result
    }
}

func intersectionOfLineSegments(segment1: LineSegment, segment2: LineSegment) -> CGPoint? {

    var result: CGPoint? = nil
    
    let ua_t = (segment2.p2.x - segment2.p1.x) * (segment1.p1.y - segment2.p1.y) - (segment2.p2.y - segment2.p1.y) * (segment1.p1.x - segment2.p1.x)
    let ub_t = (segment1.p2.x - segment1.p1.x) * (segment1.p1.y - segment2.p1.y) - (segment1.p2.y - segment1.p1.y) * (segment1.p1.x - segment2.p1.x)
    let u_b = (segment2.p2.y - segment2.p1.y) * (segment1.p2.x - segment1.p1.x) - (segment2.p2.x - segment2.p1.x) * (segment1.p2.y - segment1.p1.y)
    
    if (u_b != 0) {
        let ua = ua_t / u_b
        let ub = ub_t / u_b
        if (0 <= ua && ua <= 1 && 0 <= ub && ub <= 1) {
            result = CGPoint( x: segment1.p1.x + ua * (segment1.p2.x - segment1.p1.x),
                              y: segment1.p1.y + ua * (segment1.p2.y - segment1.p1.y))
        }
    }
    
    return result
}


