//
//  HarryPotterController.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/17/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import Foundation
import  UIKit.UIImage

struct HarryPotterController {
    
    static func fetchWhiches(completion: @escaping (Result<[HarryPotter],HarryPotterError>) -> Void) {
        
        guard let url = URL(string: Constants.baseURl) else { return }
        let apiEndPointURl = url.appendingPathComponent(Constants.apiEndPoint)
        let finalURL = apiEndPointURl.appendingPathComponent(Constants.charactersEndPoint)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let decoder = JSONDecoder()
                let whiches = try decoder.decode([HarryPotter].self, from: data)
                completion(.success(whiches))
                
            } catch let error {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
        
    }
    static func fetchImages(harryPotter: HarryPotter, completion: @escaping (Result<UIImage,HarryPotterError>) -> Void) {
        
         let imagesURL = harryPotter.image
        
        URLSession.shared.dataTask(with: imagesURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let image = UIImage(data: data) else { return completion(.failure(.noImage)) }
            
            completion(.success(image))
        }.resume()
    }
}
