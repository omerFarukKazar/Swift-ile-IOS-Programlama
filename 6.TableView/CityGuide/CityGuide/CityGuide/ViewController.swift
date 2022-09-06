//
//  ViewController.swift
//  CityGuide
//
//  Created by Ömer Faruk Kazar on 27.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let detailsVC = CityDetailsVC()
    var citiesArray = [Cities]()
    var tappedCity: Cities?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let istanbul = Cities(name: "İstanbul", imageName: "istanbul", region: "The Marmara Region")
        let ankara = Cities(name: "Ankara", imageName: "ankara", region: "The Central Anataolia Region")
        let izmir = Cities(name: "İzmir", imageName: "izmir", region: "The Aegean Region")
        let eskisehir = Cities(name: "Eskişehir", imageName: "eskisehir", region: "The Central Anatolia Region")
        let canakkale = Cities(name: "Çanakkale", imageName: "canakkale", region: "The Aegean Region")
        citiesArray = [istanbul, ankara, izmir, eskisehir, canakkale]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = citiesArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedCity = citiesArray[indexPath.row]
        performSegue(withIdentifier: "toCityDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCityDetailsVC" {
            let destinationVC = segue.destination as! CityDetailsVC
            destinationVC.selectedCity = tappedCity
        }
    }
    
    
}

