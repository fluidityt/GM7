//
//  GameScene.swift

import SpriteKit

//
// MARK: - DMV:
//
class GameScene: SKScene {
  
  private func testMakeShitUp(){
    
    let
    p1 = Prompt(title: "P1"),
    c1 = Choice(title: "C1"),
    p2 = Prompt(title: "P2"),
    c2 = Choice(title: "C2")
    
    p1.draw()
    
  }
  
  override func didMove(to view: SKView) {

  }

}

//
// MARK: - Touches:
//
extension GameScene {
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  }
}

//
// MARK: - Update:
//
extension GameScene {
  override func update(_ currentTime: TimeInterval) {
    
  }
}

//
// MARK: - Funcs:
//
extension GameScene {
  
  func checkCollisions() {
    
    guard let currentNode = sys.currentNode else {
      print("checkCollision: curNode was nil!")
      return
    }
    
    for child in children {
      if child.name == "bkg" { continue }
      if child.name == sys.currentNode!.name { continue }
      
      
      if currentNode.frame.intersects(child.frame) {
        print("hit detected")
        // FIXME: should be IGE
        if let collidedChoice = child as? Choice {
          sys.collided = collidedChoice
        }
      }
      
    }
    // Base case:
  }
}


