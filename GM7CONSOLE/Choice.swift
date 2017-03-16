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
    guard choice1 !== choice2        else { dbg("swapChoices: c1 == c2")     ; return }
    guard let c1Mom = choice1.mother else { dbg("swapChoices: c1 has no mom"); return }
    guard let c2Mom = choice2.mother else { dbg("swapChoices: c2 has no mom"); return }

    c1Mom.removeKid(choice: choice1)
    c2Mom.removeKid(choice: choice2)
    c1Mom.addKid(choice: choice2)
    c2Mom.addKid(choice: choice1)
  }
  
  func duplicate() -> Choice {
    let dupChoice = Choice(title: "copy of \(self.name!))")
    
    return dupChoice
  }
}
