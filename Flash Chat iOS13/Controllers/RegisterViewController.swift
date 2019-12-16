//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let err = error {
                    let uialert = UIAlertController(title: "Error",
                                                    message: err.localizedDescription,
                                                    preferredStyle: .alert)
                    uialert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(uialert, animated: true, completion: nil)
                } else {
                    // Navigation to ChatViewController
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
                
            }
        }
        
        
    }
    
    
    
    
    
}
