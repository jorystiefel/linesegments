//
//  ViewController.swift
//  Swift Geometry
//
//  Created by Jory Stiefel on 11/6/15.
//  Copyright © 2015 Jory Stiefel. All rights reserved.
//

import Cocoa

class CanvasViewController: NSViewController {
    
    lazy var dataManager = {
        return CanvasDataManager.sharedManager
    }()
    
    var startingPoint: CGPoint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func mouseDown(theEvent: NSEvent) {
        let pt = theEvent.locationInWindow
        print("mousedown \(pt)")
        
        if let p1 = startingPoint {
            dataManager.testSegments.append(LineSegment(p1, pt));
            startingPoint = nil
            view.setNeedsDisplayInRect(view.bounds)
            print("added segment")
        } else {
            startingPoint = pt
        }
        
    }
    

}
