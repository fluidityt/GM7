//
//  Utility.swift
//  GM7
//
//  Created by justin fluidity on 3/15/17.
//  Copyright © 2017 justin fluidity. All rights reserved.
//

import SpriteKit

func newLine() {     print("\n") }
func dbg(_ string: String) { print("dbg:",string) }
func dbg(_ any: Any) { print("dbg: \(any)") }

typealias Succeeded = Bool


enum sizes {
  
  static  let
  prompt = CGSize(width:  50, height: 25),
  choice = CGSize(width: 200, height: 15)
  
  static func stretchedSize(numChildren: Int) -> CGSize {
    return CGSize(width: prompt.width, height: choice.height * 5.6)
  }
}

enum sys {
  static let scene = GameScene()
}
