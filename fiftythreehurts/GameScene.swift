//
//  GameScene.swift
//  fiftythreehurts
//
//  Created by Jak Tiano on 1/8/17.
//  Copyright © 2017 JakTiano. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	var lastFrameTime: TimeInterval = 0
	let player = PlayerCharacter()
	
	// MARK: - Scene Logic
	
	override func didMove(to view: SKView) {
		
        self.physicsWorld.gravity = CGVector.zero
        self.physicsWorld.contactDelegate = self
        
		backgroundColor = SKColor.black
		player.position = CGPoint(x: 50, y: 130)
		addChild(player)
		
		// create floor
		let floor = SKSpriteNode(imageNamed: "Square")
		let floorSize = CGSize(width: size.width, height: 100)
		floor.size = floorSize
        floor.color = .darkGray
        floor.colorBlendFactor = 1.0
		floor.position = CGPoint(x: floorSize.width / 2.0, y: floorSize.height / 2.0)
		floor.physicsBody = SKPhysicsBody(rectangleOf: floorSize)
		floor.physicsBody?.isDynamic = false
		floor.physicsBody?.categoryBitMask = Masks.obstacleCategory
        floor.physicsBody?.contactTestBitMask = Masks.none
        floor.physicsBody?.collisionBitMask = Masks.none
		addChild(floor)
	}
	override func update(_ currentTime: TimeInterval) {
		
		var dt: TimeInterval = 0
		if lastFrameTime != 0 {
			dt = currentTime - lastFrameTime
		}
		
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
		
		player.update(deltaTime: dt)
		
		lastFrameTime = currentTime
	}
	
	// MARK: - Touches
	
	var touchOrigin: CGPoint?
	var currentTouch: CGPoint?
	var movementDir: Direction = .none {
		didSet {
			player.setIntendedMovementDirection(direction: movementDir)
		}
	}
	
	func touchDown(atPoint pos : CGPoint) {

		touchOrigin = pos
		currentTouch = pos
	}
	func touchMoved(toPoint pos : CGPoint) {
		
		currentTouch = pos
	}
	func touchUp(atPoint pos : CGPoint) {

		touchOrigin = nil
		currentTouch = nil
		movementDir = .none
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchDown(atPoint: t.location(in: self)) }
	}
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
	}
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchUp(atPoint: t.location(in: self)) }
	}
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchUp(atPoint: t.location(in: self)) }
	}
}

extension GameScene : SKPhysicsContactDelegate {
    
	func didBegin(_ contact: SKPhysicsContact) {
        
        print("detected contact begin")
        
        if contact.bodyA.categoryBitMask == Masks.playerCategory {
            if contact.bodyB.categoryBitMask == Masks.obstacleCategory {
                print("player entered obstacle")
            }
        }
	}
    func didEnd(_ contact: SKPhysicsContact) {
        
        print("detected contact begin")
        
        if contact.bodyA.categoryBitMask == Masks.playerCategory {
            if contact.bodyB.categoryBitMask == Masks.obstacleCategory {
                print("player exited obstacle")
            }
        }
    }
}

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


struct Masks {
	
    static let none             : UInt32 = 0x1 << 0
    static let all              : UInt32 = UInt32.max
	static let playerCategory   : UInt32 = 0x1 << 1
	static let obstacleCategory : UInt32 = 0x1 << 2
}
