//
//  IGE.swift
//  GM7

import SpriteKit

class IGE: SKSpriteNode {
  
  override var parent: SKNode? {
    dbg("did you mean to call .parent?")
    return super.parent
  }
  
  override func addChild(_ node: SKNode) {
    dbg("did you mean to call .addChild?")
    super.addChild(node)
  }
  
  override var children: [SKNode] {
    dbg("did you mean to call .children?")
    return super.children
  }
  
  init(title: String) {
    super.init(texture: nil, color: .white, size: CGSize.zero)
    
    name = title
    isUserInteractionEnabled = true
    
    let thisType = String(describing: type(of: self))
    // Test these APs:
    if      thisType.contains("Prompt") {
      size        = sizes.prompt
      color       = SKColor.green
      anchorPoint = CGPoint(x: 1, y: 0)
    }
    else if thisType.contains("Choice") {
      size        = sizes.choice
      color       = SKColor.blue
      anchorPoint = CGPoint.zero
    }
    
    sys.scene.addChild(self)
  }
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  func say(_ text: String) {
    print(name! + " - " + text)
  }
  
}
