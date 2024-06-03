//
//  PokemonDetailViewModel.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 01/06/24.
//

import Foundation
import UIKit

class PokemonDetailViewModel {
    private let pokemon: Pokemon
    private let sessionHandler: SessionHandlerProtocol
    
    init(pokemon: Pokemon, sessionHandler: SessionHandlerProtocol = SessionHandler.shared) {
        self.pokemon = pokemon
        self.sessionHandler = sessionHandler
    }
    
    func getPokemonImage() -> UIImage? {
        let url: URL = URL(fileURLWithPath: pokemon.image)
        var image: UIImage?
        sessionHandler.getData(from: url) { result, response, error in
            guard let result = result else {
                image = nil
                return
            }
            
            if let response = response {
                print("getPokemonImage response: \(response)")
            }
            
            if let error = error {
                print("getPokemonImage error: \(error)")
            }
            
            image = UIImage(data: result)
        }
        return image
    }
    
    func getPokemon() -> Pokemon {
        return pokemon
    }
}
