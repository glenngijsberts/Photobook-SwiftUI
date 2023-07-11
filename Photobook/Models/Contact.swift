//
//  Contact.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 08/07/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Contact: Codable, Comparable, Identifiable {
    let id: UUID
    let name: String
    let job: String
    let image: Data
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
    
    var transformedImage: Image? {
        guard let uiImage = UIImage(data: image) else { return nil }
        
        return Image(uiImage: uiImage)
    }
}
