//
//  ViewController.swift
//  UserDefaultsProject
//
//  Created by Ömer Faruk Kazar on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedDate = UserDefaults.standard.object(forKey: "date")
        
        if let incomingNote = savedNote as? String {
            noteLabel.text = "To do: \(incomingNote)"
        }
        if let incomingDate = savedDate as? String {
            dateLabel.text = "Due date: \(incomingDate)"
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        UserDefaults.standard.set(noteTextField.text!, forKey: "note")
        UserDefaults.standard.set(dateTextField.text!, forKey: "date")
        
        noteLabel.text = "To do: \(noteTextField.text!)"
        dateLabel.text = "Due date: \(dateTextField.text!)"
        
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        noteLabel.text = "To do:"
        dateLabel.text = "Due date:"
        
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedDate = UserDefaults.standard.object(forKey: "date")
        
        if (savedNote as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "note")
        }
        if (savedDate as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "date")
        }
        
    }
    

}

// MARK: User defaults
/// Username, isLoggedIn, Highest Score gibi küçük verileri saklamak için kullanılır.
