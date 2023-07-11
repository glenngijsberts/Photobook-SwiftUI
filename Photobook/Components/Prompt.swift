//
//  Prompt.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 08/07/2023.
//

import SwiftUI

struct Prompt: View {
    struct PromptButton {
        let label: String
        let onTap: () -> Void
    }
    
    let graphic: String
    let title: String
    let text: String
    let button: PromptButton
    
    let color: Color
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 16) {
                VStack {
                    Image(systemName: graphic)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 40)
                .padding(16)
                .background(color)
                .clipShape(Circle())
                
                VStack(alignment: .center, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(text)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                Button {
                    button.onTap()
                } label: {
                    Text(button.label)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(color)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            
            Spacer()
        }
        .padding()
    }
}
