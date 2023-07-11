//
//  ContactLocationModel.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 09/07/2023.
//

import Foundation
import MapKit

extension ContactLocationView {
    @MainActor class ViewModel: ObservableObject {
        @Published var contact: Contact
        @Published var mapRegion: MKCoordinateRegion
        
        init(contact: Contact) {
            _contact = Published(initialValue: contact)
            
            _mapRegion = Published(initialValue: MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: contact.coordinate.latitude, longitude: contact.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
            ))
        }
    }
}
