//
//  AddContactModel.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 09/07/2023.
//

import Foundation
import SwiftUI
import CoreLocation

extension AddContactView {
    @MainActor class ViewModel: ObservableObject {
        @Published var name: String
        @Published var job: String
        @Published var image: URL?
        
        @Published var inputImage: UIImage?
        @Published var showingImagePicker = false
        
        let locationFetcher = LocationFetcher()
        
        init() {
            _name = Published(initialValue: "")
            _image = Published(initialValue: nil)
            _job = Published(initialValue: "")
            
            self.locationFetcher.start()
        }
        
        func handleSave() -> Contact? {
            var location: CLLocationCoordinate2D
            
            if let hasLocation = self.locationFetcher.lastKnownLocation {
                location = hasLocation
            } else {
                location = CLLocationCoordinate2D(latitude: 52.377956, longitude: 4.897070)
            }
            
            if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                let contact = Contact(id: UUID(), name: name, job: job, image: jpegData, latitude: location.latitude, longitude: location.longitude)
                
                
                return contact
            } else {
                print("Upload a photo")
                
                return nil
            }
        }
    }
}
