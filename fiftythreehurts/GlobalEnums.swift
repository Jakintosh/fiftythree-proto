//
//  Global Enums.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/30/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation

enum Direction {
    case none
    case up
    case down
    case left
    case right
    
    func ToString () -> String {
        switch self {
        case .up:
            return "Up"
        case .down:
            return "Down"
        case .left:
            return "Left"
        case .right:
            return "Right"
        case .none:
            return "None"
        }
    }
    
    func Multiplier () -> Double {
        switch self {
        case .up:
            return 1
        case .down:
            return -1
        case .left:
            return -1
        case .right:
            return 1
        case .none:
            return 0
        }
    }
}
