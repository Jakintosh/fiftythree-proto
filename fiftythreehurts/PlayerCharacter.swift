//
//  PlayerCharacter.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/8/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import SpriteKit

class PlayerCharacter : SKNode {
    
    let MOVEMENT_SPEED: Double = 200
    var movementDirection: Direction
    
    var sprite: SKSpriteNode
    
    override init() {
        sprite = SKSpriteNode(imageNamed: "Square")
        sprite.color = SKColor.red
        sprite.colorBlendFactor = 1.0
        
        movementDirection = .none
        
        super.init()
        
        physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        physicsBody?.categoryBitMask = PhysicsCategory.player
        physicsBody?.contactTestBitMask = PhysicsCategory.obstacle
        physicsBody?.collisionBitMask = PhysicsCategory.none
        physicsBody?.isDynamic = true
        
        addChild(sprite)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PlayerCharacter doesn't support NSCoder.")
    }
    
    func setIntendedMovementDirection(direction dir: Direction) {
        
        movementDirection = dir
    }
    
    static var time: CGFloat = 0
    func update(deltaTime dt: TimeInterval) {
    
        PlayerCharacter.time += CGFloat(dt)
        
        let magnitude = MOVEMENT_SPEED * dt * movementDirection.Multiplier()
        position.x += CGFloat(magnitude)
        position.y = 130 + (sin(PlayerCharacter.time) * 10)
    }
    
    
}
