//
import SpriteKit

class Prompt: IGE {
  
  var mother: Choice?
  var kids: [Choice] = []
  
  func addKid(choice: Choice,_ index: Int = -50) {
  
    guard choice !== mother      else { say("ak: can't add mother as kid"); return }
    guard choice !== self        else { say("ak: can't add self as kid")  ; return }
    guard !kids.contains(choice) else { say("ak: already have choice")    ; return }

    choice.mother = self
    
    if index == -50 { kids.append(choice) }
    else { kids.insert(choice, at: index) }
  }
  
  func removeKid(choice: Choice) {
    guard kids.contains(choice) else { say("rk: choice not found"); return }
      choice.mother = nil
    if let found = kids.index(of:choice) { kids.remove(at:found) }
    else { say("rk: issue with index") }
  }
  
  func printKids() {
    if kids.count > 0 {
      for kid in kids { say("has kid: \(kid.name!)") }
    } else { print(name!, "has no kids") }
    newLine()
  }
  
  func report() {
    say(">>report<<")
    if let mom = mother {
      say("has mom: \(mom.name)")
      printKids()
    } else {
      say("has no mother")
      printKids()
    }
    newLine()
  }
  
  static func swapPrompt(prompt1: Prompt, with prompt2: Prompt) {
    guard prompt1 !== prompt2        else { dbg("swapPrompt: p1 == p2");      return }
    guard let p1mom = prompt1.mother else { dbg("swapPrompt: p1 has no mom"); return }
    guard let p2mom = prompt2.mother else { dbg("swapPrompt: p2 has no mom"); return }
    
    p1mom.removeKid()
    p2mom.removeKid()
    p2mom.addKid(prompt: prompt1)
    p1mom.addKid(prompt: prompt2)
  }
}

