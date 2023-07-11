//
//  ContactLocationView.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 11/07/2023.
//

import SwiftUI
import MapKit

struct ContactLocationView: View {
    var contact: Contact
    
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        Map(coordinateRegion: $viewModel.mapRegion, annotationItems: [contact]) { _ in
            MapMarker(coordinate: contact.coordinate)
        }
        .ignoresSafeArea()
    }
    
    init(contact: Contact) {
        self.contact = contact
        
        _viewModel = StateObject(wrappedValue: {
            ViewModel(contact: contact)
        }())
    }
}
