//
//  PokemonView.swift
//  MasterDetailSUI
//
//  Created by Mobile on 10/29/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack{
            Spacer()
            Text(pokemon.name)
                .font(.system(size: 30))
                .bold()
                .padding(3)
            Image(pokemon.name)
                .padding(2)
            List {
                HStack {
                    Text("Pokedex Number: ")
                    Spacer()
                    Text(pokemon.pokedexNum)

                }
                HStack {
                    Text("Type: ")
                    Spacer()
                    Text(pokemon.type)
                }
                HStack {
                    Text("First Evolution: ")
                    Spacer()
                    Text(pokemon.firstEV)
                }
                HStack {
                    Text("Second Evolution: ")
                    Spacer()
                    Text(pokemon.secondEV)
                }
                HStack {
                    Text("First Appeared in Generation: ")
                    Spacer()
                    Text(pokemon.generation)
                }
            }
            .listRowInsets(.some(.init(top: 1, leading: 10, bottom: 1, trailing: 10)))
            .listStyle(GroupedListStyle())
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: PokemonReader("pokemon.json").items[0])
    }
}
