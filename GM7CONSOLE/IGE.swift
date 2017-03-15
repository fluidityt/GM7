//
//  IGE.swift
//  GM7

import SpriteKit

class IGE: SKSpriteNode {
  
  
  init(title: String) {
    super.init(texture: nil, color: .white, size: CGSize.zero)
    self.name = title
  }
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  func say(_ text: String) {
    print(name! + " - " + text)
  }
}
