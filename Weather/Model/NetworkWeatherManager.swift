//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by Alexander Sobolev on 10.09.2021.
//

import Foundation

struct NetworkWeatherManager {
    
    // Запрос
    func fethWeather(latitude: Double, longitude: Double, completitionHandler: @escaping (Weather) -> Void) {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("Key", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error));
                return
            }
//            print(String(data: data, encoding: .utf8)!)
            if let weather = self.parseJSON(withData: data) {
                completitionHandler(weather)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData =  try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else { return nil }
//            print(weather)
            return weather


        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
