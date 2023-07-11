//
//  ContactRow.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 09/07/2023.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact

    var body: some View {
        NavigationLink {
            ContactView(contact: contact)
        } label: {
            HStack(spacing: 16) {
                contact.transformedImage?
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(contact.name)
                        .fontWeight(.semibold)
                    
                    Text(contact.job)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
