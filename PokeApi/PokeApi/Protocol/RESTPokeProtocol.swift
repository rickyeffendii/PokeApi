//
//  RESTPokeProtocol.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation

protocol RESTPokeProtocol {
    func getAllPokemon() -> [Pokemon]
    func getRandomMoves(pokemon: Pokemon) -> [Move]
    func catchPokemon() -> Bool
}
