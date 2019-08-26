//
//  CountriesViewController.swift
//  Atlas
//
//  Created by Dan Pop on 18/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import SVGKit

class CountriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var countriesArray = [Country]()
    var selectedCountry: Country?
    var currentCountryArray = [Country]() //update array
    
    @IBOutlet weak var countriesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        setUpSearchBar()
        getCountriesData()
        
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
        
        let font = UIFont.systemFont(ofSize: 10)
        searchBar.setScopeBarButtonTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : font], for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCountryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        
        let country = currentCountryArray[indexPath.row]
        cell.configure(with: country)
        
        return cell
        
    }
    
    //MARK: - Search bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentCountryArray = countriesArray.filter({ country -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty { return true }
                return country.name.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty { return country.region == "Africa" }
                return country.name.lowercased().contains(searchText.lowercased()) &&
                country.region == "Africa"
            case 2:
                if searchText.isEmpty { return country.region == "Americas" }
                return country.name.lowercased().contains(searchText.lowercased()) &&
                    country.region == "Americas"
            case 3:
                if searchText.isEmpty { return country.region == "Asia" }
                return country.name.lowercased().contains(searchText.lowercased()) &&
                    country.region == "Asia"
            case 4:
                if searchText.isEmpty { return country.region == "Europe" }
                return country.name.lowercased().contains(searchText.lowercased()) &&
                    country.region == "Europe"
            case 5:
                if searchText.isEmpty { return country.region == "Oceania" }
                return country.name.lowercased().contains(searchText.lowercased()) &&
                    country.region == "Oceania"
            case 6:
                if searchText.isEmpty { return country.region == "Polar" }
                return country.name.lowercased().contains(searchText.lowercased()) &&
                    country.region == "Polar"
            default:
                return false
            }
        })
        countriesTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentCountryArray = countriesArray
        case 1:
            currentCountryArray = countriesArray.filter({ country -> Bool in
                country.region == "Africa"
            })
        case 2:
            currentCountryArray = countriesArray.filter({ country -> Bool in
                country.region == "Americas"
            })
        case 3:
            currentCountryArray = countriesArray.filter({ country -> Bool in
                country.region == "Asia"
            })
        case 4:
            currentCountryArray = countriesArray.filter({ country -> Bool in
                country.region == "Europe"
            })
        case 5:
            currentCountryArray = countriesArray.filter({ country -> Bool in
                country.region == "Oceania"
            })
        case 6:
            currentCountryArray = countriesArray.filter({ country -> Bool in
                country.region == "Polar"
            })
        default:
            break
        }
        countriesTableView.reloadData()
    }
    
    //MARK: Keyboard dismiss
    func dismissKeyboard() {
        searchBar.text = ""
        countriesTableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    
    // MARK: Cancel button tapped in search
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentCountryArray = countriesArray
        dismissKeyboard()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
    
    //MARK: - Networking
    /***************************************************************/

    func getCountriesData() {
        
        Alamofire.request("https://restcountries.eu/rest/v2/all").responseJSON { (responseData) -> Void in
            
            if let responseData = responseData.result.value as! [[String: Any]]? {
                
                for countryDictionary:[String:Any] in responseData {
                    if let name = countryDictionary["name"] as? String,
                        let capital = countryDictionary["capital"] as? String,
                        let region = countryDictionary["region"] as? String,
                        let flagUrlString = countryDictionary["flag"] as? String,
                        let subregion = countryDictionary["subregion"] as? String,
                        let population = countryDictionary["population"] as? Int {
                        
                            let country = Country(name: name, capital: capital, region: region, flag: flagUrlString, subregion: subregion, population: population)
                        
                            self.currentCountryArray = self.countriesArray
                            self.countriesArray.append(country)
                    }
                }
                self.countriesTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCountry = currentCountryArray[indexPath.row]
        
        performSegue(withIdentifier: "showCountryDetails", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? CountryDetailsViewController {
            
            vc.title = selectedCountry?.name
            
            vc.country = selectedCountry
            
        }
        
    }

}
