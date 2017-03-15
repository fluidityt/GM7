import SpriteKit

func newLine() {     print("\n") }
//
// MARK: - IGEs:
//
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

class Prompt: IGE {

  var mother: Choice?
  var kids = Set<Choice>()
  
  func addKid(choice: Choice, at index: Int = -1) {
    
    guard choice !== mother else { say("ak: can't add mother as kid"); return }
    guard choice !== self else { say("ak: can't add self as kid"); return }
    
    if kids.contains(choice) { say("ak: already have choice") }
    else {
      choice.mother = self
      kids.insert(choice)
    }
  }
  
  func removeKid(choice: Choice) {
     if kids.contains(choice) {
      choice.mother = nil
      kids.remove(choice)
     } else { say("rk: choice not found") }
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

class Choice: IGE {
  
  var mother: Prompt?
  var kid:  Prompt?
  
  func addKid(prompt: Prompt) {
    guard prompt !== mother else { say("ak: can't add mother as kid"); return }
    guard prompt !== self else { say("ak: can't add self as kid"); return }
    
    if kid != nil {
      prompt.mother = self
      kid = prompt
    } else { say("ak: already have prompt") }
  }
  
  func removeKid() {
    if kid != nil {
      kid!.mother = nil
      kid = nil
    } else { say("rk: no kid already") }
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

//
// MARK: - Buttons:
//
class Button: SKSpriteNode {
  

}

class AddButon: Button {
  
}

// TEST:
let zip = Prompt(title: "hey")
let zap = Choice(title: "hoy")
zip.addKid(choice: zap)
zip.report()
zap.report()
zip.removeKid(choice: zap)
zip.report()
zap.report()

