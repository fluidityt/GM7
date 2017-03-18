//
//  GM7TESTING.swift

import XCTest

class ParentingTest: XCTestCase {
  
  var
  superPrompt = Prompt(title: "Super"),
  prompt1 = Prompt(title: "P1"),
  prompt2 = Prompt(title: "P2"),
  
  choice1 = Choice(title: "C1"),
  choice2 = Choice(title: "C2"),
  choice3 = Choice(title: "C3"),
  choice4 = Choice(title: "C4")
  
  override func setUp() {
    super.setUp()
    dbg("new test")
    newLine()
    
    superPrompt = Prompt(title: "Super")
    prompt1 = Prompt(title: "P1")
    prompt2 = Prompt(title: "P2")
    
    choice1 = Choice(title: "C1")
    choice2 = Choice(title: "C2")
    choice3 = Choice(title: "C3")
    choice4 = Choice(title: "C4")
  }
  
  override func tearDown() {
    newLine()
    dbg("next test")
    newLine()
  }
  
  // MARK: - Combined:
  func test_addChildren() {
    superPrompt.addKid(choice: choice1)
    XCTAssert(superPrompt.kids.contains(choice1))
    XCTAssert(choice1.mother === superPrompt)
    
    choice1.addKid(prompt: prompt2)
    XCTAssert(choice1.kid === prompt2)
    XCTAssert(prompt2.mother === choice1)
    
    let choice3 = Choice(title: "C3")
    prompt1.addKid(choice: choice1)
    prompt1.addKid(choice: choice2)
    prompt1.addKid(choice: choice3)
    XCTAssert(prompt1.kids.count == 3)
  }
  
  func test_addChildrenAtIndexPrompt() {
    superPrompt.addKid(choice: choice1)
    superPrompt.addKid(choice: choice2, 0)
    XCTAssert(superPrompt.kids[0] == choice2)
    XCTAssert(superPrompt.kids[1] == choice1)
  }
  
  func test_removeKids() {
    superPrompt.addKid(choice: choice1)
    superPrompt.removeKid(choice: choice1)
    XCTAssert(!superPrompt.kids.contains(choice1))
    XCTAssert(choice1.mother == nil)
    
    choice1.addKid(prompt: prompt2)
    choice1.removeKid()
    XCTAssert(choice1.kid == nil)
    XCTAssert(prompt2.mother == nil)
    
    let choice3 = Choice(title: "C3")
    prompt1.addKid(choice: choice1)
    prompt1.addKid(choice: choice2)
    prompt1.addKid(choice: choice3)
    XCTAssert(prompt1.kids.count == 3)
    prompt1.removeKid(choice: choice1)
    prompt1.removeKid(choice: choice2)
    prompt1.removeKid(choice: choice3)
    XCTAssert(prompt1.kids.count == 0)
    
  }
  
  func test_stackAndAlign() {
    choice1.position.x += 500
    choice1.addKid(prompt: prompt2)
    XCTAssert(prompt2.position.x == (500 + choice1.frame.width))
    
    prompt1.position.y += 250
    prompt1.addKid(choice: choice1)
    XCTAssert(choice1.position.y == 250)
    XCTAssert(prompt2.position.y == 250)
  }
  
  // MARK: - Prompt:
  func test_swapPrompt(){
    choice1.addKid(prompt: prompt1)
    choice2.addKid(prompt: prompt2)
    
    Prompt.swapPrompt(prompt1: prompt1, with: prompt2)
    XCTAssert(prompt1.mother === choice2)
    XCTAssert(prompt2.mother === choice1)
    XCTAssert(choice1.kid === prompt2)
    XCTAssert(choice2.kid === prompt1)
  }
  
  func test_ui_stackKids1() {
    XCTAssert(prompt1.ui_stackKids() == false)
    XCTAssert(prompt1.ui_stackKids(from: -1) == false)
    XCTAssert(prompt1.ui_stackKids(from:  0) == false)
    XCTAssert(prompt1.ui_stackKids(from:  1) == false)
    
    prompt1.addKid(choice: choice1)
    XCTAssert(prompt1.ui_stackKids() == true)
    XCTAssert(prompt1.ui_stackKids(from: -1) == false)
    XCTAssert(prompt1.ui_stackKids(from:  0) == true)
    XCTAssert(prompt1.ui_stackKids(from:  1) == false)
    
    prompt1.addKid(choice: choice2)
    XCTAssert(prompt1.ui_stackKids() == true)
    XCTAssert(prompt1.ui_stackKids(from:  1) == true)
  }
  
  func test_ui_stackKids2() {
    let choice3 = Choice(title: "C3")
    prompt1.addKids(choices: [choice1, choice2, choice3])
    XCTAssert(prompt1.kids.count == 3)
    
    _=prompt1.ui_stackKids()
    XCTAssert(choice1.position.y == 0);   XCTAssert(choice2.position.y == 30);
    XCTAssert(choice3.position.y == 60)
    
    let choiceInsert = Choice(title: "Inserted")
    prompt1.addKid(choice: choiceInsert)
    _=prompt1.ui_stackKids()
    XCTAssert(choice1.position.y == 0);    XCTAssert(choice3.position.y == 60)
    XCTAssert(choice2.position.y == 30);   XCTAssert(choiceInsert.position.y == 90)
    
    Choice.swapChoices(choice1: choice3, with: choiceInsert)
    _=prompt1.ui_stackKids(from: 2)
    XCTAssert(choice3.position.y == 90)
    XCTAssert(choiceInsert.position.y == 60)
    
    let choiceInsert2 = Choice(title: "Inserted2")
    prompt1.addKid(choice: choiceInsert2, 0)
    _=prompt1.ui_stackKids()
    XCTAssert(choiceInsert2.position.y == 0)
    
    prompt1.removeKid(choice: choiceInsert2)
    _=prompt1.ui_stackKids()
    XCTAssert(choice1.position.y == 0)
  }
  
  // MARK: - Choice:
  func test_swapChoice(){
    prompt1.addKid(choice: choice1)
    prompt2.addKid(choice: choice2)
    
    Choice.swapChoices(choice1: choice1, with: choice2)
    XCTAssert(choice1.mother === prompt2)
    XCTAssert(choice2.mother === prompt1)
    XCTAssert(prompt1.kids.contains(choice2))
    XCTAssert(prompt2.kids.contains(choice1))
  }
  
  func test_ui_align() {
    XCTAssert(choice1.ui_align() == false)
    
    choice1.kid = prompt2
    choice1.position.x += 2000
    choice1.position.y += 2000
    _=choice1.ui_align()
    XCTAssert(prompt2.position.x == (2000 + choice1.frame.width))
    XCTAssert(prompt2.position.y == 2000)
  }
  
}
