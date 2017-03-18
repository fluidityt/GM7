//
//  GameViewController.swift
//  GM7
//
//  Created by justin fluidity on 3/13/17.
//  Copyright © 2017 justin fluidity. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let view = self.view as! SKView? else { fatalError("fuckkkkk") }
    
    let scene = sys.scene
    scene.size = view.frame.size
    scene.scaleMode = .aspectFill
    
    view.presentScene(scene)
    view.ignoresSiblingOrder = true
    view.showsFPS = true
    view.showsNodeCount = true
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
