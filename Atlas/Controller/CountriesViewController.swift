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
                
                for country:[String:Any] in responseData {
                    if let name = country["name"] as? String,
                        let capital = country["capital"] as? String {
                    
                        let country = Country(name: name, capital: capital)
                        self.countriesArray.append(country)
                    }
                }
                self.countriesTableView.reloadData()
            }
        }
    }
    
    //Write the updateWeatherData method here:
    func updateCountryData(json: JSON) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
