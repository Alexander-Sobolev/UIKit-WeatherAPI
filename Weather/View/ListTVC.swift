//
//  ListTVC.swift
//  Weather
//
//  Created by Alexander Sobolev on 09.09.2021.
//

import UIKit

class ListTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fethWeather()
        
    }
    // Запрос
    func fethWeather() {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=59.932802&lon=30.347810"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("Key", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error));
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        
        
        
        return cell
    }
}
