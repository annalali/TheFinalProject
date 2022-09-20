//
//  signUpViewController.swift
//  sign in
//
//  Created by Razan Abdullah on 15/09/2022.
//

import UIKit
import Firebase
import FirebaseAuth


class signUpViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Variables
    let db = Firestore.firestore()
    
    // IBOutlet Button
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    // IBOutlet TextField
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rePassword: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    // IBOutlet Label
    @IBOutlet weak var emailrequired: UILabel!
    @IBOutlet weak var passwordRequired: UILabel!
    @IBOutlet weak var rePasswordRequired: UILabel!
    @IBOutlet weak var fullNameRequired: UILabel!
    @IBOutlet weak var phoneNumberRequired: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        password.delegate = self
        rePassword.delegate = self
        fullName.delegate = self
        phoneNumber.delegate = self
        
        // Hide Label
        emailrequired.isHidden = true
        passwordRequired.isHidden = true
        rePasswordRequired.isHidden = true
        fullNameRequired.isHidden = true
        phoneNumberRequired.isHidden = true
        
        signIn.layer.cornerRadius = 8
        signUp.layer.cornerRadius = 8
    }
    
    
    
    @IBAction func signUp(_ sender: Any) {
        let Email = email.text!
        let Password = password.text!
        let RePassword = rePassword.text!
        let FullName = fullName.text!
        let PhoneNumber = phoneNumber.text!
        let City = city.text!
        let Gender = gender.text!
        
        
    
        //MARK: check the textField not empty
        guard Email.isEmpty == false else{
            emailrequired.isHidden = false
            return
        }
        
        guard Password.isEmpty == false else{
            passwordRequired.isHidden = false
            return
        }
        
        guard RePassword.isEmpty == false else{
            rePasswordRequired.isHidden = false
            return
        }
        
        guard FullName.isEmpty == false else{
            fullNameRequired.isHidden = false
            return
        }
        
        guard PhoneNumber.isEmpty == false else{
            phoneNumberRequired.isHidden = false
            return
        }
        
        //MARK: Create User 
        Auth.auth().createUser(withEmail: Email, password: Password ) { result, error in
            guard error == nil else{
                print("Error: \(error!.localizedDescription)")
                return
            }
            
            //MARK: Add information of user in Firebase
            self.db.collection("Users").document(result!.user.uid).setData([
                "fullName" : "\(FullName)",
                "phoneNumber" : "\(PhoneNumber)",
                "city" : "\(City)",
                "gender" : "\(Gender)"
            ]){ error in
                guard error == nil else{
                    print("Error: \(error!.localizedDescription)")
                    return
                }
                
            }
            
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signIn") as! ViewController
        self.present(vc, animated: true)
    }
    
    
    
}


