import SpriteKit

class Prompt: IGE {
  
  var mother: Choice?
  var kids: [Choice] = []
  
  func addKid(choice: Choice,_ index: Int = -50) {
    
    
    guard choice !== mother else { say("ak: can't add mother as kid"); return }
    guard choice !== self else { say("ak: can't add self as kid"); return }
    guard !kids.contains(choice) else { say("ak: already have choice"); return }

    choice.mother = self
    
    if index == -50 { kids.append(choice) }
    else { kids.insert(choice, at: index) }
  }
  
  func removeKid(choice: Choice) {
    guard kids.contains(choice) else { say("rk: choice not found"); return }
      choice.mother = nil
    if let found = kids.index(of:choice) { kids.remove(at:found) }
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
}

