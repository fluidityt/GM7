//
//  Choice.swift
//  GM7

import SpriteKit

class Choice: IGE {
  
  var mother: Prompt?
  var kid:  Prompt?
  
  func addKid(prompt: Prompt) {
    guard prompt !== mother else { say("ak: can't add mother as kid"); return }
    guard prompt !== self else { say("ak: can't add self as kid"); return }
    guard kid == nil else { say("ak: already have prompt"); return }
    
    prompt.mother = self
    kid = prompt
  }
  
  func removeKid() {
    guard kid != nil else { say("rk: no kid already"); return }
    
    kid!.mother = nil
    kid = nil
  }
  
  func printKid() {
    if let kidd = kid {
      say("kid: \(kidd.name!)")
    } else { say("has no kids") }
    newLine()
  }
  
  func report() {
    if let mom = mother {
      say("has mom: \(mom.name!)")
      printKid()
    } else {
      say("has no mother")
      printKid()
    }
    newLine()
  }
}
