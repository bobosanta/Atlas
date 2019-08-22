//
//  ViewController.swift
//  Atlas
//
//  Created by Dan Pop on 17/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var moonImageView: UIImageView!
    @IBOutlet weak var orbitImageView: UIImageView!
    @IBOutlet weak var globeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        view.addGestureRecognizer(tap)
        
    }
    
    func hideKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
                
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

