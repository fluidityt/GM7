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
    addChild(node)
  }
  
  override var children: [SKNode] {
    dbg("did you mean to call .children?")
    return super.children
  }
  
  init(title: String) {
    super.init(texture: nil, color: .white, size: CGSize.zero)
    self.name = title
  }
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  func say(_ text: String) {
    print(name! + " - " + text)
  }
}
