//
//  PlayerCharacterEntity.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/29/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import SpriteKit
import UnityKit

class PlayerCharacterEntity : GameEntity {
    
    override init () {
        super.init()
        
        node.name = "John"
        
        let sprite = SKTexture(imageNamed: "Square")
        let physicsBody = SKPhysicsBody(rectangleOf: sprite.size())
        
        addComponent(SpriteComponent(texture: sprite))
        addComponent(PhysicsComponent(withBody: physicsBody, category: PhysicsCategory.player, contactCategories: PhysicsCategory.obstacle, collisionCategories: PhysicsCategory.none))
        addComponent(PlayerMovementComponent())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("PlayerCharacter doesn't support NSCoder.")
    }
}
