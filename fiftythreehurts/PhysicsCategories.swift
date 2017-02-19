//
//  PhysicsCategories.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 2/18/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    
    static let none         : UInt32 = 0x1 << 0
    static let all          : UInt32 = UInt32.max
    static let player       : UInt32 = 0x1 << 1
    static let obstacle     : UInt32 = 0x1 << 2
}
