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
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        
        for line in dataManager.testSegments {
            
            // Draw the endpoints
            NSColor.blackColor().setFill()
            let rect1 = CGRect(origin: line.p1, size: CGSize(width: 3.0, height: 3.0))
            NSRectFill(rect1)
            let rect2 = CGRect(origin: line.p2, size: CGSize(width: 3.0, height: 3.0))
            NSRectFill(rect2)
            
            // Draw interpolated points
            let pts = line.pointsOnLineAtDistance(4.0)
            NSColor.grayColor().setFill()
            for pt in pts {
                let ptRect = CGRect(origin: pt, size: CGSize(width: 2.0, height: 2.0))
                NSRectFill(ptRect)
            }
            
            // Draw the midpoint
            NSColor.greenColor().setFill()
            let midpointRect = CGRect(origin: line.midpoint(), size: CGSize(width: 3.0, height: 3.0))
            NSRectFill(midpointRect)
        }
        
    }
    
}
