//
//  AddContactView.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 09/07/2023.
//

import SwiftUI

struct AddContactView: View {
    @StateObject private var viewModel = ViewModel()
    
    var onSave: (Contact) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                HStack(alignment: .center) {
                    Spacer()
                    
                    VStack(spacing: 8) {
                        if viewModel.inputImage != nil {
                            Image(uiImage: viewModel.inputImage!)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 88, height: 88)
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 88, height: 88)
                                .foregroundColor(.secondary)
                        }
                        
                        Button("Add photo") {
                            viewModel.showingImagePicker.toggle()
                        }
                        .font(.footnote)
                    }
                    
                    Spacer()
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                
                Section {
                    TextField("Name", text: $viewModel.name)
                    TextField("Profession", text: $viewModel.job)
                }
                
                Section {
                    Button("Save contact") {
                        let contact = viewModel.handleSave()
                        
                        guard let savedContact = contact else { return }
                        
                        onSave(savedContact)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            .navigationTitle("Manage contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    
    init(onSave: @escaping (Contact) -> Void) {
        self.onSave = onSave
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView() { _ in }
    }
}
