//
//  LandscapeEndScene.swift
//  MAPD724-W2022-MidTerm-301216989
//
//  Created by Feiliang Zhou
//

import SpriteKit
import GameplayKit

class LandscapeEndScene: SKScene
{
    
    // instance variables
    var ocean: Ocean?
    
    override func didMove(to view: SKView)
        {
            screenWidth = frame.width
            screenHeight = frame.height
            
            name = "END"
            
            // add ocean to the scene
            ocean = Ocean() // allocate memory
            ocean?.zRotation = 90
            ocean?.position = CGPoint(x: 773, y: 0)
            addChild(ocean!) // add the ocean to the scene
        }
        
        func touchDown(atPoint pos : CGPoint)
        {
            
        }
        
        func touchMoved(toPoint pos : CGPoint)
        {
            
        }
        
        func touchUp(atPoint pos : CGPoint)
        {
            
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
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
        
        
        override func update(_ currentTime: TimeInterval)
        {
            ocean?.Update()
            
        }
}
