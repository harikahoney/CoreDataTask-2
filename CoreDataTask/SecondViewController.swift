//
//  SecondViewController.swift
//  CoreDataTask
//
//  Created by Sagi Harika on 20/12/19.
//  Copyright © 2019 Sagi Harika. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    //declaration of components
    @IBOutlet weak var imgButton: UIButton!
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    var imagePicker = UIImagePickerController()

    var imageInData:Data!
    
    
           
    override func viewDidLoad()
    {
        
        
        super.viewDidLoad()
        
        imgButton.layer.cornerRadius = 85
        
        imgButton.clipsToBounds = true
        
       
        
        nameTF.keyboardType = .asciiCapable
        ageTF.keyboardType = .numberPad
        emailTF.keyboardType = .emailAddress
           
    
        
    }
    
    
     //button to choose image
    @IBAction func galleryBtn(_ sender: Any)
    {
    
    if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){
              imagePicker.delegate = self
              imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
              imagePicker.allowsEditing = true
              self.present(imagePicker, animated: true, completion: nil)
          }
      }
      
      
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
      {
          
          if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
          {
            
            print(pickedImage)
            
          
           imgButton.setBackgroundImage(pickedImage, for: UIControl.State.normal)
            
            imageInData = pickedImage.pngData()
          }
          
             dismiss(animated: true, completion: nil)
      }
      
      

      
    
    
    
    
    
    
    
    //insert function when click on save button
    @IBAction func saveBtn(_ sender: Any)
    {
        CRUD.insertValue(entitiyName: "Details", key1: "name", value1:nameTF.text!, key2: "email", value2: emailTF.text!, key3: "age", value3: Int16(ageTF.text!)!, key4: "picture", value4: imageInData)
        
    }
 
    
    

}
