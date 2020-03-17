//
//  PracticeItemViewController.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/16/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit
import os.log


class PracticeItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var PracticeItemLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var PracticeItemInput: UITextField!
    var practiceItem: PracticeItem?

    // MARK: - Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        os_log("cancel button was pressed", log:OSLog.default, type: .debug)
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else{
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = PracticeItemInput.text ?? ""
        practiceItem = PracticeItem(name: name)
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    
    //MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PracticeItemInput.delegate = self
        updateSaveButtonState()
        // PracticeItemLabel.text = "Practice Item 1"
        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = PracticeItemInput.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        
    }
    
}
