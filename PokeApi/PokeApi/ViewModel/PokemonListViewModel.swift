//
//  PokemonListViewModel.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

class PokemonListViewModel {
    private var pokemonList: [Pokemon]
    private let restAPI: RESTPokeProtocol
    
    init(restAPI: RESTPokeProtocol = RESTPoke.shared) {
        self.restAPI = restAPI
        self.pokemonList = restAPI.getAllPokemon()
    }
    
    func getPokemonFor(page: Int) -> [Pokemon] {
        var newList: [Pokemon] = []
        let startIndex = page * 20
        
        for i in startIndex...startIndex + 19 {
            if i < pokemonList.count {
                newList.append(pokemonList[i])
            } else {
                break
            }
        }
        
        return newList
    }
    
    func getMaxPage() -> Int {
        var maxPage: Int = pokemonList.count / 20
        if pokemonList.count % 20 > 0 {
            maxPage += 1
        }
        
        return maxPage
    }
}
