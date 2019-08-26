//
//  Country.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation
import UIKit

class Country {
    
    var name: String = ""
    var capital: String = ""
//    var currency: Int = 0
    var region: String = ""
    var flag: String = ""
    var subregion: String = ""
    var population: Int = 0
 
    init(name: String, capital: String, region: String, flag: String, subregion: String, population: Int) {
        self.name = name
        self.capital = capital
        self.region = region
        self.flag = flag
        self.subregion = subregion
        self.population = population
//        self.currency = currency
    }
    
}
