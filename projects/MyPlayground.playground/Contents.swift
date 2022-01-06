import UIKit

var startTime = Date()
var now = Date()
var timeDiff: TimeInterval

timeDiff = 0

print(startTime)
timeDiff = now.timeIntervalSince(startTime)

print(timeDiff)
