#linesegments

## struct LineSegment

####midpoint()
Compute the midpoint of the line segment

####slope()
Compute the slope of the line segment

####length()
Compute the length/distance between p1 and p2

####interpolatePointAtT(t: CGFloat)
Compute a point on the line segment at time `t` where `t` is between `0.0` and `1.0`

####bounds()
Compute the bounding rectangle of the line segment as a `CGRect`

####pointsOnLineAtDistance(distance: CGFloat) 

Compute an array of evenly spaced `CGPoints` on the line segment with `distance` units between each point

####translate(dX: CGFloat, dY: CGFloat)
Compute a `LineSegment` that is translated by dX, dY

####translateInPlace(dX: CGFloat, dY: CGFloat)
Translate `self` by mutating `p1` and `p2` 

---

## Auxiliary Functions

####func intersectionOfLineSegments(segment1: LineSegment, segment2: LineSegment)
Give two line segments, calculates the intersection `CGPoint?` of `segment1` and `segment2`, or returns `nil` if the segments do not intersect
