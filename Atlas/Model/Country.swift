//
//  Country.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Country: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var capital: String = ""
    @objc dynamic var currency: String = ""
    @objc dynamic var region: String = ""
    @objc dynamic var flag: String = ""
    @objc dynamic var subregion: String = ""
    @objc dynamic var population: Int = 0
    @objc dynamic var lat: Double = 0
    @objc dynamic var long: Double = 0
    @objc dynamic var favourite: Bool = false
    var parentFavourites = LinkingObjects(fromType: Favourites.self, property: "countries")
 
    convenience init(name: String, capital: String, region: String, flag: String, subregion: String, population: Int, currency: String, lat: Double, long: Double, favourite: Bool) {
        self.init()
        self.name = name
        self.capital = capital
        self.region = region
        self.flag = flag
        self.subregion = subregion
        self.population = population
        self.currency = currency
        self.lat = lat
        self.long = long
    }
    
}
