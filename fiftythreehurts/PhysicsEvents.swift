//
//  PhysicsEvents.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import SpriteKit

struct PhysicsCategory {
    
    static let none         : UInt32 = 0x1 << 0
    static let all          : UInt32 = UInt32.max
    static let player       : UInt32 = 0x1 << 1
    static let obstacle     : UInt32 = 0x1 << 2
}

class PhysicsEvents {
    
    static var registeredBodies = Dictionary<SKPhysicsBody, PhysicsComponent>()
    
    static func registerPhysicsBody(_ body: SKPhysicsBody, with physicsComponent: PhysicsComponent) {
        
        registeredBodies[body] = physicsComponent
    }
    
    static func unregisterPhysicsBody(_ body: SKPhysicsBody) {
        
        registeredBodies.removeValue(forKey: body)
    }
    
    static func contactBegan(_ contact: SKPhysicsContact ) {
        
        registeredBodies[contact.bodyA]?.madeContact(with: contact.bodyB)
        registeredBodies[contact.bodyB]?.madeContact(with: contact.bodyA)
    }
    
    static func contactEnded(_ contact: SKPhysicsContact ) {
        
        registeredBodies[contact.bodyA]?.endedContact(with: contact.bodyB)
        registeredBodies[contact.bodyB]?.endedContact(with: contact.bodyA)
    }
}
