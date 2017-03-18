//
//  UIKitStuff.swift
//  GM7

import SpriteKit

extension IGE {
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    position = touches.first!.location(in: scene!)
  }
}

extension Prompt {
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    _=ui_stackKids()
  }
}

extension Choice {
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    _=ui_align()
  }
}
