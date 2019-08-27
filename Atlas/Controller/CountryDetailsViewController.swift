//
//  CountryDetailsViewController.swift
//  Atlas
//
//  Created by Dan Pop on 19/08/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import UIKit
import SVGKit
import MapKit

class CountryDetailsViewController: UIViewController {

    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var subregionLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var country: Country!
    
    let regionInMeters: Double = 100000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        displayLocation()
        updateUI()
        
    }
    
    func displayLocation() {

        mapView.layer.cornerRadius = 20
        
        let countryLocation = CLLocation(latitude: country.lat, longitude: country.long)
        
        mapView.setCenter(countryLocation.coordinate, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: countryLocation.coordinate.latitude, longitude: countryLocation.coordinate.longitude)
        mapView.addAnnotation(annotation)
        
    }
    
   private func updateUI() {
    
    capitalLabel.text = "Capital : " + country.capital
    subregionLabel.text = country.subregion
    populationLabel.text = String(country.population)
    currencyLabel.text = String(country.currency)
    
    flagImage.layer.cornerRadius = flagImage.frame.size.width / 2
    flagImage.clipsToBounds = true
    
    if let flagUrl = URL(string: country.flag) {
    DispatchQueue.main.async {
            self.flagImage.image = SVGKImage(contentsOf: flagUrl).uiImage
        }
    }
    
    }
    

    
}
