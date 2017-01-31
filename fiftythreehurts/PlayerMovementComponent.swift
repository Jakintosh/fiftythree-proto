//
//  PlayerMovementComponent.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import GameplayKit

class PlayerMovementComponent : GameComponent {
    
    private let MOVEMENT_SPEED: Double = 200
    private var movementDirection: Direction = .none
    
    override func update(deltaTime seconds: TimeInterval) {
        
        let magnitude = MOVEMENT_SPEED * seconds * movementDirection.Multiplier()
        gameEntity.node.position.x += CGFloat(magnitude)
        gameEntity.node.position.y = 130 + CGFloat(sin(Time.time) * 10)
    }
    
    func setIntendedMovementDirection(direction dir: Direction) {
        
        movementDirection = dir
    }
}
