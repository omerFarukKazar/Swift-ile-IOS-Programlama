//
//  ViewController.swift
//  TimersProject
//
//  Created by Ömer Faruk Kazar on 26.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var remainingTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        remainingTime = 15
        
        timerLabel.text = "Zaman: \(remainingTime)"
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    @objc func timerFunction() {
        remainingTime -= 1
        timerLabel.text = "Zaman: \(remainingTime)"
        if remainingTime == 0 {
            timerLabel.text = "Time is up!"
            timer.invalidate()
            remainingTime = 15
        }
    }
    
    
}

// MARK: Thread
/// Birden fazla işi aynı anda yapmayı sağlıyor.
/// Thread.sleep ile arayüzü kilitleyip belirlediğin saniye kadar ertelenmesini sağlayabilirsin
