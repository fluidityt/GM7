//
//  cm.swift
//  GM7
//
//  Created by justin fluidity on 3/13/17.
//  Copyright © 2017 justin fluidity. All rights reserved.
//

import SpriteKit

enum cm {
  
  // FIXME: there could be problems with explicit mothering
  static func addKid(_ kidPrompt: Prompt, to motherChoice: Choice) {
    kidPrompt.mother = motherChoice
    
    if kidPrompt.parent == nil { motherChoice.scene!.addChild(kidPrompt) }
    motherChoice.child = kidPrompt
    sys.currentNode = kidPrompt
    
    ui.align(motherChoice)
    
  }
  
  static func addKid(_ kidChoice: Choice, to motherPrompts: Prompt) {
    kidChoice.mother = motherPrompts
    
    if kidChoice.parent == nil { motherPrompts.scene!.addChild(kidChoice) }
    motherPrompts.childs.insert(kidChoice)
    
    sys.currentNode = kidChoice
    
    ui.draw(motherPrompts)
    ui.resize(motherPrompts)
    
  }
  
  static func addKid(_ kidChoice: Choice, to motherSuper: Super) {
    kidChoice.mother = motherSuper
    
    if kidChoice.parent == nil { motherSuper.scene!.addChild(kidChoice) }
    motherSuper.childs.insert(kidChoice)
    
    sys.currentNode = kidChoice
    
    ui.draw(motherSuper)
    ui.resize(motherSuper)
    
  }
  
  
  static func removeKid(_ theKid: IGE, from theMother: IGE) {
    
    // Please note this is reversed from pram order:
    switch (theMother, theKid) {
      
    case (let motherChoice as Choice, let kidPrompt as Prompt):
      motherChoice.child = nil
      kidPrompt.mother = nil
      kidPrompt.removeFromParent()
      
      sys.currentNode = motherChoice
      //ui.align(mother)
      
    case (let motherPromptS as IGE_CanDraw, let kidChoice as Choice):
      
      kidChoice.removeFromParent()
      kidChoice.mother = nil
      
      for child in motherPromptS.childs {
        if child === kidChoice { motherPromptS.childs.remove(kidChoice) }
      }
      
      sys.currentNode = motherPromptS
      //ui.draw(mother)
      //ui.resize(mother)
      
    default: return
    }
  }
}
