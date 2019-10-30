//
//  FavouritesTableViewController.swift
//  Atlas
//
//  Created by Dan Pop on 12/09/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class FavouritesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwipeTableViewCellDelegate {

    let realm = try! Realm()
    var favouriteCountries = [Country]()
    var selectedCountry: Country?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpFavouriteCountries()
    }

    // MARK: - Table view data source

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return favouriteCountries.isEmpty ? 1 : favouriteCountries.count
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favouriteCountries.count
        return favouriteCountries.isEmpty ? 1 : favouriteCountries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !favouriteCountries.isEmpty, let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCountry", for: indexPath) as? CountryTableViewCell {
            
            let country = favouriteCountries[indexPath.row]
            cell.configure(with: country)
            cell.delegate = self
            
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "No countries added yet."
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !favouriteCountries.isEmpty {
            selectedCountry = favouriteCountries[indexPath.row]
            performSegue(withIdentifier: "showCountryDetails", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let country = self.favouriteCountries[indexPath.row]
        let favouriteAction = SwipeAction(style: .default, title: country.favourite ? "Unfavourite" : "Favourite") { action, indexPath in
            do {
                try self.realm.write {
                    country.favourite = !country.favourite
                    self.setUpFavouriteCountries()
                }
            } catch {
                print("Error updating realm \(error)")
            }
        }
        
        // customize the action appearance
        //        favouriteAction.image = UIImage(named: "delete")
        
        
        return [favouriteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .selection
        options.transitionStyle = .border
        return options
    }
    
    func setUpFavouriteCountries() {
        favouriteCountries = Array(realm.objects(Country.self).filter("favourite = %@", true))
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? CountryDetailsViewController {
            
            vc.title = selectedCountry?.name
            
            vc.country = selectedCountry
            
        }
        
    }
    
}
