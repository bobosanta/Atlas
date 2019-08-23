//
//  Country.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation

class Country {
    
    var name: String = ""
    var capital: String = ""
    var currency = ""
    var region: String = ""
 
    init(name: String, capital: String, region: String) {
        self.name = name
        self.capital = capital
        self.region = region
    }
    
}
