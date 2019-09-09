//
//  ProfileViewController.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        do {
            try! Auth.auth().signOut()
            
            if let storyboard = self.storyboard {
                let vc = storyboard.instantiateViewController(withIdentifier: "loginViewController")
                self.present(vc, animated: false, completion: nil)
            }
            
        } catch {
            print("There was a problem. Signing out..")
        }
        
        
        
    }

}
