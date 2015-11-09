#LineSegments

LineSegments is a struct and set of functions for computation of useful geometerical properties of line segments. 

## struct LineSegment

####midpoint()
Compute the midpoint of the line segment

####angle()
Compute the angle of the line segment against the x-axis

####length()
Compute the length/distance between `p1` and `p2`

####interpolatePointAtT(t: CGFloat)
Compute a point on the line segment at time `t` where `0.0 <= t <= 1.0`

####bounds()
Compute the bounding rectangle of the line segment as a `CGRect`

####pointsOnLineAtDistance(distance: CGFloat) 

Compute an array of evenly spaced `CGPoints` on the line segment with `distance` units between each point

####translate(dX: CGFloat, dY: CGFloat)
Compute a `LineSegment` that is translated by dX, dY

####translateInPlace(dX: CGFloat, dY: CGFloat)
Translate `self` by mutating `p1` and `p2` 

####rotate(radians: CGFloat, aboutPoint: CGPoint)
Compute a `LineSegment` that is rotated by `radians` around the point `aboutPoint`

####rotateInPlace(radians: CGFloat, aboutPoint: CGPoint)
Rotate `self` by `radians` around the point `aboutPoint`

####intersectionPointWithLineSegment(segment: LineSegment)
Calculates the intersection `CGPoint?` of `self` and `segment`, or returns `nil` if the segments do not intersect

