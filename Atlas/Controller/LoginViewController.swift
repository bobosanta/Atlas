//
//  LoginViewController.swift
//  Atlas
//
//  Created by Dan Pop on 17/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tabBarcontroller") as! UITabBarController
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
    }
    

}
