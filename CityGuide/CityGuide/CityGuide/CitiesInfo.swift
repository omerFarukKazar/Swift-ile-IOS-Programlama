//
//  CitiesInfo.swift
//  CityGuide
//
//  Created by Ömer Faruk Kazar on 27.08.2022.
//

import Foundation
import UIKit

class Cities {
    let name: String
    let imageName: String
    let region: String
    
    init(name: String, imageName: String, region: String) {
        self.name = name
        self.imageName = imageName
        self.region = region
    }
}

