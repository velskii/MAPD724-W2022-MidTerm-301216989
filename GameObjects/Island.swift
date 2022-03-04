
import GameplayKit
import SpriteKit

class Island : GameObject
{
    // initializer
    
    init()
    {
        super.init(imageString: "island", initialScale: 1.0)
        
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
        
        if (UIDevice.current.orientation.isLandscape)
        {
            zRotation = 90
            if (position.x <= -730)
            {
                Reset()
            }
        } else {
            if (position.y <= -730)
            {
                Reset()
            }
        }
    }
    
    override func Reset() {
        if (UIDevice.current.orientation.isPortrait)
        {
            position.y = 730
            let randomX: Int = (randomSource?.nextInt(upperBound: 626))! - 313
            position.x = CGFloat(randomX)
            isColliding = false
        } else {
            position.x = 730
            let randomY: Int = (randomSource?.nextInt(upperBound: 626))! - 313
            position.y = CGFloat(randomY)
            isColliding = false
        }
        
    }
    
    override func Start() {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        if (UIDevice.current.orientation.isPortrait)
        {
            position.y -= verticalSpeed!
        } else {
            position.x -= horizontalSpeed!
        }
        
    }
    
}
