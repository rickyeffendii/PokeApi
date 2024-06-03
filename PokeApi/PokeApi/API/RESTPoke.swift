//
//  RESTPoke.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

class RESTPoke: RESTPokeProtocol {
    static let shared: RESTPoke = RESTPoke()
    
    func getAllPokemon() -> [Pokemon] {
        // Add code to handle APIs
        
        return []
    }
    
    func getRandomMoves(pokemon: Pokemon) -> [Move] {
        var moves = Set<Int>()
        while moves.count < 4 {
            moves.insert(Int.random(in: 0...pokemon.availableMoves.count - 1))
        }
        
        let movelist: [Move] = moves.map { index in
            pokemon.availableMoves[index]
        }
        
        return movelist
    }
    
    func catchPokemon() -> Bool {
        return Bool.random()
    }
}
