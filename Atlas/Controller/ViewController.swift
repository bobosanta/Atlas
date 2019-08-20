//
//  ViewController.swift
//  Atlas
//
//  Created by Dan Pop on 17/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                //success
                print("Registration successful")
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tabBarcontroller") as! UITabBarController
                UIApplication.shared.keyWindow?.rootViewController = viewController
            }
        }

    }
    
    @IBAction func signupFacebookTapped(_ sender: Any) {
    }
    
    @IBAction func signupGoogleTapped(_ sender: Any) {
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
}

