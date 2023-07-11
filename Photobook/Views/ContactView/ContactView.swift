//
//  ContactView.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 11/07/2023.
//

import SwiftUI

struct ContactView: View {
    enum TabView: String, CaseIterable {
        case details, location
    }
    
    @State private var currentView = TabView.details
    
    let contact: Contact
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select tab", selection: $currentView) {
                    ForEach(TabView.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                            .tag($0.self)
                    }
                }
                .pickerStyle(.segmented)
                
                switch currentView {
                case .details:
                    ContactDetailsView(contact: contact)
                case .location:
                    ContactLocationView(contact: contact)
                }
            }
            .padding()
            
            Spacer()
                .navigationTitle(contact.name)
        }
    }
}
