//
//  ViewController.swift
//  GestureProjects
//
//  Created by Ömer Faruk Kazar on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var imageCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage(counter: )))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changeImage(counter: Int) {
        
        if label.text == "Istanbul" {
        imageView.image = UIImage(named: "Ankara")
        label.text = "Ankara"
        } else {
            imageView.image = UIImage(named: "Istanbul")
            label.text = "Istanbul"
        }
    }

}

