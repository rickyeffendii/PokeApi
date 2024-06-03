//
//  PartyPokemonViewModel.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

class PartyPokemonViewModel {
    private var ownedPokemons: [OwnedPokemon]
    private let restPoke: RESTPokeProtocol
    
    init(ownedPokemons: [OwnedPokemon], restPoke: RESTPokeProtocol = RESTPoke.shared) {
        self.ownedPokemons = ownedPokemons
        self.restPoke = restPoke
    }
    
    func catchPokemon(pokemon: Pokemon, nickname: String? = nil, level: Int = Int.random(in: 1...100)) {
        let nickname: String = nickname ?? pokemon.name
        let newPokemon = OwnedPokemon(pokemon: pokemon, nickname: nickname, statusCondition: .normal, status: Status(level: level), moves: restPoke.getRandomMoves(pokemon: pokemon), level: level, experience: 0)
    }
    
    func gainExperience(index: Int, exp: Int) {
        ownedPokemons[index].gainExperience(exp: exp)
    }
    
    func renamePokemon(index: Int, exp: Int) {
        ownedPokemons[index].rename()
    }
    
    func getNickname(index: Int) -> String {
        let selectedPokemon = ownedPokemons[index]
        
        if selectedPokemon.isRenamed {
            return selectedPokemon.nickname + " - \(selectedPokemon.currentRename)"
        } else {
            return selectedPokemon.nickname
        }
    }
    
    func getOwnedPokemon() -> [OwnedPokemon] {
        return ownedPokemons
    }
}
