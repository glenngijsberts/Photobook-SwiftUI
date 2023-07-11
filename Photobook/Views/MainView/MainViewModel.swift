//
//  MainViewModel.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 09/07/2023.
//

import Foundation

extension MainView {
    @MainActor class ViewModel: ObservableObject {
        @Published var showManageContactView = false
        
        @Published var contacts: [Contact]
        
        let savePath = FileManager.documentsDirecotry.appendingPathComponent("contacts")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                contacts = try JSONDecoder().decode([Contact].self, from: data)
            } catch {
                contacts = []
            }
        }
        
        var hasContacts: Bool {
            contacts.isNotEmpty
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(contacts)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save")
            }
        }
        
        func add(_ contact: Contact) {
            contacts.append(contact)
            
            save()
        }
        
        func clear() {
            contacts.removeAll()
            
            do {
                let data = try JSONEncoder().encode(contacts)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to clear")
            }
        }
    }
}
