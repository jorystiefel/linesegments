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
    
    private var startingPoint: CGPoint? = nil
    
    @IBOutlet weak var midpointsButton: NSButton!
    @IBOutlet weak var hintLabel: NSTextField!
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        let seconds = 3.0
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        
        hintLabel.wantsLayer = true
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 1.0
            animation.toValue = 0.0
            animation.duration = 0.35
            self.hintLabel.layer?.addAnimation(animation, forKey: "fadeout")
            self.hintLabel.layer?.opacity = 0.0
        })
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func mouseDown(theEvent: NSEvent) {
        startingPoint = theEvent.locationInWindow
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        if startingPoint != nil {
            dataManager.activeSegment = LineSegment(startingPoint!, theEvent.locationInWindow)
            view.needsDisplay = true
        }
    }
    
    override func mouseUp(theEvent: NSEvent) {
        if dataManager.activeSegment != nil {
            dataManager.testSegments.append(dataManager.activeSegment!)
            dataManager.activeSegment = nil
        }
    }
    
    @IBAction func clickedClear(sender: AnyObject) {
        dataManager.testSegments = []
        view.needsDisplay = true
    }
    
    @IBAction func clickedShowMidpoints(sender: AnyObject) {

        if midpointsButton.title == "Show Midpoints" {
            dataManager.showMidpoints = true
            midpointsButton.title = "Hide Midpoints"
        } else {
            dataManager.showMidpoints = false
            midpointsButton.title = "Show Midpoints"
        }
        view.needsDisplay = true
    }

}

