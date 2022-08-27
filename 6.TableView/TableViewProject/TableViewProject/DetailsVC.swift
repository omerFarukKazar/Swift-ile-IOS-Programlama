//
//  DetailsVC.swift
//  TableViewProject
//
//  Created by Ömer Faruk Kazar on 26.08.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedHeroName = ""
    var selectedHeroImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: selectedHeroImageName)
        label.text = selectedHeroName
        
        
    }
    
    
    

}
