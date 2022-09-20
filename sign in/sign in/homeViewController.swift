//
//  homeViewController.swift
//  sign in
//
//  Created by Razan Abdullah on 18/09/2022.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class homeViewController: UIViewController {
   
    let db = Firestore.firestore()
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.collection("Users")
            .getDocuments { querySnapshot, error in
            
           guard error == nil else {
               print(error!.localizedDescription)
                return
            }
           
            
            for doc in querySnapshot!.documents{
                let data = doc.data()
                self.textLabel.text = " مرحبا \(data["fullName"]!)"
             
            }
        }
        
    }
    

   
}
