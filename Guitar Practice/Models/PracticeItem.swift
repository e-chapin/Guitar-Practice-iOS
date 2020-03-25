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
    var notes: String?
    var url: String?
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case notes
        case url
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PracticeItems")
    
    //MARK: Coding
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(notes, forKey: .notes)
        try container.encode(url, forKey: .url)
    }

    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      name = try container.decode(String.self, forKey: .name)
      notes = try container.decode(String.self, forKey: .notes)
      url = try container.decode(String.self, forKey: .url)
    }
    
    
    //MARK: Initialization
    init?(name: String, notes: String?, url: String?) {
        
        if name.isEmpty{
            return nil
        }
        
        self.name = name
        self.notes = notes
        self.url = url
    }
    
}
