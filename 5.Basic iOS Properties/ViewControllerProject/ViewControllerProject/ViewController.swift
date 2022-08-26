//
//  ViewController.swift
//  ViewControllerProject
//
//  Created by Ömer Faruk Kazar on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var keycodeGiven: String = " "
    
    override func viewDidLoad() { // viewDidLoad is a type of life cycle function.
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view1DidApper")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view1DidDisappear")
        textField.text = "" // Wrote this in order to clear textfield everytime we exit the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view1WillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view1WillDisappear")
    }

    @IBAction func checkButtonPressed(_ sender: UIButton) {
        
        keycodeGiven = textField.text!
        if keycodeGiven == "abcdef" {
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        } else {
            firstLabel.text = "Wrong code"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController // This is called Casting. Save this assignment value like a SecondViewController
            destinationVC.keycodePassed = keycodeGiven
        }
    }
    
}

