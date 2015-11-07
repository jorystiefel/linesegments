import XCTest
@testable import Swift_Geometry

class Swift_LineSegmentTests: XCTestCase {
    
    func testMidpoint() {
        let segment = LineSegment(CGPoint(x: 0.0, y: 0.0), CGPoint(x: 10.0, y: 10.0))
        let actualMidpoint = CGPoint(x: 5.0, y: 5.0)
        
        XCTAssert(segment.midpoint() == actualMidpoint)
    }
    
    func testAngle() {
        // Test vertical
        let vertical = LineSegment(CGPoint(x: 0.0, y: -10.0), CGPoint(x: 0.0, y: 10.0))
        XCTAssert(vertical.angle() == CGFloat(M_PI/2))
        
        // Test horizontal
        let horizontal = LineSegment(CGPoint(x: 0.0, y: -1.0), CGPoint(x: 10.0, y: -1.0))
        XCTAssert(horizontal.angle() == 0)
        
        // Test 45deg or PI/4
        let fortyfive = LineSegment(CGPoint(x: 0.0, y: 0.0), CGPoint(x: 10.0, y: 10.0))
        XCTAssert(fortyfive.angle() == CGFloat(M_PI/4.0))
    }
    
    func testLength() {
        let segment = LineSegment(CGPoint(x: 0.0, y: -10.0), CGPoint(x: 0.0, y: 10.0))
        
        XCTAssert(segment.length() == 20.0)
    }
    
    func testTranslate() {
        var segment = LineSegment(CGPoint(x: 0.0, y: 0.0), CGPoint(x: 10.0, y: 10.0))
        segment.translateInPlace(dX: -1.0, dY: -1.0)
        
        XCTAssert(segment.p1 == CGPoint(x: -1.0, y: -1.0) && segment.p2 == CGPoint(x: 9.0, y: 9.0))
    }
    
    func testInterpolatePointAtT() {
        let segment = LineSegment(CGPoint(x: 0.0, y: 0.0), CGPoint(x: 10.0, y: 10.0))
        let point = segment.interpolatePointAtT(0.5)
        
        XCTAssert(point == CGPoint(x: 5.0, y: 5.0))
    }
    
    func testBounds() {
        let segment = LineSegment(CGPoint(x: -10.0, y: -10.0), CGPoint(x: 10.0, y: 10.0))
        
        XCTAssert(segment.bounds() == CGRect(x: -10.0, y: -10.0, width: 20.0, height: 20.0))
    }
    
    func testPointsOnLineAtDistance() {
        let segment = LineSegment(CGPoint(x: 0.0, y: 0.0), CGPoint(x: 10.0, y: 0.0))
        let pts = segment.pointsOnLineAtDistance(2.0)
        let comparePts = [
            CGPoint(x: 2.0, y: 0.0),
            CGPoint(x: 4.0, y: 0.0),
            CGPoint(x: 6.0, y: 0.0),
            CGPoint(x: 8.0, y: 0.0),
            CGPoint(x: 10.0, y: 0.0)
        ]
        
        XCTAssert(pts == comparePts)
    }
    
    func testIntersectionPointWithLineSegment() {
        // test intersection
        let segment1 = LineSegment(CGPoint(x: 0.0, y: 0.0), CGPoint(x: 10.0, y: 10.0))
        let segment2 = LineSegment(CGPoint(x: 0.0, y: 10.0), CGPoint(x: 10.0, y: 0.0))
        
        XCTAssert(segment1.intersectionPointWithLineSegment(segment2)! == CGPoint(x: 5.0, y: 5.0), "Lines should intersection at (5.0, 5.0)")
        
        // test do not intersect
        let segment3 = LineSegment(CGPoint(x: 20.0, y: 20.0), CGPoint(x: 30.0, y: 30.0))
        
        XCTAssert(segment1.intersectionPointWithLineSegment(segment3) == nil, "Lines should not intersection, expected nil")
    }
    
}