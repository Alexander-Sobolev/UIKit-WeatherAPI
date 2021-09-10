//
//  AddCity.swift
//  Weather
//
//  Created by Alexander Sobolev on 10.09.2021.
//

import UIKit

extension UIViewController {
    
    
    func alertPlusCity(name: String, placholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .default) { action in
            
            let tf = alertController.textFields?.first
            guard let text = tf?.text else { return }
            completionHandler(text)
        }
        
        alertController.addTextField { (tf) in
            tf.placeholder = placholder
        }
        
        let alertCanxel = UIAlertAction(title: "Отмена", style: .default) { _ in  }
        
        alertController.addAction(alertOK)
        alertController.addAction(alertCanxel)
        present(alertController, animated: true, completion: nil)
    }
}
