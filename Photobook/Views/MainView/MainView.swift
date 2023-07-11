//
//  MainView.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 08/07/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if !viewModel.hasContacts {
                    Prompt(
                        graphic: "photo",
                        title: "You don't have any contacts",
                        text: "Have you met someone? Add them as your contact",
                        button: Prompt.PromptButton(label: "Add contact") {
                            viewModel.showManageContactView.toggle()
                        },
                        color: .pink
                    )
                } else {
                    List(viewModel.contacts.sorted()) { contact in
                        ContactRow(contact: contact)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showManageContactView) {
                AddContactView { contact in
                    viewModel.add(contact)
                    viewModel.showManageContactView.toggle()
                }
            }
            .navigationTitle("Photobook")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.showManageContactView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(.pink)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.clear()
                    } label: {
                        Image(systemName: "trash")
                    }
                    .foregroundColor(.pink)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
