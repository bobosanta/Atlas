//
//  CountryDetailsViewController.swift
//  Atlas
//
//  Created by Dan Pop on 19/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import SVGKit

class CountryDetailsViewController: UIViewController {

    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var subregionLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var country: Country!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
   private func updateUI() {
    
    capitalLabel.text = "Capital : " + country.capital
    subregionLabel.text = country.subregion
    populationLabel.text = String(country.population)
    currencyLabel.text = String(country.currency)
    
    flagImage.layer.cornerRadius = flagImage.frame.size.width / 2
    flagImage.clipsToBounds = true
    
    if let flagUrl = URL(string: country.flag) {
    DispatchQueue.main.async {
            self.flagImage.image = SVGKImage(contentsOf: flagUrl).uiImage
        }
    }
    
    }
    

    
}
