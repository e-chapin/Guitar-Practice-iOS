//
//  PracticeItemViewController.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/16/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit
import os.log


class PracticeItemViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var PracticeItemLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var PracticeItemInput: UITextField!
    @IBOutlet weak var NotesInput: UITextView!
    @IBOutlet weak var URLInput: UITextField!
    var placeholderLabel : UILabel!
    var practiceItem: PracticeItem?

    // MARK: - Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        os_log("cancel button was pressed", log:OSLog.default, type: .debug)
        
        // if there is a presentingViewController, this is coming from a "present as Modal"
        if presentingViewController != nil{
            dismiss(animated: true, completion: nil)
        }
        
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }else{
            fatalError("The PracticeItemViewController is not inside a navigation controller")
        }
        
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
        let notes = NotesInput.text
        let url = URLInput.text
        practiceItem = PracticeItem(name: name, notes: notes, url: url)
    
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
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    //MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PracticeItemInput.delegate = self
        
        // setup the NotesInput TextView
        NotesInput.delegate = self
        NotesInput.layer.borderWidth = 1
        NotesInput.layer.borderColor = UIColor.lightGray.cgColor
        placeholderLabel = UILabel()
        placeholderLabel.text = "Notes"
        placeholderLabel.font = UIFont.systemFont(ofSize: (NotesInput.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        NotesInput.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (NotesInput.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !NotesInput.text.isEmpty
        
        updateSaveButtonState()
        // PracticeItemLabel.text = "Practice Item 1"
        // Do any additional setup after loading the view.
        
        if let practiceItem = practiceItem {
            PracticeItemInput.text = practiceItem.name
            PracticeItemLabel.text = "Edit " + practiceItem.name
            navigationItem.title = practiceItem.name
            NotesInput.text = practiceItem.notes
            NotesInput.textColor = UIColor.black
            URLInput.text = practiceItem.url
        }
        
    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = PracticeItemInput.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        
    }
    
}
