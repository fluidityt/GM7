//
//  GM7TESTING.swift

import XCTest

class ParentingTest: XCTestCase {
  
  var
  superPrompt = Prompt(title: "Super"),
  prompt1 = Prompt(title: "P1"),
  choice1 = Choice(title: "C1"),
  prompt2 = Prompt(title: "P2"),
  choice2 = Choice(title: "C2")
  
  override func setUp() {
    super.setUp()
    dbg("new test")
    newLine()
    superPrompt = Prompt(title: "Super")
    prompt1 = Prompt(title: "P1")
    choice1 = Choice(title: "C1")
    prompt2 = Prompt(title: "P2")
    choice2 = Choice(title: "C2")
  }
  
  override func tearDown() {
    dbg("next test")
    newLine()
  }
  
  func testAddChildren() {
    superPrompt.addKid(choice: choice1)
    XCTAssert(superPrompt.kids.contains(choice1))
    XCTAssert(choice1.mother === superPrompt)

    choice1.addKid(prompt: prompt2)
    XCTAssert(choice1.kid === prompt2)
    XCTAssert(prompt2.mother === choice1)
  }
  
  func testAddChildrenAtIndexPrompt() {
    superPrompt.addKid(choice: choice1)
    superPrompt.addKid(choice: choice2, 0)
    XCTAssert(superPrompt.kids[0] == choice2)
    XCTAssert(superPrompt.kids[1] == choice1)
  }
  
  func testRemoveChildren() {
    superPrompt.addKid(choice: choice1)
    superPrompt.removeKid(choice: choice1)
    XCTAssert(!superPrompt.kids.contains(choice1))
    XCTAssert(choice1.mother == nil)

    choice1.addKid(prompt: prompt2)
    choice1.removeKid()
    XCTAssert(choice1.kid == nil)
    XCTAssert(prompt2.mother == nil)
  }
  
  func testSwapChoice(){
    prompt1.addKid(choice: choice1)
    prompt2.addKid(choice: choice2)
    
    Choice.swapChoices(choice1: choice1, with: choice2)
    XCTAssert(choice1.mother === prompt2)
    XCTAssert(choice2.mother === prompt1)
    XCTAssert(prompt1.kids.contains(choice2))
    XCTAssert(prompt2.kids.contains(choice1))
  }
  
  func testSwapPrompt(){
    choice1.addKid(prompt: prompt1)
    choice2.addKid(prompt: prompt2)
    
    Prompt.swapPrompt(prompt1: prompt1, with: prompt2)
    XCTAssert(prompt1.mother === choice2)
    XCTAssert(prompt2.mother === choice1)
    XCTAssert(choice1.kid === prompt2)
    XCTAssert(choice2.kid === prompt1)
  }
  
}
