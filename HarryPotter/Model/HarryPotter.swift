//
//  HarryPotter.swift
//  HarryPotter
//
//  Created by Victor Monteiro on 6/17/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import Foundation

struct HarryPotter: Decodable {
    
    let name: String
    let house: String?
    let image: URL
    let actor: String
    let alive: Bool

}
