//
//  ViewController.swift
//  ParsePhotoApp
//
//  Created by Ömer Faruk Kazar on 7.09.2022.
//

import UIKit
import Parse


class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        let parseObject = PFObject(className: "Fruits")
        //        parseObject["name"] = "Pear"
        //        parseObject["calories"] = 150
        //        parseObject.saveInBackground { (success, error) in
        //            if error != nil {
        //                print(error?.localizedDescription)
        //            } else {
        //                print("Upload is done successfully")
        //            }
        //        }
        //    }
        //
        
        //        let query = PFQuery(className: "Fruits")
        //        //query.whereKey("name", equalTo: "Apple ")
        //        query.whereKey("calories", greaterThan: 120)
        //        query.findObjectsInBackground { (objects, error) in
        //            if error != nil {
        //                print(error?.localizedDescription)
        //            } else {
        //                print(objects)
        //            }
        //        }
        
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
        if usernameTextField.text != "" && passwordTextField.text != "" {
            do {
                try PFUser.logIn(withUsername: usernameTextField.text!, password: passwordTextField.text!)
                performSegue(withIdentifier: "toTabBar", sender: nil)
            } catch {
                printErrorMessage(title: "Error", message: error.localizedDescription)
            }
        } else {
            printErrorMessage(title: "Error", message: "You should enter username and password")
        }
        
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        if usernameTextField.text != "" && passwordTextField.text != "" {
            let user = PFUser()
            user.username = usernameTextField.text!
            user.password = passwordTextField.text!
            
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.printErrorMessage(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                } else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        } else {
            printErrorMessage(title: "Error", message: "You should enter username and password")
        }
    }
    
    func printErrorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
