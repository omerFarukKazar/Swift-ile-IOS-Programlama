//
//  SecondViewController.swift
//  ViewControllerProject
//
//  Created by Ömer Faruk Kazar on 25.08.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var foundedCodeLabel: UILabel!
    
    
    var keycodePassed: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foundedCodeLabel.text = keycodePassed
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view2DidApper")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("view2DidDisappear")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view2WillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("view2WillDisappear")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
