//
//  GetCitiesWeather.swift
//  Weather
//
//  Created by Alexander Sobolev on 10.09.2021.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], completitionHandler: @escaping (Int, Weather) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getcoordinateFrom(city: item) { coordinate, error in
            guard let coordinate = coordinate, error == nil else { return }
            
            networkWeatherManager.fethWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                completitionHandler(index, weather)
            }
        }
    }
}



func getcoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) ->()) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion((placemark?.first?.location!.coordinate)!, error)
    }
}
