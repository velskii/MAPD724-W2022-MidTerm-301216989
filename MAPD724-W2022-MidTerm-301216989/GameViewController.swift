//
//  GameViewController.swift
//  MAPD724-W2022-MidTerm-301216989
//
//  FeiliangZhou 301216989
//  Date: March 4, 2022
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var EndLabel: UILabel!
    
    var currentScene: SKScene?
    
    override func viewDidLoad()
        {
            super.viewDidLoad()
            
            LivesLabel.isHidden = true;
            ScoreLabel.isHidden = true;
            EndLabel.isHidden = true;
            EndButton.isHidden = true;
            
            // Initialize the Lives and Score
            CollisionManager.gameViewController = self
            
            
            if ( UIDevice.current.orientation.isPortrait) {
                SetScene(sceneName: "StartScene");
            } else {
                SetScene(sceneName: "LandscapeStartScene");
            }
           
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        print("update score label ....")
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        if (ScoreManager.Lives < 1) {
            PresentEndScene()
            return
        }
        print("update lives label ....")
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func PresentStartScene() {
        
        StartButton.isHidden = false;
        StartLabel.isHidden = false;
        ScoreLabel.isHidden = true;
        LivesLabel.isHidden = true;
        
        
    }
    
    func PresentEndScene() {
        EndButton.isHidden = false;
        EndLabel.isHidden = false;
        ScoreLabel.isHidden = true;
        LivesLabel.isHidden = true;
        
        
        if ( UIDevice.current.orientation.isPortrait) {
            SetScene(sceneName: "EndScene");
        } else {
            SetScene(sceneName: "LandscapeEndScene");
        }
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        StartLabel.isHidden = true;
        StartButton.isHidden = true;
        ScoreLabel.isHidden = false;
        LivesLabel.isHidden = false;
        
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()

        if ( UIDevice.current.orientation.isPortrait) {
            SetScene(sceneName: "GameScene");
        }
        if ( UIDevice.current.orientation.isLandscape) {
            SetScene(sceneName: "LandscapeGameScene");
        }
        
        
    }
    
    @IBAction func EndButton_Pressed(_ sender: UIButton)
    {
        EndButton.isHidden = true;
        EndLabel.isHidden = true;
        
        ScoreLabel.isHidden = false;
        LivesLabel.isHidden = false;
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        if ( UIDevice.current.orientation.isPortrait) {
            SetScene(sceneName: "GameScene");
        } else {
            SetScene(sceneName: "LandscapeGameScene");
        }
        
    }
    
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView?
            {
                
                // Load the SKScene - store a reference in currentScene
                currentScene = SKScene(fileNamed: sceneName)
                
                if let gameScene = currentScene as? GameScene
                {
                    gameScene.gameManager = self
                }
                
                // Set the scale mode to scale to fit the window
                currentScene?.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(currentScene)
                
                view.ignoresSiblingOrder = true
            }
    }
    
    
    
}
    
    
