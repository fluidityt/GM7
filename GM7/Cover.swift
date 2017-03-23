//
//  Cover.swift

import SpriteKit

private final class Cover: SKSpriteNode {
  var coveringNode: SKNode
  
  init(node: SKSpriteNode) {
    coveringNode = node
    super.init(texture: nil, color: .clear, size: node.frame.size)
    node.addChild(self)
    
    anchorPoint = node.anchorPoint
    position    = node.position
    zPosition   += 1
    isUserInteractionEnabled = true
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    dbg("covering node touch")
    coveringNode.touchesBegan(touches, with: event)
  }
}

// Make the cover:
func cover(node: SKSpriteNode) {
  _=Cover(node: node)
}
