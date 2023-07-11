//
//  ContactDetailsView.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 11/07/2023.
//

import SwiftUI

struct ContactDetailsView: View {
    let contact: Contact
    
    var body: some View {
        VStack {
            contact.transformedImage?
                .resizable()
                .clipShape(Circle())
                .frame(width: 120, height: 120)
            
            Text(contact.name)
                .font(.title)
                .fontWeight(.semibold)
            Text(contact.job)
                .foregroundColor(.secondary)
                .font(.title2)
                .fontWeight(.medium)
        }
        .padding(.top, 32)
    }
}
