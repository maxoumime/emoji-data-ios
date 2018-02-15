//
//  TableGenerator.swift
//  emojidataios
//
//  Created by Maxime Bertheau on 2/15/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import emojidataios

class TableGenerator: QuickSpec {
  
  override func spec() {
    
    let table = EmojiParser.getTable()
    
    let filename = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("table.txt")
    
    do {
      try table.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    } catch {
      print("Ooops! Something went wrong: \(error)")
    }
  }
}
