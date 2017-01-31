//
//  Extensions.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/30/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {
    
    static func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        let vector = to - from
        let magnitude = sqrt( Double(vector.x * vector.x) + Double(vector.y * vector.y))
        return CGFloat(magnitude)
    }
    
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    static func * (left: CGPoint, right: Double) -> CGPoint {
        return CGPoint(x: left.x * CGFloat(right), y: left.y - CGFloat(right))
    }
}
