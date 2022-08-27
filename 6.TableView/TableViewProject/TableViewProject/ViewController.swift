//
//  ViewController.swift
//  TableViewProject
//
//  Created by Ömer Faruk Kazar on 26.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHeroImageNames = [String]()
    var selectedHeroName = ""
    var selectedHeroImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroNames.append("Batman")
        superHeroNames.append("Superman")
        superHeroNames.append("Iron Man")
        superHeroNames.append("Spider Man")
        superHeroNames.append("Captain America")
        superHeroImageNames.append("Batman")
        superHeroImageNames.append("Superman")
        superHeroImageNames.append("Iron Man")
        superHeroImageNames.append("Spider Man")
        superHeroImageNames.append("Captain America")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            superHeroNames.remove(at: indexPath.row)
            superHeroImageNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedHeroName = superHeroNames[indexPath.row]
        selectedHeroImageName = superHeroImageNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedHeroName = selectedHeroName
            destinationVC.selectedHeroImageName = selectedHeroImageName
        }
    }
    
}

