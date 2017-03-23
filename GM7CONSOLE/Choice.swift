//
//  Choice.swift

import SpriteKit.SKSpriteNode

class Choice: IGE {
  
  var mother: Prompt?
  var kid:  Prompt?
  
  func addKid(prompt: Prompt) {
    guard prompt !== mother else { say("ak: can't add mother as kid"); return }
    guard prompt !== self   else { say("ak: can't add self as kid")  ; return }
    guard kid == nil        else { say("ak: already have prompt")    ; return }
    
    prompt.mother = self
    kid = prompt
    _=ui_align()
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

  static func swapChoices(choice1: Choice, with choice2: Choice) {
    dbg("swapping choices \(choice1.name), \(choice2.name) ")
    guard choice1 !== choice2        else { dbg("swapChoices: c1 == c2")     ; return }
    guard let c1Mom = choice1.mother else { dbg("swapChoices: c1 has no mom"); return }
    guard let c2Mom = choice2.mother else { dbg("swapChoices: c2 has no mom"); return }

    // Determine whether we need to remove kid from choice...
    let c1kid = choice1.kid
    let c2kid = choice2.kid
    
    
    c1Mom.removeKid(choice: choice1)
    c2Mom.removeKid(choice: choice2)
    choice1.removeKid()
    choice2.removeKid()
    
    c1Mom.addKid(choice: choice2)
    c2Mom.addKid(choice: choice1)
    if c1kid != nil { choice1.addKid(prompt: c1kid!) }
    if c2kid != nil { choice2.addKid(prompt: c2kid!) }
  }
  
  func duplicate() -> Choice {
    let dupChoice = Choice(title: "copy of \(self.name!))")
    
    return dupChoice
  }
  
  func ui_align() -> Succeeded {
    // FIXME: Add verbose...
    guard let myKid = kid  else {/* dbg("align(): kid is nil"); */return false}
    
    // FIXME: Figure out a cool algo to space this based on .first and .last y value.
    myKid.position = position
    myKid.position.x += (frame.width + myKid.frame.width)
    _=myKid.ui_stackKids()
    
    return true
  }
}
