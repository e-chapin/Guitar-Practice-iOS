//
//  FirstViewController.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/10/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var table: PracticeItemsTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = PracticeItemsTableViewController()
        // Do any additional setup after loading the view.
    }
}

