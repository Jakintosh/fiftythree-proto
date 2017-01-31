//
//  MainScene.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/30/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import Foundation
import SpriteKit

class MainScene : GameScene {
    
    let player = PlayerCharacterEntity()
    
    override func didMove(to view: SKView) {
        
       super.didMove(to: view)
        
        // create player
        player.node.position = CGPoint(x: 50, y: 130)
        addEntity(player)
        
        // create floor
        let floor = SKSpriteNode(imageNamed: "Square")
        let floorSize = CGSize(width: size.width, height: 100)
        floor.name = "flooor :)"
        floor.size = floorSize
        floor.color = .darkGray
        floor.colorBlendFactor = 1.0
        floor.position = CGPoint(x: floorSize.width / 2.0, y: floorSize.height / 2.0)
        floor.physicsBody = SKPhysicsBody(rectangleOf: floorSize)
        floor.physicsBody?.isDynamic = false
        floor.physicsBody?.categoryBitMask = PhysicsCategory.obstacle
        floor.physicsBody?.contactTestBitMask = PhysicsCategory.none
        floor.physicsBody?.collisionBitMask = PhysicsCategory.none
        addChild(floor)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        super.update(currentTime)
        
        player.component(ofType: PlayerMovementComponent.self)?.setIntendedMovementDirection(direction: movementDir)
    }
}
