import SpriteKit

//
// MARK: - IGEs:
//
protocol IGE {
  func getTypeOf(_ object: Any) -> String
  init(title: String)
  
}

extension IGE where Self: SKSpriteNode {
  func getTypeOf(_ object: Any) -> String { return String(describing: type(of: object)) }
  init(title: String) {
    //self.init(title: "hi")
    //self.name = title
    //getTypeOf(self) + title
  }
  
  var name: String { return "ham" }
  
}

class Prompt: SKSpriteNode, IGE {
  
  var mother: Choice?
  var childs = Set<Choice>()
  
  required init?(coder aDecoder: NSCoder) { fatalError() }
}

class Choice: SKSpriteNode, IGE {
  
  var mother: Prompt?
  var child:  Prompt
  
  required init?(coder aDecoder: NSCoder) { fatalError() }
}

//
// MARK: - Buttons:
//
protocol Button {
}

class AddButon: SKSpriteNode, Button {
  
}

// TEST:
let zip = Prompt(title: "hey")
print(zip.name!)
