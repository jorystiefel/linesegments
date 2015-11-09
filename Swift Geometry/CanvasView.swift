//
//  CanvasView.swift
//  Swift Geometry
//
//  Created by Jory Stiefel on 11/6/15.
//  Copyright © 2015 Jory Stiefel. All rights reserved.
//

import Cocoa

class CanvasView: NSView {
    
    lazy var dataManager = {
        return CanvasDataManager.sharedManager
    }()
    
    func drawSegment(segment: LineSegment) {
        let ctx = NSGraphicsContext.currentContext()?.CGContext
        
        // Draw the endpoints
        NSColor.blackColor().setFill()
        var rect1 = CGRect(origin: segment.p1, size: CGSize(width: 1.0, height: 1.0))
        rect1 = CGRectInset(rect1, -3.0, -3.0)
        CGContextFillEllipseInRect(ctx, rect1)
        var rect2 = CGRect(origin: segment.p2, size: CGSize(width: 1.0, height: 1.0))
        rect2 = CGRectInset(rect2, -3.0, -3.0)
        CGContextFillEllipseInRect(ctx, rect2)
        
        // Draw interpolated points
        let pts = segment.pointsOnLineAtDistance(4.0)
        NSColor.grayColor().setFill()
        for pt in pts {
            let ptRect = CGRect(origin: pt, size: CGSize(width: 1.0, height: 1.0))
            NSRectFill(ptRect)
        }
        
        if dataManager.showMidpoints {
            NSColor.redColor().setFill()
            var midpointRect = CGRect(origin: segment.midpoint(), size: CGSize(width: 1.0, height: 1.0))
            midpointRect = CGRectInset(midpointRect, -2.0, -2.0)
            CGContextFillEllipseInRect(ctx, midpointRect)
        }
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        for line in dataManager.testSegments {
            drawSegment(line)
        }
        
        if let activeSegment = dataManager.activeSegment {
            drawSegment(activeSegment)
        }
    }
    
}
