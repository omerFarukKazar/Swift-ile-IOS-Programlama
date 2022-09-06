//
//  CityDetailsVC.swift
//  CityGuide
//
//  Created by Ömer Faruk Kazar on 27.08.2022.
//

import UIKit

class CityDetailsVC: UIViewController {
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var region: UILabel!
    
    var selectedCity: Cities? //tableView'den segue gelecek olan veriyi karşılayabilmek için selectedCity adında Cities optional class değişkeni oluşturduk.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = selectedCity?.name
        region.text = selectedCity?.region
        cityImage.image = UIImage(named: selectedCity?.imageName ?? "")
        
    }

}
