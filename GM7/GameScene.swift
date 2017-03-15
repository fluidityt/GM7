//
//  GameScene.swift
//  GM7

import SpriteKit

let void: () = Void()

enum Modes { case swap };

enum sizes {
  
  static  let
  prompt = CGSize(width:  50, height: 25),
  choice = CGSize(width: 200, height: 15)
  
  static func stretchedSize(numChildren: Int) -> CGSize {
    return CGSize(width: prompt.width, height: choice.height * 5.6)
  }
};

enum sys {
  
  static var
  igeCounter    = 0,
  currentNode:  IGE?,                    // NP
  collided:     IGE?,
  
  isTouching: Bool = false
  
};

typealias CheckCollisions = Bool

typealias Succeeded = Bool

//
// MARK: - DMV:
//

class GameScene: SKScene {
  override func didMove(to view: SKView) {
    let zip = Prompt(title: "Hey")
    print(zip.name!)
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
  
  func swapChoices(choice1: Choice, choice2: Choice) {
    print("swapping choices")
    
    let funTuple = (choice1.color, choice1.name!)
    
    // Find parents:
    let c1mom = choice1.mother!
    let c2mom = choice2.mother!
    // remove one child
    cm.removeKid(choice1, from: c1mom)
    
    
    //    cm.addKid(choice1, to: c2mom)
    
    /*
     // Swap one:
     choice1.color = choice2.color
     choice1.name  = choice2.name!
     */
    print("list of children:"); print(c2mom.childs)
    
    /*let tempColor = choice1.color
     
     choice1.color = choice2.color
     choice2.color = tempColor
     */
    // FIXME: determine which one is further left
    //align(choice2)
  }
  
  
  func doCollision(with curNode:  IGE,
                   against collidedNode:  IGE) {
    print("doing collisions...")
    // Should probably use multi-switch here...
    // FIXME: Will need to determine which one is closest for multi-hits
    // Determine if hit node is a prompt or choice:
    if let prompt = collidedNode as? Prompt {
      // ...
      _=prompt
    }
    else if let collidedChoice = collidedNode as? Choice {
      if let curChoice = curNode as? Choice {
        swapChoices(choice1: curChoice, choice2: collidedChoice)
      }
    }
    sys.collided = nil // FIXME: not sure if this works
  }
  
  
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


