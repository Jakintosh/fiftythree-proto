//
//  MainScene.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/30/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import SpriteKit
import GameplayKit
import UnityKit

class MainScene : GameScene {
    
    let player = PlayerCharacterEntity()
    
    override func didMove(to view: SKView) {
        
       super.didMove(to: view)
        
        // create player
        player.node.position = CGPoint(x: 50, y: 130)
        addEntity(player)
        
        // create floor
        let floor = Ground(windowSize: size)
        addChild(floor)
    }
    
    var movementDir: Direction = .none
    
    override func update(_ currentTime: TimeInterval) {
        
        super.update(currentTime)
        
        // get touch info
        if let cur = currentTouch, let orig = touchOrigin {
            if cur.x == orig.x {
                movementDir = .none
            } else if cur.x > orig.x {
                movementDir = .right
            } else {
                movementDir = .left
            }
            
            if CGPoint.distance(from: cur, to: orig) > 25 {
                let delta = cur - orig
                let movement = delta * 0.8
                touchOrigin! = orig + movement
            }
        }
        
        player.component(ofType: PlayerMovementComponent.self)?.setIntendedMovementDirection(direction: movementDir)
    }
}
