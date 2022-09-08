//
//  FeedViewController.swift
//  ParsePhotoApp
//
//  Created by Ömer Faruk Kazar on 7.09.2022.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var postArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newPost"), object: nil)
    }
    @objc func getData() {
        let query = PFQuery(className: "Post")
        query.addDescendingOrder("createdAt")
        
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        self.postArray.removeAll()
                        
                        for object in objects! {
                            if let username = object.object(forKey: "Owner") as? String
                            {
                                if let description = object.object(forKey: "Description") as? String
                                {
                                    if let userImage = object.object(forKey: "Image") as? PFFileObject
                                    {
                                        let post = Post(username: username, description: description, image: userImage)
                                        self.postArray.append(post)
                                        print("\nappended")
                                    }
                                }
                            }
                        }
                        self.tableView.reloadData()
                        
                    }
                }
            }
        }
    }
    
    func errorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        
        self.present(alert, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        cell.usernameLabel.text = postArray[indexPath.row].username
        cell.descriptionLabel.text = postArray[indexPath.row].description
        //        cell.postImageView.image = postArray[indexPath.row].image
        postArray[indexPath.row].image.getDataInBackground { (data, error) in
            if error == nil {
                if let data = data {
                cell.postImageView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
    
}
