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

class CountriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var countriesArray = [Country]()
    var selectedCountry: Country?
    
    @IBOutlet weak var countriesTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        countriesTableView.delegate = self
        countriesTableView.dataSource = self
        
        getCountriesData()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        
        
        let country = countriesArray[indexPath.row]
        cell.configure(with: country)
        
        return cell
        
    }
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getCountriesData() {
        
        Alamofire.request("https://restcountries.eu/rest/v2/all").responseJSON { (responseData) -> Void in
            
            if let responseData = responseData.result.value as! [[String: Any]]? {
                
                for countryDictionary:[String:Any] in responseData {
                    if let name = countryDictionary["name"] as? String,
                        let capital = countryDictionary["capital"] as? String {
//                        let currency = countryDictionary["currency"] as? String
                    
                        let country = Country(name: name, capital: capital)
                        self.countriesArray.append(country)
                    }
                }
                self.countriesTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCountry = countriesArray[indexPath.row]
        
        performSegue(withIdentifier: "showCountryDetails", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? CountryDetailsViewController {
            
            vc.country = selectedCountry
            
        }
        
    }

}
