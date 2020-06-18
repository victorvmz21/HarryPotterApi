//
//  HarryPotterError.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/17/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import Foundation

enum HarryPotterError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case noImage
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The Server failed to reach the necessary URL"
        case .thrownError(let error):
            return "There was an error: \(error.localizedDescription)"
        case .noData:
            return  "There was no data Found"
        case .noImage:
            return "There was no images Found"
        }
    }
}
