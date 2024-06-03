//
//  PokemonDetailView.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 02/06/24.
//

import UIKit

class PokemonDetailView: UIView {

    private let pokemon: Pokemon
    private let viewModel: PokemonDetailViewModel
    private let restPoke: RESTPokeProtocol
    
    private let image: UIImage
    private let name = UILabel()
    private let type1 = UILabel()
    private let type2 = UILabel()
    private let abilityTitle = UILabel()
    private let abilityDesc = UILabel()
    private let moves = UILabel()
    private let weight = UILabel()
    private let catchButton = UIButton()
    
    var onCatchPokemon: ((Pokemon) -> Void)?
    
    init(viewModel: PokemonDetailViewModel, restPoke: RESTPokeProtocol = RESTPoke.shared) {
        self.pokemon = viewModel.getPokemon()
        self.viewModel = viewModel
        self.restPoke = restPoke
        self.image = viewModel.getPokemonImage() ?? UIImage() // handle placeholder image
        
        super.init()
        
        self.configureLayout()
        self.configureLabel()
        self.configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        // Handle layout configuration
    }
    
    private func configureLabel() {
        name.text = pokemon.name
        type1.text = pokemon.type1.rawValue
        type2.text = pokemon.type2?.rawValue
        abilityTitle.text = pokemon.ability.name
        abilityDesc.text = pokemon.ability.description
        weight.text = "\(pokemon.weight) lbs"
        moves.text = "Moves: "
        moves.numberOfLines = 0
        
        for move in pokemon.availableMoves {
            moves.text = moves.text ?? "" + "\n\(move.moveName)"
        }
    }
    
    private func configureButton() {
        catchButton.setTitle("CATCH (50% Rate)", for: .normal)
        catchButton.addTarget(self, action: #selector(catchPokemon), for: .touchUpInside)
    }
    
    @objc func catchPokemon() {
        if restPoke.catchPokemon() {
            self.onCatchPokemon?(pokemon)
        }
    }
}
