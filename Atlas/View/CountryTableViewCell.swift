//
//  CountryTableViewCell.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import SVGKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    
    
    func configure(with country: Country) {
        countryName.text = country.name
        countryCapital.text = country.capital
        countryRegion.text = country.region
    
    }
    
}
