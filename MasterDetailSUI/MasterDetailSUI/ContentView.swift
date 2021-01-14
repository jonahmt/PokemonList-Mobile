//
//  ContentView.swift
//  MasterDetailSUI
//
//  Created by Mobile on 10/29/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let pokemonList = PokemonReader("pokemon.json").items
    @State var sortIdx = 0
    let sortTypes = ["Generation", "Type", "Alphabetical"]
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(self.pokemonList.sorted(by: {
                    switch sortTypes[sortIdx] {
                    case "Generation":
                        return $0.pokedexNum < $1.pokedexNum
                    case "Type":
                        return $0.type < $1.type
                    case "Alphabetical":
                        return $0.name < $1.name
                    default:
                        return $0.pokedexNum < $1.pokedexNum
                    }
                })) {
                    pokemon in
                    NavigationLink(destination: PokemonView(pokemon: pokemon), label: {
                        Image(pokemon.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        Text(pokemon.name)
                    })
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Starter Pokemon", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.changeSort()
            }, label:
                {Text(sortTypes[sortIdx])
            }))
        }
        
    }
    
    func changeSort() {
        self.sortIdx += 1
        self.sortIdx %= 3
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
