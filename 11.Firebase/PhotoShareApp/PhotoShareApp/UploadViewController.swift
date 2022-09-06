//
//  UploadViewController.swift
//  PhotoShareApp
//
//  Created by Ömer Faruk Kazar on 5.09.2022.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth
import WebKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoImageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        
        photoImageView?.addGestureRecognizer(gestureRecognizer)
        
        
    }
    
    @objc func pickImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .savedPhotosAlbum
        picker.allowsEditing = true
        present(picker, animated: true)
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
        
    }
    
    
    @IBAction func uploadButtonPressed(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        if let data = photoImageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { storageMetadata, error in
                if error != nil {
                    self.promptErrorMessage(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                } else {
                    imageReference.downloadURL { [self] (url, errpr) in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            if let imageUrl = imageUrl
                            {
                                let firestoreDatabase = Firestore.firestore()
                                var firestorePost = ["imageURL" : imageUrl, "description" : self.descriptionTextField.text!, "email" : Auth.auth().currentUser!.email, "date" : FieldValue.serverTimestamp()] as [String : Any]
                                
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost) { (error) in
                                    if error != nil {
                                        self .promptErrorMessage(title: "Error", message: error?.localizedDescription ?? "Unknown Error")
                                    } else {
                                        self.photoImageView.image = UIImage(named:"Choose image")
                                        self.descriptionTextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                                
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    func promptErrorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
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
