import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    // initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 0.5)
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
            if (position.x <= -756)
            {
                Reset()
            }
        
        } else {
            if (position.y <= -756)
            {
                Reset()
            }
        }
    }
    
    override func Reset() {
        if (UIDevice.current.orientation.isPortrait)
        {
            verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
            
            horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
            
            let randomX: Int = (randomSource?.nextInt(upperBound: 524))! - 262
            position.x = CGFloat(randomX)
            
            let randomY: Int = (randomSource?.nextInt(upperBound: 20))! + 756
            position.y = CGFloat(randomY)
        } else {
            horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
            
            verticalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
            
            let randomY: Int = (randomSource?.nextInt(upperBound: 524))! - 262
            position.y = CGFloat(randomY)
            
            let randomX: Int = (randomSource?.nextInt(upperBound: 20))! + 756
            position.x = CGFloat(randomX)
        }
        
        
        isColliding = false
    
    }
    
    override func Start() {
        Reset()
        zPosition = 3
        alpha = 0.5
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
    
    
}
