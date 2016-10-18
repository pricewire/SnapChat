//
//  SignInViewController.swift
//  SnapChat
//
//  Created by Mark Langlois on 10/17/16.
//  Copyright © 2016 Mark Langlois. All rights reserved.
//

import UIKit
import Firebase


class SignInViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    @IBAction func turnUpTapped(_ sender: AnyObject) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("Hey, We have an error:\(error)")
                
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    
                    if error != nil {
                        print("Hey we have an error:\(error)")
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                    
                })
                
                    } else {
                        
                        print("Created User successfully!")
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
  
            }
        })
    }

}
