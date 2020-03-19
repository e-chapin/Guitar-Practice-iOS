//
//  PracticeItem.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/16/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit
import os.log

class PracticeItem: NSObject, NSCoding{

    //MARK: Properties
    
    struct PropertyKey {
        static let name = "name"
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PracticeItems")
    
    //MARK: NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else{
            os_log("unable to decode the name for a PracticeItem object", log:OSLog.default, type: .debug)
            return nil
        }
        self.init(name: name)
    }
    
    var name: String
    
    //MARK: Initialization
    init?(name: String) {
        
        if name.isEmpty{
            return nil
        }
        
        self.name = name
    }
    
}
