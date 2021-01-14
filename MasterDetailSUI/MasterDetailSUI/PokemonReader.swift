//
//  PokemonReader.swift
//  MasterDetailSUI
//
//  Created by Mobile on 10/29/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation

struct Pokemon : Codable, Identifiable {
    
    let name: String
    let pokedexNum: String
    let type: String
    let firstEV: String
    let secondEV: String
    let generation: String
    
    let id = UUID()
    
}

struct PokemonReader {
    
    let items:[Pokemon]
    
    init(_ file:String) {
        // Find the file in our project:
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("Data could not be found")
        }
        
        // Load the file into a Swift data type
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Data could not be loaded from its file location")
        }
        
        // Decode the data into Question objects
        let decoder = JSONDecoder()
        guard let tempJSON = try? decoder.decode([Pokemon].self, from: data) else {
            fatalError("Failed to decode JSON")
        }
        
        self.items = tempJSON
    }
    
}
