//
//  Favourites.swift
//  Atlas
//
//  Created by Dan Pop on 09/09/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation
import RealmSwift

class Favourites: Object {
    @objc dynamic var name: String = ""
    let countries = List<Country>()
}
