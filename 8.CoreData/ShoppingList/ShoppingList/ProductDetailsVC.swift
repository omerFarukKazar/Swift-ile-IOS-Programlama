//
//  ProductDetailsVC.swift
//  ShoppingList
//
//  Created by Ömer Faruk Kazar on 28.08.2022.
//

import UIKit
import CoreData

class ProductDetailsVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideTheKeyboard)) // Defined the gestureRecognizer.
        view.addGestureRecognizer(gestureRecognizer) // Added gestureRecognizer to desired view
        
        
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImageFromGallery))
        productImageView.isUserInteractionEnabled = true
        productImageView.addGestureRecognizer(imageGestureRecognizer)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        let shopping = NSEntityDescription.insertNewObject(forEntityName: "Shopping", into: context!)
        shopping.setValue(nameTextField.text!, forKey: "product")
        shopping.setValue(sizeTextField.text!, forKey: "size")
        if let price = Int(priceTextField.text!) {
            shopping.setValue(price, forKey: "price")
        }
        shopping.setValue(UUID(), forKey: "id")
        let data = productImageView.image?.jpegData(compressionQuality: 0.5) //Converted image to binary data by compressing it to 0.5 quality of original image.
        shopping.setValue(data, forKey: "image")
        do {
            try context?.save()
            print("Saved")
        } catch {
            print("error")
        }
    }
    
    @objc func hideTheKeyboard() {
        view.endEditing(true)
    }
    
    @objc func chooseImageFromGallery() {
        let picker = UIImagePickerController()
        picker.delegate = self // ProductDetailsVC'ye picker'i delege edebilmesi için yetkilendirdik.
        picker.sourceType = .photoLibrary //
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil) //completion bu işlem tamamlandığında bi şey yapmak istiyor musun diye soruyor.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        productImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}
