//
//  ViewController.swift
//  TapBar
//
//  Created by sarahAldosari on 20/02/1444 AH.
//

import UIKit

class ObjecDetection: UIViewController ,UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var takePhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takePhoto.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TakePhoto(_ sender: Any) {
        
        showPhotoAlert()
    }
    func showPhotoAlert(){
        let alert = UIAlertController(title: "Take photo From:", message:  nil, preferredStyle:  .actionSheet)
        alert.addAction(UIAlertAction(title:  "Camera", style:  .default, handler:  {action
            in
            self.getPhoto(type:.camera)
        }))
        
        
        alert.addAction(UIAlertAction(title:  "Photo Library", style:  .default, handler:  {action
            in
            self.getPhoto(type:.photoLibrary)
        }))
        
        
        alert.addAction(UIAlertAction(title:  "Cansel", style:  .cancel, handler:  nil))
        present(  alert, animated:  true ,completion:  nil)
    }
    
    func getPhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present( picker , animated:  true , completion:  nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated:  true , completion:  nil)
       guard let images = info[.originalImage] as? UIImage else {
           print( "image not found")
           return
       }
           
            image.image = images
            
        }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated:  true , completion:  nil)
    }
    }
    
    
    


        
        
    
    
    
    


