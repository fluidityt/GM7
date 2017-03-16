//
//  Super.swift
//  GM7

import SpriteKit.SKSpriteNode

class Super: IGE {
  var kids: [Choice] = []
  
  func addKid(choice: Choice,_ index: Int = -50) {
    
    guard choice !== self        else { say("ak: can't add self as kid")  ; return }
    guard !kids.contains(choice) else { say("ak: already have choice")    ; return }
    
    choice.mother = self as! Prompt
    
    if index == -50 { kids.append(choice) }
    else { kids.insert(choice, at: index) }
  }
  
  func removeKid(choice: Choice) {
    guard kids.contains(choice) else { say("rk: choice not found"); return }
    choice.mother = nil
    if let found = kids.index(of:choice) { kids.remove(at:found) }
    else { say("rk: issue with index") }
  }
}
