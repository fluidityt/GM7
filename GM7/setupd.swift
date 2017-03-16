//
//  setupd.swift
//  GM7
//
//  Created by justin fluidity on 3/15/17.
//  Copyright © 2017 justin fluidity. All rights reserved.
//

import Foundation

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
