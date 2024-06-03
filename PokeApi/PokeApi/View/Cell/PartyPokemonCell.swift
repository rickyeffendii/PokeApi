//
//  PartyPokemonCell.swift
//  PokeApi
//
//  Created by Akhmad Muzaki on 02/06/24.
//

import UIKit

class PartyPokemonCell: UITableViewCell {
    let pokemon: OwnedPokemon

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    init(pokemon: OwnedPokemon) {
        self.pokemon = pokemon
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

