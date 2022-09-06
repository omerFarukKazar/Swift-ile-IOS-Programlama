//
//  FeedViewController.swift
//  PhotoShareApp
//
//  Created by Ömer Faruk Kazar on 5.09.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage
import FirebaseAuth
import SDWebImage


class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewController: UITableView!
    //    var emailArray = [String]()
    //    var descriptionArray = [String]()
    //    var imageArray = [String]()
    
    var postArray = [Post]()
    var newPost = Post(email: "", description: "", imageUrl: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableViewController.delegate = self
        tableViewController.dataSource = self
        getFirebaseData()
    }
    
    func getFirebaseData() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Post").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Unknown error")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
//                    self.emailArray.removeAll()
//                    self.imageArray.removeAll()
//                    self.descriptionArray.removeAll()
                    self.postArray.removeAll()
                    
                    for document in snapshot!.documents {
                        //                        let documentId = document.documentID
                        if let imageUrl = document.get("imageURL") as? String {
//                            self.imageArray.append(imageUrl)
                            if let description = document.get("description") as? String {
    //                            self.descriptionArray.append(description)
                                if let email = document.get("email") as? String {
        //                            self.emailArray.append(email)
                                    self.newPost = Post(email: email, description: description, imageUrl: imageUrl)
                                    self.postArray.append(self.newPost)
                                }
                            }
                        }
                       
                        
                        
                    }
                    self.tableViewController.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return emailArray.count
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailText.text = postArray[indexPath.row].email
        cell.postImageView.sd_setImage(with: URL(string: postArray[indexPath.row].imageUrl))
        cell.descriptionText.text = postArray[indexPath.row].description
//        cell.emailText.text = emailArray[indexPath.row]
//        cell.descriptionText.text = descriptionArray[indexPath.row]
//        cell.postImageView.sd_setImage(with: URL(string: self.imageArray[indexPath.row]))
        return cell
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
