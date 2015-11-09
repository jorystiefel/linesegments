//
//  CanvasDataManager.swift
//  Swift Geometry
//
//  Created by Jory Stiefel on 11/6/15.
//  Copyright © 2015 Jory Stiefel. All rights reserved.
//

import Cocoa

class CanvasDataManager {
    
    var testSegments: [LineSegment] = []
    var activeSegment: LineSegment? = nil
    var showMidpoints = false
    
    static let sharedManager = CanvasDataManager()
    
}
