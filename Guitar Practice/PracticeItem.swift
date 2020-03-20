//
//  PracticeItem.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/16/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit
import os.log

class PracticeItem: NSObject, Codable{

    //MARK: Properties
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PracticeItems")
    
    //MARK: Coding
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(name, forKey: .name)
    }

    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      name = try container.decode(String.self, forKey: .name)
    }
    
    
    //MARK: Initialization
    init?(name: String) {
        
        if name.isEmpty{
            return nil
        }
        
        self.name = name
    }
    
}
