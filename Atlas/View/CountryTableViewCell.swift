//
//  CountryTableViewCell.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import SVGKit
import SwipeCellKit

class CountryTableViewCell: SwipeTableViewCell {
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryRegion: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    func configure(with country: Country) {
        countryName.text = country.name
        countryCapital.text = country.capital
        countryRegion.text = country.region
        self.updateUI()
    }
    
    func updateUI() {
        
        cardView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        cardView.layer.cornerRadius = 5.0
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor =     UIColor.black.withAlphaComponent(0.2).cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowOpacity = 0.6
    }
    
}
