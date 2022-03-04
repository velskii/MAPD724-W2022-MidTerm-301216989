import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = 0
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
    }
    
    override func CheckBounds() {
        if(UIDevice.current.orientation.isPortrait)
        {
            if (position.y <= -773)
            {
                Reset()
            }
        } else {
            if (position.x <= -773)
            {
                Reset()
            }
        }
        
    }
    
    override func Reset() {
        if(UIDevice.current.orientation.isPortrait)
        {
            position.y = 773
        } else {
            position.x = 773
        }
        
    }
    
    override func Update()
    {
        if(UIDevice.current.orientation.isPortrait){
            Move()
        } else {
            MoveInLandscapeMode()
        }
        
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }
    
    func MoveInLandscapeMode()
    {
        position.x -= horizontalSpeed!
    }
   
}
