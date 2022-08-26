//
//  ViewController.swift
//  AlertControllerProject
//
//  Created by Ömer Faruk Kazar on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpClicked(_ sender: Any) {
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            print("OK Button Pressed")
        }
        
        
        if emailTextField.text == "" {
            callError(title:"Mail Error", messageInput: "Please enter your e-mail")
            
        } else   if passwordTextField.text == "" {
            callError(title: "Password Error",messageInput: "Please enter your password.")
            
        } else if passwordTextField.text != password2TextField.text {
            callError(title:"Password Error",messageInput: "Passwords don't match")
            
        } else {
            callError(title:"Success", messageInput: "Sign-Up Successful")
        }
     
        func callError(title: String, messageInput: String) {
            let warningMessage = UIAlertController(title: title, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            warningMessage.addAction(okButton)
            self.present(warningMessage, animated: true, completion: nil)
        }
        
    }
    
    
    
    
}



