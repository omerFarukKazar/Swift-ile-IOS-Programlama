//
//  UploadViewController.swift
//  ParsePhotoApp
//
//  Created by Ömer Faruk Kazar on 7.09.2022.
//

import UIKit
import Parse

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var shareButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideTheKeyboard))
        imageView.addGestureRecognizer(gestureRecognizer)
        shareButton.isEnabled = false
    }
    
    @objc func hideTheKeyboard() {
        view.endEditing(true)
    }
    
    @objc func chooseImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        shareButton.isEnabled = true
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareButton.isEnabled = false
        
        let post = PFObject(className: "Post")
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        if let data = data {
            if PFUser.current() != nil {
                let parseImage = PFFileObject(name: "image", data: data)
                
                post["Image"] = parseImage
                post["Description"] = descriptionTextField.text
                post["Owner"] = PFUser.current()!.username!
                
                post.saveInBackground { (success, error) in
                    if error != nil {
                        let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Unknown Error", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "OK", style: .default)
                        alert.addAction(okButton)
                        self.present(alert, animated: true)
                    } else {
                        self.descriptionTextField.text = ""
                        self.imageView.image = UIImage(named: "Choose image")
                        self.tabBarController?.selectedIndex = 0
                        
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPost"), object: nil)
                    }
                }
            }
        }
        
    }
    
    
}
