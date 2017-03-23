//
//  GameScene.swift

import SpriteKit

//
// MARK: - DMV:
//
class GameScene: SKScene {
  
  var
  prompt1:Prompt?,  prompt2:Prompt?,
  choice1:Choice?,  choice2:Choice?,
  choice3:Choice?,  choice4:Choice?
  
  var label: SKLabelNode = SKLabelNode()
  
  private func reset() {
    prompt1 = Prompt(title: "P1");    prompt2 = Prompt(title: "P2")
    choice1 = Choice(title: "C1");    choice2 = Choice(title: "C2")
    choice3 = Choice(title: "C3");    choice4 = Choice(title: "C4")
  }
  
  private func tmakeShitUp(){
    reset()
    prompt1?.addKid(choice: choice1!)
    choice1?.addKid(prompt: prompt2!)
    prompt2?.addKids(choices: [choice2!, choice3!, choice4!])
  }
  
  private func tSwap() {
    tmakeShitUp()
    choice1?.color = .cyan
    choice2?.color = .darkGray
    
  }
  
  override func didMove(to view: SKView) {
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    print("hi")
    tSwap()
    
    cover(node: prompt1!)

  }
}

//
// MARK: - Touches:
//
extension GameScene {

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // Choice.swapChoices(choice1: choice1!, with: choice2!)
    
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
    /*
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
 */
    // Base case:
  }
}
