//
//  CountryDetailsViewController.swift
//  Atlas
//
//  Created by Dan Pop on 19/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
   private func updateUI() {
        
        nameLabel.text = country.name
        
    }
    

    
}
