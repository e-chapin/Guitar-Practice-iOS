//
//  PracticeItem.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/16/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit

class PracticeItem{

    //MARK: Properties
    
    var name: String
    
    //MARK: Initialization
    init?(name: String) {
        
        if name.isEmpty{
            return nil
        }
        
        self.name = name
    }
    
}
