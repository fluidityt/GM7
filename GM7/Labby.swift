//
// Labby.swift

import SpriteKit

class Labby: SKSpriteNode {
  
  private let label = SKLabelNode()
  var text: String { didSet { label.text = text } }
  
  
  func fixSize() { while label.frame.width > size.width || label.frame.height > size.height { label.setScale(0.95) } }
  
  init(text: String) {
    self.text = text
    super.init(texture: nil, color: .clear, size: CGSize(width: 250, height: 20))
    //addChild(label)
    //fixSize()
    alpha = 0.4
    isUserInteractionEnabled = true
    zPosition = 10
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  
}
