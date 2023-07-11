//
//  FileManager.swift
//  Photobook
//
//  Created by Glenn Gijsberts on 09/07/2023.
//

import Foundation

extension FileManager {
    static var documentsDirecotry: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

