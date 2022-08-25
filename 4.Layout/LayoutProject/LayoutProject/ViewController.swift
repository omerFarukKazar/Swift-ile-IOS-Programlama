//
//  ViewController.swift
//  LayoutProject
//
//  Created by Ömer Faruk Kazar on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.width // Main view's width
        let height = view.frame.height // Main view's height values.
        
        // MARK: Label
        let myLabel = UILabel() // Creating an instance of class UILabel()
        
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.4, y: height * 0.5, width: width * 0.8, height: 60)
        view.addSubview(myLabel) // Have to add that instance to the main
        
        // MARK: Button
        let myButton = UIButton()
        
        myButton.titleLabel?.textAlignment = .center
        myButton.setTitle("Click to the button.", for: UIControl.State.normal)
        myButton.setTitleColor(.green, for: UIControl.State.focused)
        myButton.backgroundColor = .blue
        myButton.frame = CGRect(x: width * 0.5 - width * 0.4, y: height * 0.4 - 40, width: width * 0.8, height: 80)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myFunction) , for: UIControl.Event.touchUpInside)
    }
    
    // #selector is a type that refers to an Obj-C method.
    
    @IBAction func myFunction() { // @IBAction or @objc keyword makes this a obj-c method.
        print("Button Clicked")
    }

}

