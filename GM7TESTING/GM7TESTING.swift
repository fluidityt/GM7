//
//  GM7TESTING.swift
//  GM7TESTING
//
//  Created by justin fluidity on 3/15/17.
//  Copyright © 2017 justin fluidity. All rights reserved.
//

import XCTest

class ParentingTest: XCTestCase {
  
  var
  superPrompt = Prompt(title: "Super"),
  choice1 = Choice(title: "C1"),
  prompt2 = Prompt(title: "P2"),
  choice2 = Choice(title: "C2")
  
  override func setUp() {
    super.setUp()
    dbg("new test")
    newLine()
    superPrompt = Prompt(title: "Super")
    choice1 = Choice(title: "C1")
    prompt2 = Prompt(title: "P2")
    choice2 = Choice(title: "C2")
    
    
  }
  
  override func tearDown() {
    dbg("next test")
    newLine()
    
  }
  
  func testAddChildrenPrompt() {
    superPrompt.addKid(choice: choice1)
    XCTAssert(superPrompt.kids.contains(choice1))
    XCTAssert(choice1.mother === superPrompt)
  }
  
  func testAddChildrenChoice() {
    choice1.addKid(prompt: prompt2)
    XCTAssert(choice1.kid === prompt2)
    XCTAssert(prompt2.mother === choice1)
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
}
