//
//  ViewController.swift
//  sign in
//
//  Created by Razan Abdullah on 14/09/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Variables
    let db = Firestore.firestore()
    
    // IBOutlet Button
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    // IBOutlet TextField
    @IBOutlet weak var emaill: UITextField!
    @IBOutlet weak var passwordd: UITextField!
    
    // IBOutlet TextField
    @IBOutlet weak var emailRequirement: UILabel!
    @IBOutlet weak var passwordRequirement: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emaill.delegate = self
        passwordd.delegate = self
        
        // Hide Label
        emailRequirement.isHidden = true
        passwordRequirement.isHidden = true
        
        signIn.layer.cornerRadius = 8
        signUp.layer.cornerRadius = 8
    }
    
    @IBAction func signIn(_ sender: Any) {
        let email = emaill.text!
        let password = passwordd.text!
        
        //MARK: check the textField not empty
        guard email.isEmpty == false else{
            emailRequirement.isHidden = false
            return
        }
        
        guard password.isEmpty == false else{
            passwordRequirement.isHidden = false
            return
        }
        
        //MARK: Sign in 
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            guard error == nil else{
                print("Error: \(error!.localizedDescription)")
                return
            }
            
            if Auth.auth().currentUser != nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
                self.present(vc, animated: true)

            }else{
                let alert = UIAlertController(title: "تنبيه", message: "عفواً، أنت غير مسجل بالفعل", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "موافق", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
    }
    

    
}

