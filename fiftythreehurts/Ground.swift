//
//  Ground.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/8/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import SpriteKit

class Ground : SKNode {
    
    let sprite: SKSpriteNode
    
    init(windowSize: CGSize) {
        sprite = SKSpriteNode(imageNamed: "Square")
        let floorSize = CGSize(width: windowSize.width, height: 100)
        sprite.name = "flooor :)"
        sprite.size = floorSize
        sprite.color = .darkGray
        sprite.colorBlendFactor = 1.0
        sprite.position = CGPoint(x: floorSize.width / 2.0, y: floorSize.height / 2.0)
        sprite.physicsBody = SKPhysicsBody(rectangleOf: floorSize)
        sprite.physicsBody?.isDynamic = false
        sprite.physicsBody?.categoryBitMask = PhysicsCategory.obstacle
        sprite.physicsBody?.contactTestBitMask = PhysicsCategory.none
        sprite.physicsBody?.collisionBitMask = PhysicsCategory.none
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
